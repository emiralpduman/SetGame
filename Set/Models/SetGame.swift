//
//  SetGame.swift
//  Set
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation
import SwiftUI

struct SetGame {
    
    var deck = [SetCard]()
    var cardsOnTable = [SetCard]()
    var thereIsSet = false
    
    var selectedCards: [SetCard] {
        var selection = [SetCard]()
        
        for card in cardsOnTable {
            if card.isSelected {
                selection.append(card)
            }
            
        }
        
        return selection
    }
    
    var evaluationPeriod: Bool {
        if selectedCards.count == 3 {
            return true
        } else {
            return false
        }
    }
    
    
    mutating func dealBy(_ number: Int) {
        if deck.count >= number {
            for _ in 0..<number {
                cardsOnTable.append(deck.removeFirst())
            }
        } else {
            for _ in 0..<deck.count {
                cardsOnTable.append(deck.removeFirst())
            }
        }
    }
    
    mutating func select(_ card: SetCard) {
        for index in 0..<cardsOnTable.count {
            if cardsOnTable[index].id == card.id {
                cardsOnTable[index].isSelected.toggle()
                
            }
        }
        if selectedCards.count == 3 {
            if SetGame.Rules.isSet(selectedCards[0], selectedCards[1], selectedCards[2]) {
                thereIsSet = true
            } else {
                thereIsSet = false
            }
            
        }
    }
    
    mutating func removeFromTable(cards: [SetCard]) {
        for card in cards {
            if let indexOfCard = cardsOnTable.firstIndex(where: { $0.id == card.id }) {
                cardsOnTable.remove(at: indexOfCard)
            } else {
                print("indexOfCard = nil @SetGame.remove")
            }
        }
    }
    
    init() {
        for numberOfNewCard in SetCard.Number.allCases {
            for shapeOfNewCard in SetCard.Shape.allCases {
                for shadingOfNewCard in SetCard.Shading.allCases {
                    for colorOfNewCard in SetCard.Color.allCases {
                        deck.append(SetCard(numberOfShapes: numberOfNewCard, shape: shapeOfNewCard, shading: shadingOfNewCard, color: colorOfNewCard))
                    }
                }
            }
        }
        deck.shuffle()
        dealBy(Rules.amountOfFirstDeal)
    }
    
    struct Rules {
        static let numberOfCards: Int = 2
        static let amountOfFirstDeal: Int = 12
        static let amountOfdefaultDeal: Int = 3
        
        static func isSet(_ card1: SetCard, _ card2: SetCard, _ card3: SetCard) -> Bool {
            var numbersAreSet: Bool = false
            var shapesAreSet: Bool = false
            var shadingsAreSet: Bool = false
            var colorsAreSet: Bool = false
            var isSet = false
            
            if card1.numberOfShapes == card2.numberOfShapes {
                if card1.numberOfShapes == card3.numberOfShapes {
                    numbersAreSet = true
                }
            } else if (card1.numberOfShapes != card3.numberOfShapes) && (card2.numberOfShapes != card3.numberOfShapes) {
                numbersAreSet = true
            }
            
            if card1.shape == card2.shape {
                if card1.shape == card3.shape {
                    shapesAreSet = true
                }
            } else if (card1.shape != card3.shape) && (card2.shape != card3.shape) {
                shapesAreSet = true
            }
            
            if card1.shading == card2.shading {
                if card1.shading == card3.shading {
                    shadingsAreSet = true
                }
            } else if (card1.shading != card3.shading) && (card2.shading != card3.shading) {
                shadingsAreSet = true
            }
            
            if card1.color == card2.color {
                if card1.color == card3.color {
                    colorsAreSet = true
                }
            } else if (card1.color != card3.color) && (card2.color != card3.color) {
                colorsAreSet = true
            }
            
            if numbersAreSet && shapesAreSet && shadingsAreSet && colorsAreSet {
                isSet = true
            }
            
            return isSet
        }
    }
    
}
