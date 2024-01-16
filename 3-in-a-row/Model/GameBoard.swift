//
//  GameStatus.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import Foundation

struct GameBoard {
    
    var winningIndices: [[Int]] = []
    var board: [Player?]
    var currentTurn: Player
    var status: GameStatus
    private let rows: Int
    private let columns: Int
    private let consecutiveToWin: Int
    
    init(rows: Int, columns: Int, consecutiveToWin: Int) {
        self.board = Array(repeating: nil, count: 9)
        self.currentTurn = .X
        self.status = .inProgress
        self.rows = rows
        self.columns = columns
        self.consecutiveToWin = consecutiveToWin
    }
    
    mutating func makeMove(position: Int) -> Bool {
        if(status != .inProgress || board[position] != nil) {
            return false
        }
        board[position] = currentTurn
        checkForWinner()
        switchTurn()
        return true
    }
    
    private mutating func switchTurn() {
        currentTurn = currentTurn == .X ? .O : .X
    }
    
    private mutating func checkForWinner() {
        winningIndices.removeAll()
        let linesToCheck = [
            [0, 1,2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6] // Diagonals
        ]
        for line in linesToCheck {
            if let player = board[line[0]],
               player == board[line[1]],
               player == board[line[2]] {
                winningIndices.append(line)
                if winningIndices.count == 2 {
                    break  // Limit to two winning paths
                }
            }
        }
        
        status = winningIndices.isEmpty ? (board.contains(nil) ? .inProgress : .draw) : .won
        
    }
}
