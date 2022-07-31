//
//  Squiggle.swift
//  Set
//
//  Created by Emiralp Duman on 31.07.2022.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let areaRatio: CGFloat = 1
        
        // Distance units
        let unitRatio: CGFloat = sqrt(Double(areaRatio))
        let widthToHeightRatio: CGFloat = 0.75
        let unitDistanceX: CGFloat = (rect.width/4) / unitRatio
        let unitDistanceY: CGFloat = (rect.height/4) / unitRatio * widthToHeightRatio
        
        // Points
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let p1 = CGPoint(x: center.x + (2 * unitDistanceX) , y: center.y +  (2 * unitDistanceY))
        let p2 = CGPoint(x: center.x + (2 * -unitDistanceX) , y: center.y +  (1 * unitDistanceY))
        let p3 = CGPoint(x: center.x + (2 * -unitDistanceX) , y: center.y +  (2 * -unitDistanceY))
        let p4 = CGPoint(x: center.x + (2 * unitDistanceX) , y: center.y +  (1 * -unitDistanceY))
        let c1 = CGPoint(x: center.x + (1 * unitDistanceX) , y: center.y +  (1 * unitDistanceY))
        let c2 = CGPoint(x: center.x + (1 * -unitDistanceX) , y: center.y +  (2 * unitDistanceY))
        let c3 = CGPoint(x: center.x + (1 * -unitDistanceX) , y: center.y +  (1 * -unitDistanceY))
        let c4 = CGPoint(x: center.x + (1 * unitDistanceX) , y: center.y +  (2 * -unitDistanceY))
        
        var p = Path()
        
        p.move(to: p1)
        p.addCurve(to: p2, control1: c1, control2: c2)
        p.addLine(to: p3)
        p.addCurve(to: p4, control1: c3, control2: c4)
        p.addLine(to: p1)
        
        return p
    }

}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle()
    }
}
