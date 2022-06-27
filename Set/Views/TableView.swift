//
//  TableView.swift
//  Set
//
//  Created by Emiralp Duman on 26.06.2022.
//

import SwiftUI

struct TableView: View {
    var vm = TableViewVM()
    
    var body: some View {
        AspectVGrid(items: vm.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding()
            
        }
        .padding()

    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
