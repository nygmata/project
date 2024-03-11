//
//  WeeksPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 11.03.2024.
//

protocol WeeksView: AnyObject {
    
}

protocol WeeksViewPresenter {
    init(view: WeeksView)
}

class WeeksPresenter: WeeksViewPresenter {
    var view: WeeksView
    
    required init(view: WeeksView) {
        self.view = view
    }
}
