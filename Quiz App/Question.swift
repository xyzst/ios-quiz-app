//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Darren Rambaud on 2/8/20.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: Bool
    
    init(question: String, answer: Bool) {
        self.question = question
        self.answer = answer
    }
    
    func isCorrect(answer: Bool) -> Bool {
        return self.answer == answer
    }
}
