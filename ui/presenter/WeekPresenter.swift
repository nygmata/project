//
//  WeekPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit

protocol WeekView: AnyObject {
    func openScreen(screen: UIViewController)
}

protocol WeekViewPresenter {
    init(view: WeekView, id: Int)
    func openDay(button: UIButton)
    func openWidget(button: UIButton)
}

class WeekPresenter: WeekViewPresenter {
    var id: Int!
    var view: WeekView
    var days: [UITableViewController] = []
    var widgets: [UIViewController] = []
    
    required init(view: WeekView, id: Int) {
        self.view = view
        
        self.id = id
        
        widgets = [
            GoalsViewController(),
            ResultsViewController(),
            ImprovementViewController()
        ]
    }
    
    func openDay(button: UIButton) {
        view.openScreen(screen: DayViewController(index: id*10 + button.tag))
    }
    
    func openWidget(button: UIButton) {
        view.openScreen(screen: widgets[button.tag])
    }
}
