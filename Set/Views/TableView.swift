//
//  TableView.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

struct TableView: View {
    @ObservedObject var table = Table()
    
    var body: some View {
        AspectVGrid(items: table.cards, aspectRatio: 2/3) { card in

                CardView(card: card)
                    .padding()
                    .onTapGesture {
                        table.select(card)
                    }


            
        }
        .padding()
        .environmentObject(table)

    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
