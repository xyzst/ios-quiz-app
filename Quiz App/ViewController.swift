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
    
    struct Question {
        var question = ""
        var answer = false
    }
    
    let qs =  [
        Question(question: "4 + 2 is equal to 6?", answer: true),
        Question(question: "5 - 3 is greater than 1?", answer: true),
        Question(question: "3 + 8 is less than 10?", answer: false)
    ]
    
//    let questions = [
//        0: [
//            "question": "4 + 2 is equal to 6?",
//            "answer": true
//        ],
//        1: [
//            "question": "5 - 3 is greater than 1?",
//            "answer": true
//        ],
//        2: [
//            "question": "3 + 8 is less than 10?",
//            "answer": false
//        ]
//    ]
    
    var whichQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        questionLabel.text = questions[0]?["question"] as? String
        questionLabel.text = qs[0].question
    }

    @IBAction func answerReceived(_ sender: UIButton) {
        let answer = NSString(string: sender.currentTitle!).boolValue // convert "True" or "False" to boolean data type
        
//        if (whichQuestion < questions.capacity) {
        if (whichQuestion < qs.capacity) {
//            if (questions[whichQuestion]?["answer"] as? Bool == answer) {
            if (qs[whichQuestion].answer == answer) {
                print("you choose the correct answer!")
            } else {
                print("wrong!!!")
            }
            whichQuestion += 1
            updateQuestionUI()
        }
    }
    
    func updateQuestionUI() {
//        if (whichQuestion < questions.capacity) {
        if (whichQuestion < qs.capacity) {
//            questionLabel.text = questions[whichQuestion]?["question"] as? String
            questionLabel.text = qs[whichQuestion].question
        } else {
//            questionLabel.text = "No more questions!"
            whichQuestion = 0
        }
    }
    
}

