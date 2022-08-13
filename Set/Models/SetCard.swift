//
//  Card.swift
//  SetCard
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation

struct SetCard: Identifiable, Hashable {
    var id = UUID()
        
    let numberOfShapes: Number
    let shape: Shape
    let shading: Shading
    let color: Color

    var isSelected = false

    
    enum Number: CaseIterable {
        case one, two, threee
    }

    enum Shape: CaseIterable {
        case diamond, squiggle, oval
    }

    enum Shading: CaseIterable {
        case solid, striped, open
    }

    enum Color: CaseIterable {
        case red, green, purple
    }
    
    static func == (lhs: SetCard, rhs: SetCard) -> Bool {
        return lhs.numberOfShapes == rhs.numberOfShapes &&
                lhs.shape == rhs.shape &&
                lhs.shading == rhs.shading &&
                lhs.color == rhs.color
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(numberOfShapes)
        hasher.combine(shape)
        hasher.combine(shading)
        hasher.combine(color)
    }
}


