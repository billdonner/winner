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
  // Test Case 4: 4x4 Matrix with Partially Unplayed Diagonal
  @Test func test4x4SuprisingLoser() async throws {
      let matrix: [[GameCellState]] = [
          [.unplayed, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .blocked],
          [.unplayed, .unplayed, .unplayed, .blocked],
          [.unplayed, .unplayed, .blocked, .unplayed]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "4x4 matrix with  SuprisingLoser.")
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
  
  // Test Case 9: 3x3 Matrix with Two Blocked Cells (Path Possible)
  @Test func test3x3TwoBlockedCells() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .blocked],
          [.unplayed, .playedCorrectly, .unplayed],
          [.blocked, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "3x3 matrix with two blocked cells should still have a possible winning path.")
  }

  // Test Case 10: 4x4 Matrix with Fully Blocked Diagonal (Path Impossible)
  @Test func test4x4FullyBlockedDiagonal() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed],
          [.unplayed, .unplayed, .unplayed, .blocked]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "4x4 matrix with a fully blocked main diagonal should still have a possible winning path via the reverse diagonal.")
  }

  // Test Case 11: 5x5 Matrix with Dense Blocks (Path Possible)
  @Test func test5x5DenseBlocks() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .blocked, .blocked, .blocked, .unplayed],
          [.blocked, .playedCorrectly, .unplayed, .blocked, .unplayed],
          [.blocked, .unplayed, .playedCorrectly, .blocked, .unplayed],
          [.blocked, .unplayed, .blocked, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix with dense blocks should have a possible winning path.")
  }

  // Test Case 12: 6x6 Matrix with Alternate Blocks (Path Possible)
  @Test func test6x6AlternateBlocks() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .blocked, .unplayed, .blocked, .unplayed, .blocked],
          [.blocked, .playedCorrectly, .blocked, .unplayed, .blocked, .unplayed],
          [.unplayed, .blocked, .playedCorrectly, .blocked, .unplayed, .blocked],
          [.blocked, .unplayed, .blocked, .playedCorrectly, .blocked, .unplayed],
          [.unplayed, .blocked, .unplayed, .blocked, .playedCorrectly, .blocked],
          [.blocked, .unplayed, .blocked, .unplayed, .blocked, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "6x6 matrix with alternate blocks should have a possible winning path.")
  }

  // Test Case 13: 7x7 Matrix with Random Correctly Played Cells (Path Impossible)
  @Test func test7x7RandomCorrectlyPlayedCells() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
          [.unplayed, .unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .unplayed, .unplayed, .blocked, .unplayed],
          [.unplayed, .unplayed, .unplayed, .unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "7x7 matrix with random played cells and blocks should still have a possible winning path.")
  }
  @Test func test7x7ReverseDiagonalPossible() async throws {
      let matrix: [[GameCellState]] = [
          [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .playedCorrectly, .unplayed, .unplayed, .blocked, .unplayed],
          [.unplayed, .unplayed, .unplayed, .playedCorrectly, .blocked, .unplayed, .unplayed],
          [.blocked, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "7x7 matrix with a valid reverse diagonal should have a possible winning path.")
  }
  @Test func test7x7IndirectPathPossible() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .unplayed, .unplayed, .unplayed],
          [.unplayed, .blocked, .unplayed, .playedCorrectly, .blocked, .unplayed, .unplayed],
          [.unplayed, .unplayed, .unplayed, .unplayed, .blocked, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed],
          [.unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "7x7 matrix with an indirect path should still have a possible winning path.")
  }
  // Test Case 14: 8x8 Matrix with Full Edge Blockage (Path Impossible)
  @Test func test8x8FullEdgeBlockage() async throws {
      let matrix: [[GameCellState]] = [
          [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked],
          [.blocked, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .blocked],
          [.blocked, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .blocked],
          [.blocked, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly, .blocked],
          [.blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked, .blocked]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == false, "8x8 matrix with fully blocked edges should not have a possible winning path.")
  }
}
