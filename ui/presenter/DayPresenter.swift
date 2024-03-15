//
//  DayPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit

protocol DayView: AnyObject {
    
}

protocol DayViewPresenter {
    init(view: DayView)
}

class DayPresenter: DayViewPresenter {
    var view: DayView!
    
    required init(view: DayView) {
        self.view = view
    }
}
