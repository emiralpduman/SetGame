//
//  TableView.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

struct TableView: View {
    @ObservedObject var table = Table()
    
    @State var itIsCheatingTime: Bool = false
    @State var ARandomSetOnTable: Set<SetCard> = []
    
    var body: some View {
        
        VStack {
            Text("Sets on table: \(table.numberOfSetsOnTable)")
            Text("Score: \(table.score)")
            Text(table.selectionIsSet ? "It's a set!" : "NOT Set")
            Button("Deal 3 More Cards") {
                table.deal()
            }
                .disabled(table.deck.isEmpty)
            Button("😈") {
                itIsCheatingTime.toggle()
                if itIsCheatingTime {
                    ARandomSetOnTable = table.randomSet()
                }
                
            }
            .padding()
            AspectVGrid(items: table.cards, aspectRatio: 3/4) { card in
                if itIsCheatingTime {
                    if ARandomSetOnTable.contains(card) {
                        CardView(card: card)
                            .padding()
                            .background(.purple, in: RoundedRectangle(cornerRadius: 5))
                            .onTapGesture {
                                table.select(card)
                        }
                    } else {
                        CardView(card: card)
                            .padding()
                            .onTapGesture {
                                table.select(card)
                        }
                    }
                } else {
                    CardView(card: card)
                        .padding()
                        .onTapGesture {
                            table.select(card)
                        }
                }
            }
            Button("New Game") {
                table.startNewGame()
            }
        }
        .environmentObject(table)
    }
}


struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
