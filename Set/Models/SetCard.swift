//
//  Card.swift
//  SetCard
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation

struct SetCard: Identifiable {
    var id = UUID()
    var isSelected = false
    
    let numberOfShapes: Number
    let shape: Shape
    let shading: Shading
    let color: Color

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
}


