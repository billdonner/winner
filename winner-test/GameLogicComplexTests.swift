//
//  GameLogicComplexTests.swift
//  winner
//
//  Created by bill donner on 11/19/24.
//


//
//  GameLogicComplexTests.swift
//  winner
//
//  Created by [Your Name] on [Date].
//

import Foundation
import Testing
@testable import winner

struct GameLogicComplexTests {

    // Helper function to measure performance
    func measurePerformance(of test: () -> Bool, testName: String) {
        let start = DispatchTime.now()
        let result = test()
        let end = DispatchTime.now()
        let elapsed = end.uptimeNanoseconds - start.uptimeNanoseconds
        print("\(testName) completed in \(elapsed / 1_000_000) ms with result: \(result)")
    }

    // Negative Test Case 1: Spiral Blocking
    @Test func test50x50SpiralBlocking() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                let layer = min(row, col, 49 - row, 49 - col)
                if layer % 2 == 1 {
                    return .blocked
                } else if (row == 0 && col == 0) || (row == 49 && col == 49) {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "50x50 Spiral Blocking")
    }

    // Negative Test Case 2: Random Clusters
    @Test func test50x50RandomClusters() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                if ((row / 5) % 3 == 0 && (col / 5) % 2 == 0) || (row % 7 == 0 && col % 11 == 0) {
                    return .blocked
                } else if (row == 0 && col == 0) || (row == 49 && col == 49) {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "50x50 Random Clusters")
    }

    // Positive Test Case 1: Clear Diagonal Path
    @Test func test50x50ClearDiagonalPath() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                if row == col {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == true }, testName: "50x50 Clear Diagonal Path")
    }

    // Positive Test Case 2: Sparse Blocking with Open Path
    @Test func test50x50SparseBlockingWithPath() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                if (row + col) % 7 == 0 {
                    return .blocked
                } else if row == 0 && col == 0 || row == 49 && col == 49 || row == col {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == true }, testName: "50x50 Sparse Blocking with Open Path")
    }

    // Negative Test Case 3: Nested Boxes
    @Test func test50x50NestedBoxes() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                let layer = min(row, col, 49 - row, 49 - col)
                if layer % 4 == 2 {
                    return .blocked
                } else if (row == 0 && col == 0) || (row == 49 && col == 49) {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "50x50 Nested Boxes")
    }

    // Positive Test Case 3: Vertical Path with Interruptions
    @Test func test50x50VerticalPathWithInterruptions() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                if col == 25 && row % 2 == 0 {
                    return .playedCorrectly
                } else if row % 5 == 0 && col % 3 == 0 {
                    return .blocked
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == true }, testName: "50x50 Vertical Path with Interruptions")
    }

    // Negative Test Case 4: Vertical Barriers
    @Test func test50x50VerticalBarriers() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { row in
            (0..<50).map { col in
                if col % 7 == 0 && col != 0 && col != 49 {
                    return .blocked
                } else if (row == 0 && col == 0) || (row == 49 && col == 49) {
                    return .playedCorrectly
                } else {
                    return .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "50x50 Vertical Barriers")
    }
}