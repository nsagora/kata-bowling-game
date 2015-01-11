//
//  Game.swift
//  BowlingGame
//
//  Created by Alex Cristea on 11/01/15.
//  Copyright (c) 2015 Alex Cristea. All rights reserved.
//

import UIKit

class Game: NSObject {
    
    private var rolls:Array<Int> = Array(count: 21, repeatedValue:0);
    private var currentRoll:Int = 0;

    func roll(pins:Int) {
        rolls[currentRoll++] = pins;
    }
    
    func score()->Int {
        var score = 0;
        var frameIndex = 0;
        
        for var frame = 0; frame < 10; ++frame {
            
            if isStrike(frameIndex) {
                score += strikeBonusInFrame(frameIndex)
                frameIndex += 1;
            }
            
            else if isSpareIndex(frameIndex) {
                score += spareBonus(frameIndex)
                frameIndex += 2;
            }
                
            else {
                score += sumOfPinsInFrame(frameIndex)
                frameIndex += 2;
            }
        }
        
        return score;
    }
    
    private func isSpareIndex(frameIndex:Int)->Bool {
        return (rolls[frameIndex] + rolls[frameIndex+1] == 10)
    }
    
    private func spareBonus(frameIndex:Int)->Int {
        return 10 + rolls[frameIndex+2]
    }
    
    private func isStrike(frameIndex:Int)->Bool {
        return (rolls[frameIndex] == 10)
    }
    
    private func strikeBonusInFrame(frameIndex:Int)->Int {
        return 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    private func sumOfPinsInFrame(frameIndex:Int)->Int {
        return rolls[frameIndex] + rolls[frameIndex+1]
    }
}
