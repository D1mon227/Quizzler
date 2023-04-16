//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Dmitry Medvedev on 16.04.2023.
//

import UIKit

struct QuizBrain {
    
    let views = Views.shared
    
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ca: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ca: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ca: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ca: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ca: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ca: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ca: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ca: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ca: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ca: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswers(_ sender: UIButton?) {
        if sender?.titleLabel?.text == questions[questionNumber].correctAnswer {
            sender?.layer.borderWidth = 5
            sender?.layer.cornerRadius = 23
            sender?.layer.borderColor = UIColor.systemGreen.cgColor
            score += 1
            views.scoreLabel.text = "Score: \(score)"
        } else {
            sender?.layer.borderWidth = 5
            sender?.layer.cornerRadius = 23
            sender?.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    private func getQuestionText() -> String {
        let question = questions[questionNumber].text
        return question
    }
    
    func isLastQuestion() -> Bool {
        let lastQuestion = questionNumber == questions.count - 1
        return lastQuestion
    }
    
    func updateCurrentQuestion() {
        views.questionTextLabel.text = getQuestionText()
        views.firstButton.setTitle(questions[questionNumber].answer[0], for: .normal)
        views.secondButton.setTitle(questions[questionNumber].answer[1], for: .normal)
        views.thirdButton.setTitle(questions[questionNumber].answer[2], for: .normal)
        views.scoreLabel.text = "Score: \(score)"
        views.progressBar.progress = getProgress()
    }
    
    private func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(questions.count)
        return progress
    }
}
