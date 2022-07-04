//
//  View.swift
//  Set
//
//  Created by Emiralp Duman on 4.07.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func applyBordering<Content: View>(transform: (Self) -> Content) -> some View {
        transform(self)
    }
}
