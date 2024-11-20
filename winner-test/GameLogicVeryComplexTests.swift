//
//  GameLogicComplexTests 2.swift
//  winner
//
//  Created by bill donner on 11/20/24.
//


//
//  GameLogicComplexTests.swift
//  winner-test
//
//  Created by bill donner on 11/20/24.
//

import Testing
@testable import winner

struct GameLogicVeryComplexTests {

    // Test 1: 7x7 matrix with multiple valid paths
    @Test func test7x7MultiplePaths() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly],
            [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.playedCorrectly, .playedCorrectly, .playedCorrectly, .unplayed, .playedCorrectly, .playedCorrectly, .playedCorrectly],
            [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
            [.playedCorrectly, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly],
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "7x7 matrix with multiple paths should return a winning path.")
    }

    // Test 2: 8x8 matrix with fully blocked paths
    @Test func test8x8FullyBlockedPaths() async throws {
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
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "8x8 matrix with fully blocked paths should return no winning path.")
    }

    // Test 3: 5x5 matrix with invalid corners
    @Test func test5x5InvalidCorners() async throws {
        let matrix: [[GameCellState]] = [
            [.playedIncorrectly, .unplayed, .unplayed, .unplayed, .playedIncorrectly],
            [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
            [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
            [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
            [.playedIncorrectly, .unplayed, .unplayed, .unplayed, .playedIncorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "5x5 matrix with invalid corners should return no winning path.")
    }

    // Test 4: 7x7 zigzag path
    @Test func test7x7ZigzagPath() async throws {
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
        #expect(result == true, "7x7 matrix with a valid zigzag path should return a winning path.")
    }

    // Test 5: 6x6 with blocked reverse diagonal
    @Test func test6x6BlockedReverseDiagonal() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly],
            [.unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed],
            [.unplayed, .unplayed, .blocked, .blocked, .unplayed, .unplayed],
            [.unplayed, .unplayed, .blocked, .blocked, .unplayed, .unplayed],
            [.unplayed, .blocked, .unplayed, .unplayed, .blocked, .unplayed],
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "6x6 matrix should still have a valid winning path through the main diagonal.")
    }

    // Test 6: 5x5 diagonal incomplete
  @Test func test5x5DiagonalIncomplete() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix should return a winning path by bypassing the blocked cell.")
  }
  @Test func test5x5FullyBlockedPath() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .blocked, .unplayed],
          [.unplayed, .blocked, .blocked, .blocked, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix should return a winning path through the reverse diagonal.")
  }
  @Test func test5x5BothDiagonalsBlocked() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .blocked, .unplayed, .blocked, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .blocked, .blocked, .blocked, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix should find a winning path by skirting around blocked cells.")
  }
  @Test func test5x5FullyBlockedWithNoIndirectPath() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .blocked, .unplayed, .blocked, .playedCorrectly],
          [.blocked, .blocked, .unplayed, .blocked, .blocked],
          [.blocked, .blocked, .blocked, .blocked, .blocked],
          [.blocked, .blocked, .blocked, .blocked, .blocked],
          [.playedCorrectly, .blocked, .unplayed, .blocked, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == false, "5x5 matrix with all paths blocked and no indirect path should not return a winning path.")
  }
  @Test func test5x5ComplexIndirectPaths() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .blocked, .unplayed, .playedCorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.blocked, .unplayed, .blocked, .unplayed, .blocked],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.playedCorrectly, .unplayed, .blocked, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix with complex indirect paths should return a winning path.")
  }
  @Test func test5x5IndirectPath() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed],
          [.unplayed, .playedCorrectly, .blocked, .unplayed, .unplayed],
          [.unplayed, .blocked, .blocked, .playedCorrectly, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix should find a valid indirect path despite some blocked cells.")
  }
  @Test func test5x5MultiplePaths() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .playedCorrectly, .playedCorrectly],
          [.playedCorrectly, .playedCorrectly, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix with multiple paths should return a winning path.")
  }
    // Test 7: Large 10x10 matrix fully unplayed
  @Test func test10x10FullyUnplayed() async throws {
      let matrix: [[GameCellState]] = Array(repeating: Array(repeating: .unplayed, count: 10), count: 10)
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "10x10 fully unplayed matrix should have many possible winning paths.")
  }

    // Test 8: 4x4 with all corners incorrect
    @Test func test4x4AllCornersIncorrect() async throws {
        let matrix: [[GameCellState]] = [
            [.playedIncorrectly, .unplayed, .unplayed, .playedIncorrectly],
            [.unplayed, .unplayed, .unplayed, .unplayed],
            [.unplayed, .unplayed, .unplayed, .unplayed],
            [.playedIncorrectly, .unplayed, .unplayed, .playedIncorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "4x4 matrix with all corners incorrect should not have a winning path.")
    }

    // Test 9: 5x5 complex path with blocks
    @Test func test5x5ComplexPathWithBlocks() async throws {
        let matrix: [[GameCellState]] = [
            [.playedCorrectly, .blocked, .unplayed, .unplayed, .playedCorrectly],
            [.unplayed, .playedCorrectly, .blocked, .playedCorrectly, .unplayed],
            [.blocked, .unplayed, .playedCorrectly, .unplayed, .blocked],
            [.unplayed, .playedCorrectly, .blocked, .playedCorrectly, .unplayed],
            [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == true, "5x5 matrix should find a valid path despite blocks.")
    }

    // Test 10: 3x3 with no possible path
    @Test func test3x3NoPossiblePath() async throws {
        let matrix: [[GameCellState]] = [
            [.playedIncorrectly, .unplayed, .playedIncorrectly],
            [.unplayed, .blocked, .unplayed],
            [.playedIncorrectly, .unplayed, .playedIncorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "3x3 matrix with blocked and incorrect cells should not have a winning path.")
    }
}
