//
//  Card.swift
//  Set
//
//  Created by Emiralp Duman on 18.06.2022.
//

import Foundation

struct SetCard {
    let numberOfShapes: Number
    let shape: Shape
    let shading: Shading
    let color: Color
    
}

enum Number {
    case one
    case two
    case threee
}

enum Shape {
    case diamond
    case squiggle
    case oval
}

enum Shading {
    case solid
    case striped
    case open
}

enum Color {
    case red
    case green
    case purple
}
