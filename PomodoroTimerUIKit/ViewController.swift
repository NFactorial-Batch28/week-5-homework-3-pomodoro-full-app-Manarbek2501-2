//
//  ViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let tabBarCnt = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
    }
            
    func createTabBarController() {
        
        let mainVC = MainViewController()
        mainVC.tabBarItem = UITabBarItem.init(title: "Main", image: UIImage(systemName: "house"), tag: 0)
        
        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem.init(title: "Setting", image: UIImage(systemName: "slider.horizontal.3"), tag: 1)
        
        let historyVC = HistoryViewController()
        historyVC.tabBarItem = UITabBarItem.init(title: "History", image: UIImage(systemName: "doc"), tag: 2)
        
        UITabBar.appearance().barTintColor = .gray
        tabBarCnt.tabBar.tintColor = .white
        
        let controllerArray = [mainVC, settingVC, historyVC]
        
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        self.view.addSubview(tabBarCnt.view)
    }
}
