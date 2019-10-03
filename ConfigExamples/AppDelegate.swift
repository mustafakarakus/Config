//
//  AppDelegate.swift
//  ConfigExamples
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import UIKit
import Config

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Config.initialize(configPath: "config.json")
        return true
    }
    
}

