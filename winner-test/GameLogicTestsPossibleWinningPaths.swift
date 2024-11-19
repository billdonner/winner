//
//  GameLogicTestsPossibleWinningPaths.swift
//  winner-test
//
//  Created by [Your Name] on [Date].
//

import Testing
@testable import winner

struct GameLogicTestsPossibleWinningPaths {

    // Test Case 1: 3x3 Matrix with Fully Unplayed Cells
    @Test func test3x3FullyUnplayed() async throws {
        let matrix: [[GameCellState]] = [
            [.unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "3x3 matrix with fully unplayed cells should have a possible winning path.")
    }

    // Test Case 2: 3x3 Matrix with One Blocked Cell (Path Possible)
    @Test func test3x3OneBlockedCell() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .blocked, .unplayed],
            [.unplayed, .unplayed, .unplayed]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "3x3 matrix with one blocked cell should still have a possible winning path.")
    }

//    // Test Case 3: 3x3 Matrix with Path Blocked
//    @Test func test3x3PathBlocked() async throws {
//        let matrix: [[GameCellState]] = [
//            [.playedCorrectly, .blocked, .unplayed],
//            [.blocked, .blocked, .blocked],
//            [.unplayed, .unplayed, .unplayed]
//        ]
//        let result = isPossibleWinningPath(in: matrix)
//        #expect(result == false, "3x3 matrix with all paths blocked should not have a possible winning path.")
//    }

    // Test Case 4: 4x4 Matrix with Partially Unplayed Diagonal
    @Test func test4x4PartiallyUnplayedDiagonal() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "4x4 matrix with a partially unplayed diagonal should have a possible winning path.")
    }

    // Test Case 5: 5x5 Matrix with Random Blocked Cells (Path Possible)
    @Test func test5x5RandomBlockedCells() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .blocked],
            [.blocked, .unplayed, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "5x5 matrix with random blocked cells should have a possible winning path.")
    }

    // Test Case 6: 6x6 Matrix with All Cells Blocked
    @Test func test6x6AllBlocked() async throws {
        let matrix: [[GameCellState]] = [
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "6x6 matrix with all cells blocked should not have a possible winning path.")
    }

    // Test Case 7: 7x7 Matrix with Fully Played Diagonal
    @Test func test7x7FullyPlayedDiagonal() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "7x7 matrix with a fully played diagonal should have a possible winning path.")
    }

    // Test Case 8: 8x8 Matrix with Sparse Blocked Cells
    @Test func test8x8SparseBlockedCells() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed],
            [.blocked, .unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed, .blocked],
            [.unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed],
            [.unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed],
            [.blocked, .unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .blocked],
            [.unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "8x8 matrix with sparse blocked cells should have a possible winning path.")
    }
}
