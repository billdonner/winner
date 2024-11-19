//
//  GameLogicTestsIncompletePaths.swift
//  winner-test
//
//  Created by bill donner on 11/19/24.
//

import Testing
@testable import winner

struct GameLogicTestsIncompletePaths {

    @Test func test3x3IncompletePath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .playedCorrectly, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .unplayed]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "3x3 matrix with a path one step short should not be a winning path.")
    }

    @Test func test4x4IncompleteDiagonalPath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "4x4 matrix with an incomplete diagonal path should not be a winning path.")
    }

    @Test func test5x5IncompleteZigzagPath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "5x5 matrix with a zigzag path missing one step should not be a winning path.")
    }

    @Test func test6x6IncompleteHorizontalPath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .playedCorrectly, .playedCorrectly, .playedCorrectly, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "6x6 matrix with an incomplete horizontal path should not be a winning path.")
    }

    @Test func test8x8IncompleteBlockedPath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "8x8 matrix with a blocked path missing one step should not be a winning path.")
    }
}
