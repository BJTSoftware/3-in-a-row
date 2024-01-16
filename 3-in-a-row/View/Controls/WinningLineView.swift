//
//  WinningLineView.swift
//  Tic-Tac-Toe
//
//  Created by Benjamin Templeton on 1/16/24.
//

import SwiftUI

struct WinningLineView: View {
    var winningPositions: [Int]
    var boardSize: CGFloat

    private func position(for index: Int) -> CGPoint {
        let row = index / 3
        let column = index % 3
        let cellSize = 50 // Assuming each cell is 50x50
        let x = CGFloat(column) * CGFloat(cellSize) + CGFloat(cellSize) / 2
        let y = CGFloat(row) * CGFloat(cellSize) + CGFloat(cellSize) / 2
        return CGPoint(x: x, y: y)
    }

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let start = position(for: winningPositions.first!)
                let end = position(for: winningPositions.last!)
                path.move(to: start)
                path.addLine(to: end)
            }
            .stroke(Color.red, lineWidth: 5)
        }
    }
}
