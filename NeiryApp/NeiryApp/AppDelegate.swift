//
//  AppDelegate.swift
//  NeiryApp
//
//  Created by Александр on 17.10.2024.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func showMainTabbar() {
        let viewController = MainViewController.instance()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.overrideUserInterfaceStyle = .light
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showMainTabbar()

        return true
    }
}

