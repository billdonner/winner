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
  @Test func test4x4DoesSeeLoss() async throws {
      let matrix: [[GameCellState]] = [
          [.unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .blocked, .playedIncorrectly, .playedIncorrectly],
          [.blocked, .blocked, .blocked, .playedCorrectly],
          [.unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == false, "4x4 should be a loser.")
  }
  @Test func test4x4IncompleteDiagonalPath() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .unplayed, .playedCorrectly],
      [.unplayed, .blocked, .playedIncorrectly, .playedIncorrectly],
      [.blocked, .blocked, .blocked, .playedCorrectly],
      [.unplayed, .unplayed, .unplayed, .playedCorrectly]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == false, "4x4 matrix with an incomplete diagonal path should not be a winning path..")
  }
  @Test func testIncorrectCornersSameSide() async throws {
      let matrix: [[GameCellState]] = [
          [.playedIncorrectly, .unplayed, .unplayed, .blocked],
          [.unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .unplayed],
          [.playedIncorrectly, .unplayed, .unplayed, .blocked]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == false, "Matrix with incorrect corners on the same side should automatically be a loser.")
  }
    @Test func test4x4DoesntSeeLoss() async throws {
        let matrix: [[GameCellState]] = [
            [.playedIncorrectly, .unplayed, .unplayed, .unplayed],
            [.unplayed, .playedIncorrectly, .blocked, .blocked],
            [.unplayed, .blocked, .playedCorrectly, .unplayed],
            [.playedIncorrectly, .unplayed, .blocked, .playedCorrectly]
        ]
        let result = isPossibleWinningPath(in: matrix)
        #expect(result == false, "4x4 matrix test4x4DoesntSeeLoss")
    }
  @Test func testDiagonalLoss() async throws {
      let matrix: [[GameCellState]] = [
          [.playedIncorrectly, .unplayed, .unplayed, .playedIncorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .unplayed],
          [.playedIncorrectly, .unplayed, .unplayed, .playedIncorrectly]
      ]
      let result = isWinningPath(in: matrix)
      #expect(result == false, "Matrix with incorrect answers at both ends of both diagonals should result in a loss.")
  }
 
  @Test func test4x4ReverseDiagonalBlocked() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .blocked, .unplayed, .unplayed],
          [.unplayed, .unplayed, .blocked, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "4x4 matrix has a valid winning path through the main diagonal despite the reverse diagonal being blocked.")
  }
  @Test func test5x5BothDiagonalsValid() async throws {
      let matrix: [[GameCellState]] = [
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.unplayed, .unplayed, .playedCorrectly, .unplayed, .unplayed],
          [.unplayed, .playedCorrectly, .unplayed, .playedCorrectly, .unplayed],
          [.playedCorrectly, .unplayed, .unplayed, .unplayed, .playedCorrectly]
      ]
      let result = isPossibleWinningPath(in: matrix)
      #expect(result == true, "5x5 matrix with both diagonals valid should have a possible winning path.")
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
