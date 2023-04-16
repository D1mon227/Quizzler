//
//  ViewController.swift
//  Quizzler
//
//  Created by Dmitry Medvedev on 11.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: UIViewController {
    
    private let views = Views.shared
    private var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        addConstraints()
        quizBrain.updateCurrentQuestion()
        buttonsTarget()
    }
    
    private func showResult(sender: UIButton?) {
        switchButton()
        quizBrain.checkAnswers(sender)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            sender?.layer.borderWidth = 0
            self.nextQuestionOrResult()
            self.switchButton()
        }
    }
    
    private func nextQuestionOrResult() {
        if quizBrain.isLastQuestion() {
            quizBrain.questionNumber = 0
            quizBrain.score = 0
            quizBrain.updateCurrentQuestion()
        } else {
            quizBrain.questionNumber += 1
            quizBrain.updateCurrentQuestion()
        }
    }
    
    private func switchButton() {
        views.firstButton.isEnabled.toggle()
        views.secondButton.isEnabled.toggle()
        views.thirdButton.isEnabled.toggle()
    }
    
    private func buttonsTarget() {
        views.firstButton.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
        views.secondButton.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
        views.thirdButton.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
    }
    
    @objc private func buttonActions(_ sender: UIButton?) {
        showResult(sender: sender)
    }
}

extension ViewController {
    private func setViews() {
        view.backgroundColor = UIColor(hexString: "252C4A")
        view.addSubview(views.backgroundBubbles)
        view.addSubview(views.verticalStack)
        views.verticalStack.addArrangedSubview(views.scoreLabel)
        views.verticalStack.addArrangedSubview(views.questionTextLabel)
        views.verticalStack.addArrangedSubview(views.firstButton)
        views.verticalStack.addArrangedSubview(views.secondButton)
        views.verticalStack.addArrangedSubview(views.thirdButton)
        views.verticalStack.addArrangedSubview(views.progressBar)
    }
    
    private func addConstraints() {
        views.backgroundBubbles.snp.makeConstraints { make in
            make.height.equalTo(102)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        views.verticalStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.leading.equalTo(view.snp.leadingMargin)
        }
        
        views.firstButton.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        views.secondButton.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        views.thirdButton.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        views.progressBar.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
    }
}
