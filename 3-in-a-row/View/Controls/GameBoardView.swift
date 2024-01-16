//
//  GameBoardView.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel: TicTacToeViewModel
    private let boardSize: CGFloat = 150 // Adjust size as needed

    var body: some View {
        
        ZStack {
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
            
            ForEach(viewModel.gameBoard.winningIndices, id: \.self) { indices in
                WinningLineView(winningPositions: indices, boardSize: boardSize)
                    .frame(width: boardSize, height: boardSize)
                    .allowsHitTesting(false)
            }
        }
    }
}

#Preview {
    GameBoardView(viewModel: TicTacToeViewModel())
}
