//
//  ViewController.swift
//  ApplePie
//
//  Created by Carlos Camacho on 2020-04-23.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var corectWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet var letterButton: [UIButton]!
    var currentGame:Game!
    
    var listWords = ["buccaneer", "swift", "glorious","incandescent", "bug", "program"]
    let incorrectGuess = 7
    
    var wins = 0{
        didSet{
            newRound()
        }
    }
    var losses = 0{
        didSet{
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    func newRound(){
        if !listWords.isEmpty{
            enableButtons(enable:true)
            let newWord = listWords.removeFirst()
            currentGame = Game(word: newWord,incorrectMove:incorrectGuess, guessLetters: [])
            updateUI()
        }else{
            enableButtons(enable:false)
        }
        
    }
    func enableButtons(enable:Bool){
        for button in letterButton{
            button.isEnabled = enable
        }
    }
    func updateUI(){
        
        var letters = [String]()
        for letter in currentGame.formatingWord{
            letters.append(String(letter))
        }
        let wordSpace = letters.joined(separator: " ")
        corectWordLabel.text = wordSpace
        scoreLabel.text = "Wins:\(wins), Losses:\(losses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMove)")
        
    }
    func updateGameStatus(){
        if currentGame.incorrectMove == 0{
            losses += 1
        }else if currentGame.word == currentGame.formatingWord{
            wins += 1
        }else{
            updateUI()
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuess(letter:letter)
        updateGameStatus()
    }
    
}

