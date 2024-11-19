//
//  GameLogicPerformanceTests.swift
//  winner
//
//  Created by bill donner on 11/19/24.
//

import Foundation
import Testing
@testable import winner

struct GameLogicPerformanceTests {

    // Helper function to measure performance
    func measurePerformance(of test: () -> Bool, testName: String) {
        let start = DispatchTime.now()
        let result = test()
        let end = DispatchTime.now()
        let elapsed = end.uptimeNanoseconds - start.uptimeNanoseconds
        print("\(testName) completed in \(elapsed / 1_000_000) ms with result: \(result)")
    }

    // Test Case 1: 10x10 Fully Blocked Matrix
    @Test func test10x10FullyBlocked() async throws {
        let matrix: [[GameCellState]] = Array(repeating: Array(repeating: .blocked, count: 10), count: 10)
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "10x10 Fully Blocked Matrix")
    }

    // Test Case 2: 10x10 Diagonal Zigzag Path
    @Test func test10x10DiagonalZigzag() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly]
        ]
        measurePerformance(of: { isWinningPath(in: matrix) == true }, testName: "10x10 Diagonal Zigzag Path")
    }

    // Test Case 3: 15x15 Sparse Blocking
    @Test func test15x15SparseBlocking() async throws {
        let matrix: [[GameCellState]] = (0..<15).map { row in
            (0..<15).map { col in
                if (row + col) % 3 == 0 { .blocked } else { .unplayed }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "15x15 Sparse Blocking")
    }

    // Test Case 4: 20x20 Complex Blocking
    @Test func test20x20ComplexBlocking() async throws {
        let matrix: [[GameCellState]] = (0..<20).map { row in
            (0..<20).map { col in
                if row == col || row + col == 19 { .playedCorrectly } else if (row % 2 == 0 && col % 3 == 0) { .blocked } else { .unplayed }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == true }, testName: "20x20 Complex Blocking")
    }

    // Test Case 5: 30x30 Dense Blocking
    @Test func test30x30DenseBlocking() async throws {
        let matrix: [[GameCellState]] = (0..<30).map { row in
            (0..<30).map { col in
                if (row % 5 == 0 || col % 5 == 0) && !(row == 0 && col == 0) && !(row == 29 && col == 29) {
                    .blocked
                } else {
                    .unplayed
                }
            }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false }, testName: "30x30 Dense Blocking")
    }

    // Test Case 6: 50x50 Randomized Blocking
    @Test func test50x50RandomizedBlocking() async throws {
        let matrix: [[GameCellState]] = (0..<50).map { _ in
            (0..<50).map { _ in Bool.random() ? .blocked : .unplayed }
        }
        measurePerformance(of: { isWinningPath(in: matrix) == false || isWinningPath(in: matrix) == true }, testName: "50x50 Randomized Blocking")
    }
}
