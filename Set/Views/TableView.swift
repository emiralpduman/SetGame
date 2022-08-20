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
    
    @ViewBuilder func PlayingButtons() -> some View {
        switch table.numberOfPlayers {
        case .one:
            Button("Deal 3 More Cards") {
                table.deal()
            }
            .disabled(table.deck.isEmpty)
        case .two:
            HStack {
                VStack {
                    Button("Deal 3 More Cards") {
                        table.deal()
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                    .disabled(table.deck.isEmpty)
                    Button("Claim A Set!") {
                        table.deal()
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                    .disabled(table.deck.isEmpty)

                }
                Spacer()
                VStack {
                    Button("Deal 3 More Cards") {
                        table.deal()
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    .disabled(table.deck.isEmpty)
                    Button("Claim A Set!") {
                        table.deal()
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    .disabled(table.deck.isEmpty)
                }
                
            }.padding(.horizontal)

            
        }
    }
    
    var body: some View {
        
        VStack {
            Text("\(table.numberOfPlayers.rawValue) Players")
                .font(.headline)
            Text("Sets on table: \(table.numberOfSetsOnTable)")
            Text("Score: \(table.score)")
            Text(table.selectionIsSet ? "It's a set!" : "NOT Set")
            
            PlayingButtons()
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
            
            HStack {
                Button("New Game for 1") {
                    table.startNewGame(for: .one)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke())
                Button("New Game for 2") {
                    table.startNewGame(for: .two)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke())
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
