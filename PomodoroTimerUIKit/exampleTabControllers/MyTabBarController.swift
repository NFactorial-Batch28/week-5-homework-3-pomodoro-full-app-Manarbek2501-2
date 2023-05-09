//
//  mayTabBarController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .lightGray
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        tabBar.tintColor = .white
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: MainViewController(), tabTitle: "Main", tabImage: UIImage(systemName: "house")!),
            wrapInNavigationController(with: SettingViewController(), tabTitle: "Setting", tabImage: UIImage(systemName: "slider.horizontal.3")!),
            wrapInNavigationController(with: HistoryViewController(), tabTitle: "History", tabImage: UIImage(systemName: "doc")!),
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
