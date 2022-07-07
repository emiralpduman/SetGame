//
//  Table.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

class Table: ObservableObject {
    @Published var game = SetGame()
    
    
    var cards: [SetCard] {
        game.cardsOnTable
    }
    
    var thereIsSet: Bool {
        game.thereIsSet
    }
    
    var isEvaluationPeriod: Bool {
        game.evaluationPeriod
    }

    func select(_ card: SetCard) {
        if game.selectedCards.count < 3 {
            game.select(card)
        }
        else {
            if thereIsSet {
                game.remove(cards: game.selectedCards)
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
        game.dealBy(SetGame.Rules.amountOfdefaultDeal)
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

