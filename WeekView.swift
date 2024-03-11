import UIKit

class WeekViewController: UIViewController {
    var buttons : [Button] = []
    var toolBar : [ToolBar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        buttons.append(Button(title: "Main Week Goals", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: goalsButtonPressed))
        buttons.append(Button(title: "Week Results", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: resultsButtonPressed))
        buttons.append(Button(title: "Week Improvements", font: Constants.titleFont!, backgroundColor: Constants.goalsPink, borderColor: Constants.grape, action: improvementsButtonPressed))
        toolBar.append(ToolBar(action: toolBarPressed))
        
        configureButton(index: 0)
        configureButton(index: 1)
        configureButton(index: 2)
        
        configureToolBar()
    }
    
    func configureToolBar() {
        view.addSubview(toolBar[0])
        toolBar[0].isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            toolBar[0].topAnchor.constraint(equalTo: buttons[2].bottomAnchor, constant: 100),
             toolBar[0].leadingAnchor.constraint(equalTo: view.leadingAnchor),
             toolBar[0].trailingAnchor.constraint(equalTo: view.trailingAnchor),
             toolBar[0].heightAnchor.constraint(equalToConstant: Constants.height)
         ])
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
                buttons[index].topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
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
