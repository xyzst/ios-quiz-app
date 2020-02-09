//
//  Question.swift
//  Quiz App
//
//  Created by Darren Rambaud on 2/8/20.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: Bool
    let points: Double
    
    init(question: String, answer: Bool, points: Double) {
        self.question = question
        self.answer = answer
        self.points = points
    }
    
    func isCorrect(answer: Bool) -> Bool {
        return self.answer == answer
    }
}
