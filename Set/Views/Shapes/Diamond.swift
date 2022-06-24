//
//  Diamond.swift
//  Set
//
//  Created by Emiralp Duman on 24.06.2022.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let horizontalLength: CGFloat = rect.width
        let verticalLength: CGFloat = rect.height
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let top = CGPoint(x: center.x, y: center.y - verticalLength / 2)
        let bottom = CGPoint(x: center.x, y: center.y + verticalLength / 2)
        let left = CGPoint(x: center.x - horizontalLength / 2, y: center.y)
        let right = CGPoint(x: center.x + horizontalLength / 2, y: center.y)
        
        var p = Path()
        
        p.move(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        p.addLine(to: top)
        
        return p
    }

}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
