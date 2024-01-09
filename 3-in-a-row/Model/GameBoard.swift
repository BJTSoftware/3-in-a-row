//
//  GameStatus.swift
//  XO Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/8/24.
//

import Foundation

struct GameBoard {
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
        checkGameStatus()
        switchTurn()
        return true
    }
    
    private mutating func switchTurn() {
        currentTurn = currentTurn == .X ? .O : .X
    }
    
    private func checkForWinner() -> Bool {
        // Horizontal, Vertical, and Diagonal checks
        for row in 0..<rows {
            for col in 0..<columns {
                if let player = board[row * columns + col] {
                    // Check horizontally
                    if col <= columns - consecutiveToWin && checkDirection(row: row, col: col, dRow: 0, dCol: 1, player: player) {
                        return true
                    }
                    // Check vertically
                    if row <= rows - consecutiveToWin && checkDirection(row: row, col: col, dRow: 1, dCol: 0, player: player) {
                        return true
                    }
                    // Check diagonal (down-right)
                    if row <= rows - consecutiveToWin && col <= columns - consecutiveToWin && checkDirection(row: row, col: col, dRow: 1, dCol: 1, player: player) {
                        return true
                    }
                    // Check diagonal (up-right)
                    if row >= consecutiveToWin - 1 && col <= columns - consecutiveToWin && checkDirection(row: row, col: col, dRow: -1, dCol: 1, player: player) {
                        return true
                    }
                }
            }
        }
        return false
    }

    private func checkDirection(row: Int, col: Int, dRow: Int, dCol: Int, player: Player) -> Bool {
        for i in 0..<consecutiveToWin {
            if board[(row + i * dRow) * columns + (col + i * dCol)] != player {
                return false
            }
        }
        return true
    }
    
    private mutating func checkGameStatus() {
        if(checkForWinner()) {
            status = .won
        }

        if !board.contains(nil) {
            status = .draw
        }
    }
}
