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
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0..<game.numberOfShapes(of: card), id:\.self) { _ in
                    let shapeHeight: CGFloat = geometry.size.height * Settings.geometryShapeToHeightRatio
                    let shapeWidth: CGFloat = shapeHeight * Settings.shapeWidthToHeightRatio
                    
                    ShapeView(card: card)
                        .foregroundColor(game.colorOfCard(card))
                        .frame(width: shapeWidth, height: shapeHeight)
                        .padding(Settings.paddingBetweenShapes)
                        
                }

            }
            .padding(Settings.cardPadding)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .applyBordering() { view in
                themeLogic(view)
            }

        }
    }
    
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
    
    private struct Settings {
        static let cardPadding: CGFloat = 10
        static let paddingBetweenShapes: CGFloat = 3
        static let geometryShapeToHeightRatio: CGFloat = 0.2
        static let shapeWidthToHeightRatio: CGFloat = 1.2
        static let borderWidth: CGFloat = 3
    }
}

struct CardView_Previews: PreviewProvider {
    static var table = Table()
    static var previews: some View {
        CardView(card: SetCard(numberOfShapes: .two, shape: .diamond, shading: .striped, color: .green))
            .environmentObject(table)
    }
}
