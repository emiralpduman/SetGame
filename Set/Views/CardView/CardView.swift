//
//  CardView.swift
//  Set
//
//  Created by Emiralp Duman on 24.06.2022.
//

import SwiftUI

struct CardView: View {
    var card: SetCard
    var vm = CardViewVM()
    
    var body: some View {
        VStack {
            vm.shapeOf(card.shape)
                .padding()
        }

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetCard(numberOfShapes: .two, shape: .diamond, shading: .solid, color: .red))
    }
}
