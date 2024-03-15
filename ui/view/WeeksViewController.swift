//
//  WeeksViewController.swift
//  project
//
//  Created by Paul Nikulshin on 11.03.2024.
//
import UIKit

class WeeksViewController: UIViewController, WeeksView {
    
    enum Constants {
        static let week: String = "Week"
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
        static let borderWidth: CGFloat = 2
    }
    
    var presenter: WeeksViewPresenter!
    let n = 4
    var buttons: [Button] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeeksPresenter(view: self)
        configuteUI()
    }
    
    func configuteUI() {
        for num in 1...n {
            buttons.append(Button(title: Constants.week + String(num), id: num, font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape))
            let button: Button = buttons[num-1]
            view.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            if num == 1 {
                NSLayoutConstraint.activate([button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)])
            } else {
                NSLayoutConstraint.activate([button.topAnchor.constraint(equalTo: buttons[num-2].bottomAnchor, constant: 0.4)])
            }
                NSLayoutConstraint.activate([
                    button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    button.heightAnchor.constraint(equalToConstant: Constants.height)
                ])
            button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        }
    }
    
    @objc
    func buttonPress(button: Button) {
        presenter.openScreen(button: button)
    }
    
    func openScreen(screen: UIViewController) {
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
}
