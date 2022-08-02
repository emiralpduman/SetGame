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
                    .stroke()
                    .background(StripedTexture().fill(.black).clipShape(Diamond()))
                
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
                Squiggle()
                    .fill()
                
            case .open:
                Squiggle()
                    .stroke()
                
            case .striped:
                Squiggle()
                    .fill()
                    .opacity(DrawingConstants.opacityValueForStripedShading)
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
                    .opacity(DrawingConstants.opacityValueForStripedShading)
            }
        }
    }
    
    private struct DrawingConstants {
        static let opacityValueForStripedShading: CGFloat = 0.25
    }
}

//struct ShapeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShapeView(card: SetCard(numberOfShapes: .two, shape: .diamond, shading: .solid, color: .red))
//    }
//}
