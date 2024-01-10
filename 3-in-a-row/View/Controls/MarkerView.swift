//
//  MarkerView.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import SwiftUI

struct MarkerView: View {
    let player: Player?

    var body: some View {
        Text(playerMarker)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
    }

    private var playerMarker: String {
        switch player {
            case .X: return "X"
            case .O: return "O"
            default: return " "
        }
    }
}


#Preview {
    MarkerView(player: .X)
}
