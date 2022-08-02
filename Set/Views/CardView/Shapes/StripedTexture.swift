//
//  StripedTexture.swift
//  Set
//
//  Created by Emiralp Duman on 2.08.2022.
//

import SwiftUI

struct StripedTexture:  Shape {
    let density: CGFloat = 3
    
    func path(in rect: CGRect) -> Path {
        let x1 = CGFloat = rect.width/density
        
        
        var p = Path()
        
        p.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        p.addLines(<#T##lines: [CGPoint]##[CGPoint]#>)
        
        return p
    }
    
}

struct StripedTexture_Previews: PreviewProvider {
    static var previews: some View {
        StripedTexture()
    }
}
