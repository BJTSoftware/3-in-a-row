//
//  GameBoardView.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: TicTacToeViewModel

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        Button(action: {
                            viewModel.makeMove(at: row * 3 + column)
                        }) {
                            MarkerView(player: viewModel.gameBoard.board[row * 3 + column])
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.black)
                        .border(Color.black)
                        .accessibilityIdentifier("cell\(row * 3 + column)")
                    }
                }
            }
        }
        .background(Color.white)
    }
}

#Preview {
    GameBoardView(viewModel: TicTacToeViewModel())
}
