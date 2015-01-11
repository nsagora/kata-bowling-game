//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Alex Cristea on 11/01/15.
//  Copyright (c) 2015 Alex Cristea. All rights reserved.
//

import UIKit
import XCTest

class BowlingGameTests: XCTestCase {

    var g:Game = Game();
    
    override func setUp() {
        g = Game()
    }
    
    private func rollMany(n:Int, pins:Int) {
        for i in 0..<n {
            g.roll(pins)
        }
    }
    
    private func rollSpare() {
        g.roll(5)
        g.roll(5)
    }
    
    private func rollStrike() {
        g.roll(10)
    }
    
    func testGutterGame () {
        rollMany(20, pins: 0)
        XCTAssertEqual(0, g.score())
    }
    
    func testAllOnes() {
        rollMany(20, pins: 1)
        XCTAssertEqual(20, g.score())
    }
    
    func testOneSpare() {
        rollSpare()
        g.roll(3)
        rollMany(17, pins: 0)
        XCTAssertEqual(16, g.score())
    }
    
    func testOneStrike() {
        rollStrike()
        g.roll(3)
        g.roll(4)
        rollMany(16, pins: 0)
        
        XCTAssertEqual(24, g.score())
    }
    
    func testPerfectGame() {
        rollMany(12, pins: 10)
        XCTAssertEqual(300, g.score())
    }
}
