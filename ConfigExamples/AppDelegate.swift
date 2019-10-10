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
        
        // Local
        Config.initialize(with: "config.json")
        
        // or
        
        // https://raw.githubusercontent.com/mustafakarakus/Config/master/ConfigExamples/config.json
        /*
        if let url = URL(string: "your-JSON-Endpoint-URL"){
            Config.initialize(with: url)
        }
        */
        return true
    }
    
}

