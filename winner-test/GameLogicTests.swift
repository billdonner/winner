
//  winner_test.swift
//  winner-test
//
//  Created by bill donner on 11/19/24.
//

import Testing
@testable import winner

struct GameLogicTests {
  
  @Test func test3x3BlockFraction20() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .unplayed],
      [.unplayed, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 3x3 board with 20% blocked cells.")
  }
  
  @Test func test3x3BlockFraction30() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .blocked],
      [.unplayed, .unplayed, .unplayed],
      [.unplayed, .blocked, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 3x3 board with 30% blocked cells.")
  }
  
  @Test func test3x3BlockFraction40() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed],
      [.blocked, .unplayed, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 3x3 board with 40% blocked cells.")
  }
  
  @Test func test3x3BlockFraction50() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .blocked, .unplayed],
      [.blocked, .unplayed, .blocked],
      [.unplayed, .blocked, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 3x3 board with 50% blocked cells.")
  }
  
  @Test func test4x4BlockFraction20() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .unplayed, .blocked]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 4x4 board with 20% blocked cells.")
  }
  
  @Test func test4x4BlockFraction30() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .blocked, .unplayed, .unplayed],
      [.unplayed, .unplayed, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 4x4 board with 30% blocked cells.")
  }
  
  @Test func test4x4BlockFraction40() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .blocked, .unplayed, .blocked],
      [.unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed],
      [.blocked, .blocked, .blocked, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 4x4 board with 40% blocked cells.")
  }
  

  
  @Test func test5x5BlockFraction20() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .unplayed, .blocked, .unplayed],
      [.blocked, .unplayed, .unplayed, .unplayed, .blocked],
      [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed],
      [.blocked, .unplayed, .unplayed, .unplayed, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 5x5 board with 20% blocked cells.")
  }
  
  @Test func test5x5BlockFraction30() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .unplayed, .unplayed, .blocked],
      [.unplayed, .unplayed, .unplayed, .unplayed, .blocked],
      [.blocked, .unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .blocked, .unplayed, .unplayed],
      [.blocked, .unplayed, .unplayed, .unplayed, .unplayed]
    ]
    let result = isPossibleWinningPath(in: matrix)
    #expect(result == true, "Pathfinding should succeed on a 5x5 board with 30% blocked cells.")
  }
  
  @Test func testBlockedCellsPreventWinningPath() async throws {
    let matrix: [[GameCellState]] = [
      [.unplayed, .unplayed, .unplayed],
      [.blocked, .playedCorrectly, .unplayed],
      [.unplayed, .playedIncorrectly, .unplayed]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == false, "Winning path should not be found when blocked cells prevent traversal.")
  }
  
  @Test func testUnblockedWinningPath() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .unplayed, .unplayed],
      [.playedCorrectly, .playedCorrectly, .unplayed],
      [.playedCorrectly, .unplayed, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Winning path should be found when no blocked cells prevent traversal.")
  }
  
  @Test func testCornerConditionLoss() async throws {
    let matrix: [[GameCellState]] = [
      [.playedIncorrectly, .unplayed, .playedIncorrectly],
      [.unplayed, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed]
    ]
    let result = hasLosingCornerCondition(in: matrix)
    #expect(result == true, "Should detect losing corner condition.")
  }
  
  @Test func testSimpleCircuitousPath() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .blocked, .unplayed],
      [.unplayed, .playedCorrectly, .blocked],
      [.unplayed, .playedCorrectly, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Circuitous path should be valid despite detours.")
  }
  
  @Test func testCircuitousPathWithLoops() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .playedCorrectly, .blocked],
      [.unplayed, .playedCorrectly, .unplayed],
      [.playedCorrectly, .blocked, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Path looping around blocked cells should still be valid.")
  }
  
  @Test func testCircuitousPathAroundObstacles() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .blocked, .blocked],
      [.playedCorrectly, .playedCorrectly, .blocked],
      [.blocked, .playedCorrectly, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Path avoiding obstacles and going around should be valid.")
  }
  
  @Test func testInvalidCircuitousPathWithBlockedEnds() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .playedCorrectly, .blocked],
      [.playedCorrectly, .blocked, .playedCorrectly],
      [.blocked, .playedCorrectly, .blocked]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == false, "Circuitous path with blocked endpoints should fail.")
  }
  
  @Test func testCircuitousPathTraversingMultipleDiagonals() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .unplayed, .playedCorrectly],
      [.blocked, .playedCorrectly, .blocked],
      [.playedCorrectly, .unplayed, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Complex diagonal path with valid cells should succeed.")
  }
  
  @Test func testPathFailsIfCircuitousRouteHitsBlockedCells() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .blocked, .unplayed],
      [.blocked, .playedCorrectly, .blocked],
      [.playedCorrectly, .blocked, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "Path on the main diagonal should be valid despite blocked cells elsewhere.")
  }
  
  @Test func test8x8ClearPath25Blocked() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .unplayed, .unplayed],
      [.unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .unplayed],
      [.unplayed, .unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed, .blocked, .unplayed],
      [.unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .unplayed, .unplayed, .unplayed],
      [.unplayed, .unplayed, .blocked, .unplayed, .playedCorrectly, .unplayed, .blocked, .unplayed],
      [.unplayed, .blocked, .unplayed, .unplayed, .unplayed, .playedCorrectly, .unplayed, .blocked],
      [.blocked, .unplayed, .unplayed, .blocked, .unplayed, .unplayed, .playedCorrectly, .unplayed],
      [.unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .unplayed, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == true, "There is a clear diagonal path through the matrix with 25% blocked cells.")
  }
  
  @Test func test8x8NoPath25Blocked() async throws {
    let matrix: [[GameCellState]] = [
      [.playedCorrectly, .blocked, .blocked, .unplayed, .blocked, .blocked, .blocked, .unplayed],
      [.unplayed, .blocked, .blocked, .blocked, .blocked, .unplayed, .blocked, .unplayed],
      [.blocked, .blocked, .unplayed, .blocked, .unplayed, .blocked, .unplayed, .blocked],
      [.unplayed, .blocked, .blocked, .blocked, .blocked, .unplayed, .blocked, .unplayed],
      [.unplayed, .blocked, .unplayed, .blocked, .blocked, .blocked, .blocked, .unplayed],
      [.blocked, .blocked, .blocked, .blocked, .unplayed, .blocked, .blocked, .blocked],
      [.blocked, .unplayed, .blocked, .blocked, .blocked, .blocked, .blocked, .unplayed],
      [.unplayed, .unplayed, .unplayed, .blocked, .blocked, .blocked, .blocked, .playedCorrectly]
    ]
    let result = isWinningPath(in: matrix)
    #expect(result == false, "Blocked cells prevent any valid winning path.")
  }
  
  
}
