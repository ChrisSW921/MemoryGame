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

    var currentLevel: Int = 0
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
        return guessedSequence.last == correctSequence[guessedSequence.count - 1]
    }
    
    func presentLevel() {
        correctSequence = []
        guessedSequence = []
        
        for _ in 0..<currentLevel {
            correctSequence.append(Int.random(in: 1...4))
        }
        delegate?.presentLevel()
    }
    
    func saveHighScore() {
        if let existingHighScore = highscoreCoreData {
            self.highscoreCoreData?.score = String(self.currentLevel)
            self.highscore = currentLevel
            CoreDataStack.saveContext()
        }else {
            Highscore(score: String(self.currentLevel))
            self.highscore = currentLevel
            CoreDataStack.saveContext()
        }
        
    }
    
    func fetchHighscore() {
        //fetch Highscore if there is one
        let highscores = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        if highscores.count > 0 {
            self.highscoreCoreData = highscores[0]
            
            guard let highscoreAsString = highscores[0].score else { return }
            guard let highscore = Int(highscoreAsString) else { return }
            
            self.highscore = highscore
        }else {
            self.highscore = 0
        }
    }
    
    func didBeatLevel() -> Bool {
        return correctSequence.count == guessedSequence.count
    }
    
}//End of Class
