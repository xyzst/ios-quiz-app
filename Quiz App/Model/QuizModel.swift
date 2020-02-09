//
//  QuizBrain.swift
//  Quiz App
//
//  This is the "model" in the MVC design pattern. Contains the main logic for
//  determining if a user provided answer is correct or incorrect.
//
//  Maintains state about the currently selected question.
//
//  Created by Darren Rambaud on 2/8/20.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import Foundation

struct QuizModel {
    let questions =  [
        Question(question: "A slug's blood is green.", answer: true, points: 10.0),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: true, points: 5.0),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: true, points: 2.5),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: true, points: 3.0),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: false, points: 15.0),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: true, points: 20.0),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: true, points: 100.0),
        Question(question: "Google was originally called 'Backrub'.", answer: true, points: 200.0),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: true, points: 500.0),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: false, points: 1000.0),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: false, points: 2000.0),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: true, points: 100000.0)
    ]
    
    var currentQuestion = 0
    
    var score = 0.0
    
    var lastScore = 0.0
    
    mutating func isCorrect(_ answer: Bool) -> Bool {
        let isCorrect = questions[currentQuestion].isCorrect(answer: answer)
        if isCorrect {
            updateScore()
        }
        
        if (!hasAvailableQuestions()) {
            self.currentQuestion = 0
            self.lastScore = score
            self.score = 0
        } else {
            currentQuestion += 1
        }
        
        return isCorrect
        
    }
    
    mutating func updateScore() {
        self.score += questions[currentQuestion].points
    }
    
    func getLastScore() -> Double {
        return self.lastScore
    }
    
    func getScore() -> Double {
        return self.score
    }
    
    func getCurrentQuestion() -> String {
        return questions[currentQuestion].question
    }
    
    func getCurrentAnswer() -> Bool {
        return questions[currentQuestion].answer
    }
    
    func hasAvailableQuestions() -> Bool {
        return currentQuestion < (questions.count - 1)
    }
    
    func getCurrentProgress() -> Float {
        return Float(currentQuestion + 1) / Float(questions.count)
    }
}
    
