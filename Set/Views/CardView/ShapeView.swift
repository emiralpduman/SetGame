//
//  ShapeView.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

struct ShapeView: View {
    let card: SetCard
    
    var body: some View {
        switch card.shape {
        case .diamond:
            switch card.shading {
            case .striped:
                Diamond()
                    .fill()
                    .opacity(0.5)
                
            case .open:
                Diamond()
                    .stroke()
                
            case .solid:
                Diamond()
                    .fill()
            }
            
        case .squiggle:
            switch card.shading {
            case .solid:
                Rectangle()
                    .fill()
                
            case .open:
                Rectangle()
                    .stroke()
                
            case .striped:
                Rectangle()
                    .fill()
                    .opacity(0.5)
            }
        
        case .oval:
            switch card.shading {
            case .solid:
                Ellipse()
                    .fill()
                
            case .open:
                Ellipse()
                    .stroke()
                
            case .striped:
                Ellipse()
                    .fill()
                    .opacity(0.5)
            }
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(card: SetCard(numberOfShapes: .two, shape: .diamond, shading: .solid, color: .red))
    }
}
