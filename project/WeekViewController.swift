//
//  ViewController.swift
//  project
//
//  Created by Anna Fedotova on 13.02.2024.
//

import UIKit

class WeekViewController: UIViewController {
    
    var firstButton = UIButton()
    var secondButton = UIButton()
    var thirdButton = UIButton()
    var forthButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.lightGray
        configureFirstButton()
        configureSecondButton()
        configureThirdButton()
        configureForthButton()
    }
    
    func configureFirstButton() {
        view.addSubview(firstButton)
        firstButton.setTitle("1 Week", for: .normal)
        firstButton.setTitleColor(.darkGray, for: .normal)
        firstButton.titleLabel?.font = Constants.titleFont
        firstButton.backgroundColor = Constants.lightPink
        firstButton.layer.cornerRadius = Constants.corners
        firstButton.layer.borderColor = Constants.grape
        firstButton.layer.borderWidth = Constants.borderWidth
        firstButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                firstButton.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
        firstButton.addTarget(self, action: #selector(firstButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func firstButtonPressed() {
        present(FirstWeekViewController(), animated: true)
    }
    
    func configureSecondButton() {
        view.addSubview(secondButton)
        secondButton.setTitle("2 Week", for: .normal)
        secondButton.setTitleColor(.darkGray, for: .normal)
        secondButton.titleLabel?.font = Constants.titleFont
        secondButton.backgroundColor = Constants.lavender
        secondButton.layer.cornerRadius = Constants.corners
        secondButton.layer.borderColor = Constants.grape
        secondButton.layer.borderWidth = Constants.borderWidth
        secondButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 0.4),
                secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                secondButton.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
        secondButton.addTarget(self, action: #selector(secondButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func secondButtonPressed() {
        present(SecondWeekViewController(), animated: true)
    }
    
    func configureThirdButton() {
        view.addSubview(thirdButton)
        thirdButton.setTitle("3 Week", for: .normal)
        thirdButton.setTitleColor(.darkGray, for: .normal)
        thirdButton.titleLabel?.font = Constants.titleFont
        thirdButton.backgroundColor = Constants.blue
        thirdButton.layer.cornerRadius = Constants.corners
        thirdButton.layer.borderColor = Constants.grape
        thirdButton.layer.borderWidth = Constants.borderWidth
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 0.4),
                thirdButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                thirdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                thirdButton.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
        thirdButton.addTarget(self, action: #selector(thirdButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func thirdButtonPressed() {
        present(ThirdWeekViewController(), animated: true)
    }
    
    func configureForthButton() {
        view.addSubview(forthButton)
        forthButton.setTitle("4 Week", for: .normal)
        forthButton.setTitleColor(.darkGray, for: .normal)
        forthButton.titleLabel?.font = Constants.titleFont
        forthButton.backgroundColor = Constants.purple
        forthButton.layer.cornerRadius = Constants.corners
        forthButton.layer.borderColor = Constants.grape
        forthButton.layer.borderWidth = Constants.borderWidth
        forthButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                forthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 0.4),
                forthButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                forthButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                forthButton.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
        forthButton.addTarget(self, action: #selector(forthButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func forthButtonPressed() {
        present(ForthWeekViewController(), animated: true)
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightPink = UIColor(red: 232/255.0, green: 204/255.0, blue: 215/255.0, alpha: 0.7)
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let lavender = UIColor(red: 0xd0/255.0, green: 0xd5/255.0, blue: 0xf7/255.0, alpha: 1)
        static let blue = UIColor(red: 0xbf/255.0, green: 0xca/255.0, blue: 0xe2/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let purple = UIColor(red: 0xda/255.0, green: 0xbf/255.0, blue: 0xde/255.0, alpha: 1)
        static let borderWidth: CGFloat = 2
    }
    
   
}

