//
//  GameController.swift
//  MemoryApp
//
//  Created by Devin Flora on 2/10/21.
//

import Foundation

protocol PresentLevelDelegate: AnyObject {
    func presentLevel()
}

class GameController {
    
    // MARK: - Properties
    static let shared = GameController()
    var correctSequence: [Int] = []
    var guessedSequence: [Int] = []
    var currentLevel: Int = 1
    weak var delegate: PresentLevelDelegate?
    
    // MARK: - Methods
    func didTapSquare(button: Int) -> Bool {
        guessedSequence.append(button)
        return guessedSequence.last == correctSequence[guessedSequence.count - 1]
    }
    
    func presentLevel(currentLevel: Int) {
        correctSequence = []
        guessedSequence = []
        for num in 0..<currentLevel {
            correctSequence.append(Int.random(in: 1...4))
        }
        delegate?.presentLevel()
    }
    
    func nextLevel() {
        
    }
    
    func saveHighScore() {
        
    }
    
    func didBeatLevel() -> Bool {
        return correctSequence.count == guessedSequence.count
    }
    
}//End of Class
