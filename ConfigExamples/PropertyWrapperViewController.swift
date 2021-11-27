//
//  PropertyWrapperViewController.swift
//  ConfigExamples
//
//  Created by Mustafa Karakus on 24/11/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import UIKit
import Config
 
class PropertyWrapperViewController: UIViewController {
     
    @JSONValue("my-config", "application.security.OAuth2.groups")
    var groups: [Int] = []
    
    @JSONValue("my-config1", "development")
    var development: [String:Any]  = [:]
    
    @JSONValue("my-config", "development.debug")
    var isDebug: Bool = false
    
    @JSONValue("my-config", "application.security.OAuth2.credentials.username")
    var username: String = ""
    
    @JSONValue(url: "https://raw.githubusercontent.com/mustafakarakus/Config/master/ConfigExamples/config.json", "application.appKey")
    var appKey: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("groups: \(groups)")
        print("development: \(development)")
        print("debug mode: \(isDebug)")
        print("OAuth2 username: \(username)")
        print("App Key: \(appKey)") 
    }
}
