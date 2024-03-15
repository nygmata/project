//
//  BoardingPresenter.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit

protocol BoardingView: AnyObject {
    
}

protocol BoardingViewPresenter {
    init(view: BoardingView)
    func makeOnBoardingsScreens() -> [UIViewController]
}

struct BoardingItem {
    let imageName: String
    let titleText: String
    let subtitleText: String
}

class BoardingPresenter: BoardingViewPresenter {
    var view: BoardingView!
    var boardings: [BoardingItem] = []
    var lastScreen: UIViewController!
    
    required init(view: BoardingView) {
        self.view = view
        boardings = [
            BoardingItem(imageName: "calendar",
                         titleText: "Always put things off for later?",
                         subtitleText: "Setting and achieving short-term goals is fast, simple and convenient"),
            BoardingItem(imageName: "learn",
                         titleText: "Learn",
                         subtitleText: "Learn time management"),
            BoardingItem(imageName: "star",
                         titleText: "Have fun",
                         subtitleText: "Have fun setting and acieving your goals")
        ]
        lastScreen = WeeksViewController()
    }
    
    func makeOnBoardingsScreens() -> [UIViewController] {
        var pages: [UIViewController] = []
        for boarding in boardings {
            pages.append(OnBoardingItem(imageName: boarding.imageName, titleText: boarding.titleText, subtitleText: boarding.subtitleText))
        }
        pages.append(lastScreen)
        
        return pages
    }
}
