//
//  Question.swift
//  Quizzler
//
//  Created by Dmitry Medvedev on 13.04.2023.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = ca
    }
}
