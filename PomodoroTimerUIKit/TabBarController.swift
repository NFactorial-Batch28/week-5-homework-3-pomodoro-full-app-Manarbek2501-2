//
//  VCTabbar.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 09.05.2023.
//

import UIKit

class MyTestTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
    }
    
    func configureTabBar() {
        let firstViewController = MainViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 0)
        
        let secondViewController = SettingViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), tag: 1)
        
        let thirdViewController = HistoryViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "doc"), tag: 2)
        
        let viewControllers = [firstViewController, secondViewController, thirdViewController]
        self.viewControllers = viewControllers
        
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black
    }
}
