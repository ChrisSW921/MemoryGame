//
//  GameViewController.swift
//  MemoryApp
//
//  Created by River McCaine on 2/10/21.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var watchCloselyLabel: UILabel!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    //MARK: - properties
    var flashIndex = 0
    var timer = Timer()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        GameController.shared.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        //Freeze user interaction
        GameController.shared.currentLevel += 1
        currentLevelLabel.text = "Current level: \(String(GameController.shared.currentLevel))"
        GameController.shared.presentLevel()
    }
    
    @IBAction func gameButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Game Functions
    func unlockInterface() {
        
    }
    
    func updateLevelFormula() {
        
    }
    
    func animateButtonFlashes() {
        
    }
    
    func hideNextLevelButton() {
        
    }
    
    func fadePlayerInstructions() {
        
    }

} // END OF CLASS 

extension GameViewController: PresentLevelDelegate{
    
    func presentLevel() {
        flashIndex = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
            
        }
    
    
    @objc func onTimerFires() {
        if flashIndex == GameController.shared.correctSequence.count {
            timer.invalidate()
            watchCloselyLabel.text = "Repeat pattern"
            //unlock screen for interaction
        } else {
            let currentButton = GameController.shared.correctSequence[flashIndex]
            switch currentButton {
            case 1:
                self.greenButton.flash()
            case 2:
                self.purpleButton.flash()
            case 3:
                self.redButton.flash()
            case 4:
                self.yellowButton.flash()
            default:
                print("No button to flash")
            }
            flashIndex += 1
        }
        
    }
}
