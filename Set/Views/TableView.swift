//
//  TableView.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

struct TableView: View {
    var table = Table()
    
    var body: some View {
        AspectVGrid(items: table.cards, aspectRatio: 2/3) { card in

                CardView(card: card)
                    .padding()
                    .onTapGesture {
                        table.select(card)
                    }


            
        }
        .padding()

    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
