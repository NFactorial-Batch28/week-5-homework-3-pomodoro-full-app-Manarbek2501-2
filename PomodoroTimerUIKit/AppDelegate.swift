//
//  AppDelegate.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = MyTabBarController()
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(controller)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }

}

