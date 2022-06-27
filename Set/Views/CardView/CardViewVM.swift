//
//  CardViewVM.swift
//  Set
//
//  Created by Emiralp Duman on 24.06.2022.
//

import SwiftUI

class CardViewVM {
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
