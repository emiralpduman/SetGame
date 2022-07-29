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
        
        VStack {
            Button("New Game") {
                table.startNewGame()
            }
            
            AspectVGrid(items: table.cards, aspectRatio: 3/4) { card in
                CardView(card: card)
                    .padding()
                    .onTapGesture {
                        table.select(card)
                    }
            }
            
            Text(table.thereIsSet ? "It's a set!" : "NOT Set")
            
            Button("Deal 3 More Cards") {
                table.deal()
            }
            .disabled(table.deck.isEmpty)
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
