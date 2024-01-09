//
//  XO_Tic_Tac_ToeUITests.swift
//  XO Tic-Tac-ToeUITests
//
//  Created by Benjamin Templeton on 1/8/24.
//


import XCTest

class 3_in_a_rowUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testBoardInteraction() throws {
        let firstCell = app.buttons["cell0"]
        firstCell.tap()
        XCTAssertEqual(firstCell.label, "X")

        let secondCell = app.buttons["cell1"]
        secondCell.tap()
        XCTAssertEqual(secondCell.label, "O")
    }

    func testResetFunctionality() throws {
        let resetButton = app.buttons["Reset Game"]
        let firstCell = app.buttons["cell0"]

        firstCell.tap() // X's turn
        resetButton.tap()
        
        XCTAssertEqual(firstCell.label, " ")
    }
}

