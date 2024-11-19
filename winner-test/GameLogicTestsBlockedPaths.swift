//
//  GameLogicTestsBlockedPaths.swift
//  winner
//
//  Created by bill donner on 11/19/24.
//


import Testing
@testable import winner

struct GameLogicTestsBlockedPaths {

    // Test Case 1: 5x5 Matrix with Blocked Paths
    @Test func test5x5BlockedPaths() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .blocked, .blocked, .blocked, .unplayed],
            [.unplayed, .blocked, .unplayed, .blocked, .unplayed],
            [.unplayed, .blocked, .unplayed, .blocked, .unplayed],
            [.unplayed, .blocked, .unplayed, .blocked, .unplayed],
            [.unplayed, .blocked, .blocked, .blocked, .playedCorrectly]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "5x5 matrix with blocked paths should not have a winning path.")
    }

    // Test Case 2: 6x6 Matrix with Fully Blocked Diagonal
    @Test func test6x6FullyBlockedDiagonal() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .blocked, .unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .blocked, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .blocked, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "6x6 matrix with a fully blocked diagonal should not have a winning path.")
    }

    // Test Case 3: 7x7 Matrix with Blocked Horizontal Rows
    @Test func test7x7BlockedRows() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .playedCorrectly]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "7x7 matrix with fully blocked rows should not have a winning path.")
    }

  // Test Case 4: 8x8 Matrix with Sparse Blocking and No Winning Path
  @Test func test8x8SparseBlockedPaths() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed],
          [.blocked, .unplayed, .playedIncorrectly, .unplayed, .blocked, .unplayed, .unplayed, .blocked],
          [.unplayed, .blocked, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .blocked, .unplayed],
          [.blocked, .unplayed, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .blocked],
          [.unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .blocked, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed, .playedIncorrectly]
      ]
      let result = isWinningPath(in: matrix)
      #expect(result == false, "8x8 matrix with sparse blocking should not have a winning path due to broken continuity.")
  }

    // Test Case 5: 8x8 Matrix with Complete Blocking
    @Test func test8x8FullyBlocked() async throws {
        let matrix: [[GameCellState]] = [
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
            [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked]
        ]
        let result = isWinningPath(in: matrix)
        #expect(result == false, "8x8 matrix with fully blocked cells should not have a winning path.")
    }
}
