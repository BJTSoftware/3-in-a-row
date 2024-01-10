//
//  GameBoardTests.swift
//  XO Tic-Tac-ToeTests
//
//  Created by Benjamin Templeton on 1/8/24.
//

import XCTest
@testable import Tic_Tac_Toe

class GameBoardTests: XCTestCase {

    var gameBoard: GameBoard!

    override func setUpWithError() throws {
        gameBoard = GameBoard(rows: 3, columns: 3, consecutiveToWin: 3)
    }

    override func tearDownWithError() throws {
        gameBoard = nil
    }

    func testGameInitialization() throws {
        XCTAssertEqual(gameBoard.currentTurn, .X)
        XCTAssertTrue(gameBoard.board.allSatisfy { $0 == nil })
        XCTAssertEqual(gameBoard.status, .inProgress)
    }

    func testPlayerTurns() throws {
        XCTAssertTrue(gameBoard.makeMove(position: 0))
        XCTAssertEqual(gameBoard.currentTurn, .O)
    }

    func testWinningCondition() throws {
        // Simulate a winning condition
        gameBoard.makeMove(position: 0) // X
        gameBoard.makeMove(position: 3) // O
        gameBoard.makeMove(position: 1) // X
        gameBoard.makeMove(position: 4) // O
        gameBoard.makeMove(position: 2) // X wins

        XCTAssertEqual(gameBoard.status, .won)
    }

    func testDrawCondition() throws {
        // Simulate a draw condition
        // Fill the board without a winner
        gameBoard.makeMove(position: 0) // X
        gameBoard.makeMove(position: 1) // O
        gameBoard.makeMove(position: 2) // X
        gameBoard.makeMove(position: 4) // O
        gameBoard.makeMove(position: 3) // X
        gameBoard.makeMove(position: 5) // O
        gameBoard.makeMove(position: 7) // X
        gameBoard.makeMove(position: 6) // O
        gameBoard.makeMove(position: 8) // X

        XCTAssertEqual(gameBoard.status, .draw)
    }
}
