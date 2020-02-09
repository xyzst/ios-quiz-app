//
//  ViewController.swift
//  Quiz App
//
//  As per MVC architecture, holds references to the model and view. Depending
//  on the state of the model, will update the view elements accordingly.
//
//  Created by Darren Rambaud on 02/03/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var lastScoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizModel.getCurrentQuestion()
        scoreLabel.text = "Current Score: \(quizModel.getScore())"
        lastScoreLabel.text = "Last Score: \(quizModel.getLastScore())"
        progressBar.setProgress(quizModel.getCurrentProgress(), animated: true)
    }

    @IBAction func answerReceived(_ sender: UIButton) {
        let answer = NSString(string: sender.currentTitle!).boolValue
        
        sender.backgroundColor = quizModel.isCorrect(answer) ? UIColor.green : UIColor.red
        scoreLabel.text = "Current Score: \(quizModel.getScore())"
        lastScoreLabel.text = "Last Score: \(quizModel.getLastScore())"
        questionLabel.text = quizModel.getCurrentQuestion()
        progressBar.setProgress(quizModel.getCurrentProgress(), animated: true)

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(delayedEffect), userInfo: nil, repeats: false)
    }
    
    @objc func delayedEffect() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

