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
    init(view: WeekView)
    func openDay(button: UIButton)
    func openToolBarWidget(button: UIButton)
}

class WeekPresenter: WeekViewPresenter {
    var view: WeekView
    var days: [UITableViewController] = []
    var widgets: [UITableViewController] = []
    
    required init(view: WeekView) {
        self.view = view
        
        days = [
            MondayViewController(),
            TuesdayViewController(),
            WednesdayViewController(),
            ThursdayViewController(),
            FridayViewController(),
            SaturdayViewController(),
            SundayViewController()
        ]
    }
    
    func openDay(button: UIButton) {
        print(button.tag)
        view.openScreen(screen: days[button.tag])
    }
    
    func openToolBarWidget(button: UIButton) {
        
    }
}
