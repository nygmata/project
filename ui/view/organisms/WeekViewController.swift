//
//  ViewController.swift
//  project
//
//  Created by Paul Nikulshin on 11.03.2024.
//

import UIKit

class WeekViewController: UIViewController, WeekView {
    var id: Int = 0
    var buttons: [Button] = []
    var toolBarNames: [String] = ["Week Improvements", "Main Week Goals", "Week Results"]
    var buttonColors: [UIColor] = [Constants.blue, Constants.lightBlue, Constants.green]
    var presenter: WeekViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeekPresenter(view: self, id: id)
        view.backgroundColor = .white
        
        for i in 0...2 {
            configureButton(index: i)
        }

        configureToolBar()
    }
    
    func configureToolBar() {
        let toolBarButtons = ToolBar(selector: #selector(dayButtonPressed))
        let toolbar = UIToolbar(frame: CGRectMake(0, 100, view.frame.width, 50))
 
        toolbar.barTintColor = .white
        toolbar.isTranslucent = false
        toolbar.tintColor = .darkGray
  
        toolbar.layer.borderColor = Constants.grape

        toolbar.items = toolBarButtons.buttons
        toolbar.backgroundColor = .white
        view.addSubview(toolbar)
    }
 
    func configureButton(index: Int) {
        let button: Button = Button(title: toolBarNames[index], font: Constants.titleFont!, backgroundColor: buttonColors[index%3], borderColor: Constants.grape)
        buttons.append(button)
        button.tag = index
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if (index == 0) {
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
            ])
        } else {
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: buttons[index - 1].bottomAnchor, constant: 50)
            ])
        }
            
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        button.addTarget(self, action: #selector(widgetButtonPressed), for: .touchUpInside)
    }
    
    @objc
    public func widgetButtonPressed(button: Button)  {
        presenter.openWidget(button: button)
    }
    
    @objc
    public func dayButtonPressed(button: UIButton) {
        presenter.openDay(button: button)
    }
    
    func openScreen(screen: UIViewController) {
        present(screen, animated: true)
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
        static let green = UIColor(red: 0x4f/255.0, green: 0xC1/255.0, blue: 0xB9/255.0, alpha: 1)
        static let blue = UIColor(red: 0x4D/255.0, green: 0x69/255.0, blue: 0xF9/255.0, alpha: 1)
        static let lightBlue = UIColor(red: 0x65/255.0, green: 0xB3/255.0, blue: 0xFF/255.0, alpha: 1)
    }
}
