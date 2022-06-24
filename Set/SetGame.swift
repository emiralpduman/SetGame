//
//  SetGame.swift
//  Set
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation
import SwiftUI

struct SetGame {
    private struct Rules {
        static let numberOfCards: Int = 81
    }
    
    //81 piece
    var cards = [SetCard]()
    
    init() {
        for _ in 0..<SetGame.Rules.numberOfCards {
            for numberOfNewCard in SetCard.Number.allCases {
                for shapeOfNewCard in SetCard.Shape.allCases {
                    for shadingOfNewCard in SetCard.Shading.allCases {
                        for colorOfNewCard in SetCard.Color.allCases {
                            cards.append(SetCard(numberOfShapes: numberOfNewCard, shape: shapeOfNewCard, shading: shadingOfNewCard, color: colorOfNewCard))
                        }
                    }
                }
            }


        }

    }
    
    
    

}


