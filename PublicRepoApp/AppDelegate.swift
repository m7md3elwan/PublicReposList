//
//  AppDelegate.swift
//  PublicRepoApp
//
//  Created by Elwan on 11/19/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showStartupScreen()
        return true
    }
    
    func showStartupScreen() {
        let categoriesList = CategoriesModuleFactory.makeModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = categoriesList
        window?.makeKeyAndVisible()
    }
    
}

