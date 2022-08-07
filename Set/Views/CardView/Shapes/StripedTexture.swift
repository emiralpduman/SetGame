//
//  StripedTexture.swift
//  Set
//
//  Created by Emiralp Duman on 2.08.2022.
//

import SwiftUI

struct StripedTexture:  Shape {
    let density: Int = 20
    let lineToEmptySpaceRatio: CGFloat = 3
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let unitDistance: CGFloat = rect.width / CGFloat(density)
        
        for x in 0..<density {
            let xInCGFloat = CGFloat(x)
            p.move(to: CGPoint(x: rect.minX + lineToEmptySpaceRatio*xInCGFloat*unitDistance, y: rect.minY))

            p.addLine(to: CGPoint(x: rect.minX + lineToEmptySpaceRatio*xInCGFloat*unitDistance, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX + ((lineToEmptySpaceRatio*xInCGFloat+1)*unitDistance), y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX + ((lineToEmptySpaceRatio*xInCGFloat+1)*unitDistance), y: rect.minY))
            
        }
        return p
    }
    
}

struct StripedTexture_Previews: PreviewProvider {
    static var previews: some View {
        StripedTexture()
    }
}
