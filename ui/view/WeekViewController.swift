//
//  ViewController.swift
//  project
//
//  Created by Paul Nikulshin on 11.03.2024.
//

import UIKit

class WeekViewController: UIViewController {
    var id: Int = 0
    var buttons : [Button2] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        buttons.append(Button2(title: "Main Week Goals", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: goalsButtonPressed))
        buttons.append(Button2(title: "Week Results", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: resultsButtonPressed))
        buttons.append(Button2(title: "Week Improvements", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: improvementsButtonPressed))
        
        configureButton(index: 0)
        configureButton(index: 1)
        configureButton(index: 2)

        configureToolBar()
    }
    
    func configureToolBar() {
        let toolBarButtons = ToolBar(action: toolBarPressed)
        let toolbar = UIToolbar(frame: CGRectMake(0, 100, view.frame.width, 50))
 
        toolbar.barTintColor = Constants.goalsPink
        toolbar.isTranslucent = false
        toolbar.tintColor = .darkGray
  
        toolbar.layer.borderColor = Constants.grape

        toolbar.items = [toolBarButtons.mondayButton, toolBarButtons.tuesdayButton, toolBarButtons.wednesdayButton, toolBarButtons.thursdayButton, toolBarButtons.fridayButton, toolBarButtons.saturdayButton, toolBarButtons.sundayButton]
        view.addSubview(toolbar)
    }
    
    @objc
    func toolBarPressed() {
        //present(GoalsViewController(), animated: true)
    }
 
    func configureButton(index: Int) {
        view.addSubview(buttons[index])
        print(buttons[index].backgroundColor == Constants.goalsPink)
        buttons[index].translatesAutoresizingMaskIntoConstraints = false
        if (index == 0) {
            
            NSLayoutConstraint.activate([
                buttons[index].topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
            ])
        } else {
            NSLayoutConstraint.activate([
                buttons[index].topAnchor.constraint(equalTo: buttons[index - 1].bottomAnchor)
            ])
        }
            
        NSLayoutConstraint.activate([
            buttons[index].leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttons[index].trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttons[index].heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        
    }
    
    @objc
    func goalsButtonPressed() {
        //present(GoalsViewController(), animated: true)
    }
    
    @objc
    func resultsButtonPressed() {
        //present(GoalsViewController(), animated: true)
    }
    
    @objc
    func improvementsButtonPressed() {
        //present(GoalsViewController(), animated: true)
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
        static let borderWidth: CGFloat = 2
        
    }
}

