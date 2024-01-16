//
//  TicTacToeViewModel.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import SwiftUI
import Combine

class TicTacToeViewModel: ObservableObject {
    @Published var gameBoard = GameBoard(rows: 3, columns: 3, consecutiveToWin: 3)
    @Published var gameStatusMessage = "Player X's turn"
    @Published var playerXScore = 0
    @Published var playerOScore = 0

    func makeMove(at position: Int) {
        guard gameBoard.makeMove(position: position) else { return }

        switch gameBoard.status {
        case .won:
            let winner = gameBoard.currentTurn == .X ? "O" : "X"
            gameStatusMessage = "Player \(winner) wins!"
            if winner == "X" { playerXScore += 1 } else { playerOScore += 1 }
        case .draw:
            gameStatusMessage = "It's a draw!"
        case .inProgress:
            let nextPlayer = gameBoard.currentTurn == .X ? "X" : "O"
            gameStatusMessage = "Player \(nextPlayer)'s turn"
        }
    }

    func resetGame() {
        let lastTurn = gameBoard.currentTurn
        gameBoard = GameBoard(rows: 3, columns: 3, consecutiveToWin: 3)
        gameBoard.currentTurn = lastTurn
        gameStatusMessage = "Player \(lastTurn)'s turn"
    }
    
    func clearHistory() {
        let lastTurn = gameBoard.currentTurn
        gameBoard = GameBoard(rows: 3, columns: 3, consecutiveToWin: 3)
        playerXScore = 0
        playerOScore = 0
        gameBoard.currentTurn = lastTurn
        gameStatusMessage = "Player \(lastTurn)'s turn"
    }
}
