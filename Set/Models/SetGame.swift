//
//  SetGame.swift
//  Set
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation
import SwiftUI

struct SetGame {
    private static func generateASetDeck () -> [SetCard] {
        var deck: [SetCard] = []
        
        for numberOfNewCard in SetCard.Number.allCases {
            for shapeOfNewCard in SetCard.Shape.allCases {
                for shadingOfNewCard in SetCard.Shading.allCases {
                    for colorOfNewCard in SetCard.Color.allCases {
                        deck.append(SetCard(numberOfShapes: numberOfNewCard, shape: shapeOfNewCard, shading: shadingOfNewCard, color: colorOfNewCard))
                    }
                }
            }
        }
        
        return deck
    }
    private let gameStartingTime: Date = Date.now
    private var timeOfLastSetAttempt: Date?
    
    var deck = [SetCard]()
    var cardsOnTable = [SetCard]()
    var selectedCards: [SetCard] {
        var selection = [SetCard]()
        
        for card in cardsOnTable {
            if card.isSelected {
                selection.append(card)
            }
            
        }
        
        return selection
    }
    var selectionIsSet = false
    var IsEvaluationPeriod: Bool {
        if selectedCards.count == 3 {
            return true
        } else {
            return false
        }
    }
    var thereIsSetOnTable: Bool {
        for firstCard in cardsOnTable {
            var setInstance: Set<SetCard> = []
            setInstance.insert(firstCard)
            
            for secondCard in cardsOnTable {
                if !setInstance.contains(secondCard) {
                    setInstance.insert(secondCard)
                    
                    for thirdCard in cardsOnTable {
                        if !setInstance.contains(thirdCard) {
                            setInstance.insert(thirdCard)
                            
                            if Rules.isSet(firstCard, secondCard, thirdCard) {
                                return true
                            }
                            
                            setInstance.remove(thirdCard)
                        }
                            
                    }
                    
                    setInstance.remove(secondCard)
                }
            }
        }
        return false
    }
    var points: Double = 0
    
    mutating func dealMore() {
        if selectionIsSet {
            for card in selectedCards {
                removeFromTable(cards: [card])
            }
        }
        
        if thereIsSetOnTable {
            points -= Rules.PointPunishmentForMissingASet
        }
        dealBy(SetGame.Rules.amountOfdefaultDeal)
    }
        
    private mutating func dealBy(_ number: Int) {
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
            let selectionTime: Date = Date.now
            var dateDurationBetweenAttemps: Double
            
            if let timeOfLastSetAttempt = timeOfLastSetAttempt {
                dateDurationBetweenAttemps = selectionTime.distance(to: timeOfLastSetAttempt)
            } else {
                dateDurationBetweenAttemps = selectionTime.distance(to: gameStartingTime)
            }
            
            if SetGame.Rules.isSet(selectedCards[0], selectedCards[1], selectedCards[2]) {
                selectionIsSet = true
                points += Rules.PointPrizeForFindingSet / -dateDurationBetweenAttemps
            } else {
                selectionIsSet = false
                points -= Rules.PointPrizeForFindingSet * Rules.PointPunishmentToPrizeRatio * -dateDurationBetweenAttemps
            }
            timeOfLastSetAttempt = Date.now
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
        deck = Self.generateASetDeck()
        deck.shuffle()
        dealBy(Rules.amountOfFirstDeal)
    }
    
    struct Rules {
        static private func setCombinations() -> Set<Set<SetCard>> {
            let deck: [SetCard] = SetGame.generateASetDeck()
            var setOfAllSets: Set<Set<SetCard>> = []
            
            for firstCard in deck {
                var setInstance: Set<SetCard> = []
                setInstance.insert(firstCard)
                
                for secondCard in deck {
                    if !setInstance.contains(secondCard) {
                        setInstance.insert(secondCard)
                        
                        for thirdCard in deck {
                            if !setInstance.contains(thirdCard) {
                                setInstance.insert(thirdCard)
                                
                                if isSet(firstCard, secondCard, thirdCard) {
                                    setOfAllSets.insert(setInstance)
                                }
                                
                                setInstance.remove(thirdCard)
                            }
                                
                        }
                        
                        setInstance.remove(secondCard)
                    }
                }
            }
            
            print("Final count of setOfAllSets = \(setOfAllSets.count)")
            
            return setOfAllSets
        }

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
        
        static let numberOfCards: Int = 2
        static let amountOfFirstDeal: Int = 12
        static let amountOfdefaultDeal: Int = 3
        static let PointPrizeForFindingSet: Double = 100
        static let PointPunishmentToPrizeRatio: Double = 0.01
        static let PointPunishmentForMissingASet: Double = 10
        static let allSetCombinations: Set<Set<SetCard>> = setCombinations()
    }
    
}
