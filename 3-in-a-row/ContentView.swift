//
//  ContentView.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TicTacToeViewModel()

    var body: some View {
        VStack {
            Spacer()
            // Display the game board
            GameBoardView(viewModel: viewModel)

            // Status message and player scores
            Text(viewModel.gameStatusMessage)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                VStack() {
                    Text("Player X Score: \(viewModel.playerXScore)")
                        .foregroundColor(.white)
                    Text("Player O Score: \(viewModel.playerOScore)")
                        .foregroundColor(.white)
                }
                Spacer()
            }


            // New Game Button with dynamic opacity
            Button("New Game", action: viewModel.resetGame)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity(viewModel.moveMade ? 1 : 0) // Opacity changes based on moveMade

            // Reset History Button with dynamic opacity
            Button("Reset History", action: viewModel.clearHistory)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity((viewModel.playerOScore > 0 || viewModel.playerXScore > 0) ? 1 : 0) // Opacity changes based on scores

            Spacer()
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
