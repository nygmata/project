//
//  WeeksPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 11.03.2024.
//

import UIKit

protocol WeeksView: AnyObject {
    func openScreen(screen: UIViewController)
}

protocol WeeksViewPresenter {
    init(view: WeeksView)
    func openScreen(button: Button)
    func openToolbar(button: UIButton)
}

class WeeksPresenter: WeeksViewPresenter {
    var view: WeeksView
    var toolbarScreens: [UIViewController] = []
    
    required init(view: WeeksView) {
        self.view = view
        
        toolbarScreens = [
            AboutViewController(),
            AboutViewController()
        ]
    }
    
    func openScreen(button: Button) {
        let viewController = WeekViewController()
        viewController.id = button.id
        view.openScreen(screen: viewController)
    }
    
    func openToolbar(button: UIButton) {
        view.openScreen(screen: toolbarScreens[button.tag])
    }
}
