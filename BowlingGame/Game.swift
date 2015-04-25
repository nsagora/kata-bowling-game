//
//  Game.swift
//  BowlingGame
//
//  Created by Alex Cristea on 11/01/15.
//  Copyright (c) 2015 iOS NSAgora. All rights reserved.
//

class Game {
    
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
                score += strikeBonus(frameIndex)
                frameIndex += 1;
            }
            
            else if isSpare(frameIndex) {
                score += spareBonus(frameIndex)
                frameIndex += 2;
            }
                
            else {
                score += sumOfPins(frameIndex)
                frameIndex += 2;
            }
        }
        
        return score;
    }
    
    private func isSpare(frameIndex:Int)->Bool {
        return (rolls[frameIndex] + rolls[frameIndex + 1] == 10)
    }
    
    private func spareBonus(frameIndex:Int)->Int {
        return 10 + rolls[frameIndex + 2]
    }
    
    private func isStrike(frameIndex:Int)->Bool {
        return (rolls[frameIndex] == 10)
    }
    
    private func strikeBonus(frameIndex:Int)->Int {
        return 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    private func sumOfPins(frameIndex:Int)->Int {
        return rolls[frameIndex] + rolls[frameIndex + 1]
    }
}
