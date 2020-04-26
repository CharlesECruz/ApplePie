//
//  Game.swift
//  ApplePie
//
//  Created by Carlos Camacho on 2020-04-23.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMove: Int
    var guessLetters: [Character]

    mutating func playerGuess(letter:Character){
        guessLetters.append(letter)
        if !word.contains(letter){
            incorrectMove -= 1
        }
    }
    var formatingWord:String{
        var guessWord = ""
        for letter in word{
            if guessLetters.contains(letter){
                guessWord += "\(letter)"
            }else{
                guessWord += "_"
            }
        }
        return guessWord
    }
    
}
