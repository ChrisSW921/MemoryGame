//
//  GameController.swift
//  MemoryApp
//
//  Created by Devin Flora on 2/10/21.
//

import Foundation

class GameController {
    
    // MARK: - Properties
    static let shared = GameController()
    var correctSequence: [Int] = []
    var guessedSequence: [Int] = []
    
    // MARK: - Methods
    func didTapSquare(button: Int) -> Bool {
        guessedSequence.append(button)
        if guessedSequence.elementsEqual(correctSequence) {
            return true
        } else {
            return false
        }
        //Add button Int to the guessedSequence
        // if guessedSequence Int matches correctSequence return true
        // else return false
    }
    
    func presentLevel() {
        
    }
    
    func nextLevel() {
        
    }
    
    func saveHighScore() {
        
    }
    
}//End of Class
