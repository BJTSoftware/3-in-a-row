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

            Button(action: viewModel.resetGame)
            {
                Text("New Game")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            Button(action: viewModel.clearHistory)
            {
                Text("Reset History")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            Spacer()
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
