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
    
    let questions =  [
        Question(question: "A slug's blood is green.", answer: true),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: true),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: true),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: true),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: false),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: true),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: true),
        Question(question: "Google was originally called 'Backrub'.", answer: true),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: true),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: false),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: false),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: true)
    ]
    
    var currentQuestion = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[0].question
    }

    @IBAction func answerReceived(_ sender: UIButton) {
        let answer = NSString(string: sender.currentTitle!).boolValue // convert "True" or "False" to boolean data type
        
        if (currentQuestion < questions.capacity) {
            if (questions[currentQuestion].isCorrect(answer: answer)) {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            currentQuestion += 1
            updateQuestionUI()
        }
    }
    
    func updateQuestionUI() {
        if (currentQuestion < questions.capacity) {
            questionLabel.text = questions[currentQuestion].question
        } else {
            resetUI()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(delayedEffect), userInfo: nil, repeats: false)
    
    }
    
    @objc func delayedEffect() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func resetUI() {
        currentQuestion = 0
        questionLabel.text = questions[currentQuestion].question
    }
    
}

