//
//  TableViewVM.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

class TableViewVM {
    var game = SetGame()
    
    var cards: [SetCard] {
        game.cardsOnTable
    }
}

