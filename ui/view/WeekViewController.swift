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
        
        buttons.append(Button2(title: "Main Week Goals", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape))
        buttons.append(Button2(title: "Week Results", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape))
        buttons.append(Button2(title: "Week Improvements", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape))
        
        configureButton(index: 0)
        configureButton(index: 1)
        configureButton(index: 2)

        configureToolBar()
    }
    
    func configureToolBar() {
        let toolBarButtons = ToolBar()
        let toolbar = UIToolbar(frame: CGRectMake(0, 100, view.frame.width, 50))
 
        toolbar.barTintColor = Constants.goalsPink
        toolbar.isTranslucent = false
        toolbar.tintColor = .darkGray
  
        toolbar.layer.borderColor = Constants.grape

        toolbar.items = [toolBarButtons.mondayButton, toolBarButtons.tuesdayButton, toolBarButtons.wednesdayButton, toolBarButtons.thursdayButton, toolBarButtons.fridayButton, toolBarButtons.saturdayButton, toolBarButtons.sundayButton]
        view.addSubview(toolbar)
    }
    @objc
    func toolBarPressed(sender: UIButton) {
        let index = sender.tag
        print(index)
        switch index {
            case 0:
                present(MondayViewController(), animated: true)
            case 1:
                present(TuesdayViewController(), animated: true)
            case 2:
                present(WednesdayViewController(), animated: true)
            case 3:
                present(ThursdayViewController(), animated: true)
            case 4:
                present(FridayViewController(), animated: true)
            case 5:
                present(SaturdayViewController(), animated: true)
            default:
                present(SundayViewController(), animated: true)
        }
        
    }
 
    func configureButton(index: Int) {
        view.addSubview(buttons[index])
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
        if (index == 0) {
            buttons[index].addTarget(self, action: #selector(goalsButtonPressed), for: .touchUpInside)
        } else if (index == 1) {
            buttons[index].addTarget(self, action: #selector(resultsButtonPressed), for: .touchUpInside)
        } else {
            buttons[index].addTarget(self, action: #selector(improvementsButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc
    public func goalsButtonPressed()  {
        print("goals")
        present(GoalsViewController(), animated: true)
    }
    
    @objc
    public func resultsButtonPressed() {
        print("results")
        present(ResultsViewController(), animated: true)
    }
    
    @objc
    public func improvementsButtonPressed() {
        print("improve")
        present(ImprovementViewController(), animated: true)
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
