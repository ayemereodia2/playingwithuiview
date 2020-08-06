//
//  AppDelegate.swift
//  PlayingWithViews
//
//  Created by Ayemere  Odia  on 18/07/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter = WeatherPresenterImpl()
        window?.rootViewController = WeatherViewController(with: presenter)
        window?.makeKeyAndVisible()
        return true
    }

}

