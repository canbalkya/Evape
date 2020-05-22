//
//  AppDelegate.swift
//  Evape
//
//  Created by Can Balkaya on 4/9/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]

        appereance.largeTitleTextAttributes = attrs
        UINavigationBar.appearance().scrollEdgeAppearance = appereance
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
