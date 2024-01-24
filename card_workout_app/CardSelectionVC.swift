//
//  CardSelectionVC.swift
//  card_workout_app
//
//  Created by Shaxobiddin on 24/01/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allCards
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.07,
            target: self,
            selector: #selector(showRandomImage),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func restartButton(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
