//
//  TicTacToeViewModelTests.swift
//  XO Tic-Tac-ToeTests
//
//  Created by Benjamin Templeton on 1/8/24.
//

import XCTest
@testable import XO_Tic_Tac_Toe

class TicTacToeViewModelTests: XCTestCase {

    var viewModel: TicTacToeViewModel!

    override func setUpWithError() throws {
        viewModel = TicTacToeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialGameStatus() throws {
        XCTAssertEqual(viewModel.gameStatusMessage, "Player X's turn")
    }

    func testScoreUpdateOnWin() throws {
        // Simulate a winning condition for player X
        viewModel.makeMove(at: 0)
        viewModel.makeMove(at: 3)
        viewModel.makeMove(at: 1)
        viewModel.makeMove(at: 4)
        viewModel.makeMove(at: 2)

        XCTAssertEqual(viewModel.playerXScore, 1)
    }

    func testGameReset() throws {
        viewModel.resetGame()
        XCTAssertEqual(viewModel.gameStatusMessage, "Player X's turn")
        XCTAssertEqual(viewModel.gameBoard.status, .inProgress)
    }
}
