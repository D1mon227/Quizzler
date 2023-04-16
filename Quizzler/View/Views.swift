//
//  Views.swift
//  Quizzler
//
//  Created by Dmitry Medvedev on 16.04.2023.
//

import UIKit

class Views {
    
    static let shared = Views()
    
    lazy var backgroundBubbles: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Background-Bubbles")
        return element
    }()

    lazy var verticalStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.distribution = .fillProportionally
        return element
    }()

    lazy var questionTextLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .center
        element.numberOfLines = 0
        element.font = UIFont.boldSystemFont(ofSize: 30)
        element.textColor = .white
        return element
    }()

    lazy var firstButton: UIButton = {
        let element = UIButton()
        element.setTitle("Heart", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        element.setTitleColor(.white, for: .normal)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        return element
    }()

    lazy var secondButton: UIButton = {
        let element = UIButton()
        element.setTitle("Skin", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        element.setTitleColor(.white, for: .normal)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        return element
    }()
    
    lazy var thirdButton: UIButton = {
        let element = UIButton()
        element.setTitle("Large Intestine", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        element.setTitleColor(.white, for: .normal)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        return element
    }()

    lazy var progressBar: UIProgressView = {
        let element = UIProgressView()
        element.progressTintColor = UIColor(hexString: "FF75A8")
        return element
    }()
    
    lazy var scoreLabel: UILabel = {
        let element = UILabel()
        element.text = "Score: 0"
        element.textColor = .white
        element.font = UIFont.systemFont(ofSize: 17)
        element.textAlignment = .left
        return element
    }()
}
