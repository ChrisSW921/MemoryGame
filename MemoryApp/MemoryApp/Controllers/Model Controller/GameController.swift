//
//  GameController.swift
//  MemoryApp
//
//  Created by Devin Flora on 2/10/21.
//

import CoreData

protocol PresentLevelDelegate: AnyObject {
    func presentLevel()
}

class GameController {
    
    // MARK: - Properties
    static let shared = GameController()
    var correctSequence: [Int] = []
    var guessedSequence: [Int] = []
    var currentLevel: Int = 1
    var highscore: Int?
    var highscoreCoreData: Highscore?
    weak var delegate: PresentLevelDelegate?
    
    private lazy var fetchRequest: NSFetchRequest<Highscore> = {
        let request = NSFetchRequest <Highscore>(entityName: "Highscore")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
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
        self.highscoreCoreData?.score = String(self.currentLevel)
        self.highscore = currentLevel
        CoreDataStack.saveContext()
    }
    
    func fetchHighscore() {
        //fetch Highscore if there is one
        let highscores = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        if highscores.count > 0 {
            self.highscoreCoreData = highscores[0]
            
            guard let highscoreAsString = highscores[0].score else { return }
            guard let highscore = Int(highscoreAsString) else { return }
            
            self.highscore = highscore
        }
    }
    
    func didBeatLevel() -> Bool {
        return correctSequence.count == guessedSequence.count
    }
    
}//End of Class
