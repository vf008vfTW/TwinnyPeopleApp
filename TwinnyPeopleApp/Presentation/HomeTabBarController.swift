//
//  HomeTabBarController.swift
//  TwinnyPeopleApp
//
//  Created by 트위니 on 2022/05/18.
//

import UIKit

final class HomeTabBarController: UITabBarController {
    
    let gameView = GameViewController()
    let summaryView = SummaryViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.reactor = GameViewReactor()
        
        self.viewControllers = [
            tabBarConfig(rootViewController: gameView, tabBarImage: UIImage(systemName: "gamecontroller.fill")!),
            tabBarConfig(rootViewController: summaryView, tabBarImage: UIImage(systemName: "note.text")!)
        ]
        tabBar.barTintColor = .clear
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .green
    }

    private func tabBarConfig(rootViewController: UIViewController, tabBarImage: UIImage) -> UINavigationController {
        let rootViewController = rootViewController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = tabBarImage
        navigationController.navigationBar.barTintColor = .systemGray4
        return navigationController
    }
}
