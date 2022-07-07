//
//  CardView.swift
//  Set
//
//  Created by Emiralp Duman on 24.06.2022.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var game: Table
    
    var card: SetCard
    
    @ViewBuilder func themeLogic<Content: View>(_ content: Content) -> some View {
        if card.isSelected {
            if game.isEvaluationPeriod {
                if game.thereIsSet {
                    content.border(game.cardColorOfSet, width: Settings.borderWidth)
                } else {
                    content.border(game.cardColorOfNotSet, width: Settings.borderWidth)
                }
                
            }
            else {
                content.border(game.cardColorOfDefaultSelection, width: Settings.borderWidth)
            }
        } else {
            content.border(game.cardColorOfNoSelection, width: Settings.borderWidth)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0..<game.numberOfShapes(of: card), id:\.self) { _ in
                    ShapeView(card: card)
                        .foregroundColor(game.colorOfCard(card))
                        .frame(height: geometry.size.height * Settings.heightToShapeRatio)
                        .padding(Settings.paddingBetweenShapes)
                        
                }

            }
            .frame(height: geometry.size.height)
            .padding(Settings.cardPadding)
            .applyBordering() { view in
                themeLogic(view)
            }
            
            
        }
    }
    
    private struct Settings {
        static let cardPadding: CGFloat = 10
        static let paddingBetweenShapes: CGFloat = 5
        static let heightToShapeRatio: CGFloat = 0.2
        static let borderWidth: CGFloat = 3
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: SetCard(numberOfShapes: .two, shape: .diamond, shading: .solid, color: .green))
//    }
//}
