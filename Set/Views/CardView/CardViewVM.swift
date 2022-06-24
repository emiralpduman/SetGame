//
//  CardViewVM.swift
//  Set
//
//  Created by Emiralp Duman on 24.06.2022.
//

import SwiftUI

class CardViewVM {
    func numberOfShapes(for numberOfShapes: SetCard.Number) -> Int {
        switch numberOfShapes {
        case .one:
            return 1
        case .two:
            return 2
        case .threee:
            return 3
        }
    }
    
    @ViewBuilder func shapeOf(_ shape: SetCard.Shape) -> some View {
        switch shape {
            
        case .diamond:
            Diamond()
                .stroke()
                .foregroundColor(.black)
        case .squiggle:
            Rectangle()
                .stroke()
                .foregroundColor(.black)
        case .oval:
            Ellipse()
                .stroke()
                .foregroundColor(.black)
        }
    }
}
