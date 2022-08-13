//
//  Table.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

class Table: ObservableObject {
    @Published private var game = SetGame()
    
    
    var cards: [SetCard] {
        game.cardsOnTable
    }
    
    var deck: [SetCard] {
        game.deck
    }
    
    var selectionIsSet: Bool {
        game.selectionIsSet
    }
    
    var isEvaluationPeriod: Bool {
        game.IsEvaluationPeriod
    }
    
    var score: Int {
        Int(game.points)
    }
    
    func startNewGame() {
        game = SetGame()
    }

    func select(_ card: SetCard) {
        if game.selectedCards.count < 3 {
            game.select(card)
        }
        else {
            if selectionIsSet {
                game.removeFromTable(cards: game.selectedCards)
                game.dealMore()
                if let _ = game.selectedCards.firstIndex(where: { $0.id == card.id}) {
                    
                }
                else {
                    game.select(card)
                }
            }
            else {
                for element in game.selectedCards {
                    game.select(element)
                }
                game.select(card)
            }
        }
    }
    
    func deal() {
        game.dealMore()
    }
    
    // MARK: -Card
    
    func colorOfCard(_ card: SetCard) -> Color {
        switch card.color {
            
        case.red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
        
    }
    
    func numberOfShapes(of card: SetCard) -> Int {
        switch card.numberOfShapes {
        case .one:
            return 1
        case .two:
            return 2
        case .threee:
            return 3
        }
    }
    
    var cardColorOfDefaultSelection = Color.yellow
    var cardColorOfNotSet = Color.red
    var cardColorOfSet = Color.green
    var cardColorOfNoSelection = Color.black
}

