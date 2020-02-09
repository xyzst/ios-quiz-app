//
//  ViewController.swift
//  Quiz App
//
//  Created by Darren Rambaud on 02/03/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.getCurrentQuestion()
        progressBar.setProgress(quizBrain.getCurrentProgress(), animated: true)
    }

    @IBAction func answerReceived(_ sender: UIButton) {
        let answer = NSString(string: sender.currentTitle!).boolValue
        
        sender.backgroundColor = quizBrain.isCorrect(answer) ? UIColor.green : UIColor.red
        questionLabel.text = quizBrain.getCurrentQuestion()
        progressBar.setProgress(quizBrain.getCurrentProgress(), animated: true)

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(delayedEffect), userInfo: nil, repeats: false)
    }
    
    @objc func delayedEffect() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

