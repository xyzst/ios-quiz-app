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
        Question(question: "4 + 2 is equal to 6?", answer: true),
        Question(question: "5 - 3 is greater than 1?", answer: true),
        Question(question: "3 + 8 is less than 10?", answer: false)
    ]
    
    var whichQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[0].question
    }

    @IBAction func answerReceived(_ sender: UIButton) {
        let answer = NSString(string: sender.currentTitle!).boolValue // convert "True" or "False" to boolean data type
        
        if (whichQuestion < questions.capacity) {
            if (questions[whichQuestion].isCorrect(answer: answer)) {
                print("you choose the correct answer!")
            } else {
                print("wrong!!!")
            }
            whichQuestion += 1
            updateQuestionUI()
        }
    }
    
    func updateQuestionUI() {
        if (whichQuestion < questions.capacity) {
            questionLabel.text = questions[whichQuestion].question
        } else {
            resetUI()
        }
    }
    
    func resetUI() {
        whichQuestion = 0
        questionLabel.text = questions[whichQuestion].question
    }
    
}

