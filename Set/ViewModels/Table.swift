//
//  Table.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

class Table: ObservableObject {
    @Published var game = SetGame()
    var thereIsSet: Bool {
        game.thereIsSet
    }
    

    
    
    var cardColorOfDefaultSelection = Color.yellow
    var cardColorOfNotSet = Color.red
    var cardColorOfSet = Color.green
    var cardColorOfNoSelection = Color.black
    
    func select(_ card: SetCard) {
        if game.selectedCards.count < 3 {
            game.select(card)
        }
        if game.selectedCards.count == 3 {
            if card.isSelected {
                game.select(card)
            }
        }
    }
    
    
    


    
    // MARK: -Card
    
    var cards: [SetCard] {
        game.cardsOnTable
    }
    
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
    
    
    
}

