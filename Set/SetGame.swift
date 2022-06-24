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
        static func isSet(_ card1: SetCard, _ card2: SetCard, _ card3: SetCard) -> Bool {
            var isSet = false
            
            if card1.numberOfShapes == card2.numberOfShapes {
                if card1.numberOfShapes == card3.numberOfShapes {
                    isSet = true
                }
            } else if (card1.numberOfShapes != card3.numberOfShapes) && (card2.numberOfShapes != card3.numberOfShapes) {
                isSet = true
            }
            
            if card1.shape == card2.shape {
                if card1.shape == card3.shape {
                    isSet = true
                }
            } else if (card1.shape != card3.shape) && (card2.shape != card3.shape) {
                isSet = true
            }
            
            if card1.shading == card2.shading {
                if card1.shading == card3.shading {
                    isSet = true
                }
            } else if (card1.shading != card3.shading) && (card2.shading != card3.shading) {
                isSet = true
            }
            
            if card1.color == card2.color {
                if card1.color == card3.color {
                    isSet = true
                }
            } else if (card1.color != card3.color) && (card2.color != card3.color) {
                isSet = true
            }
            
            return isSet            
        }
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


