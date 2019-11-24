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
    
    @JSONValue("application.security.OAuth2.groups")
    var groups: [Int] = []
    
    @JSONValue("development")
    var development: [String:Any]  = [:]
    
    @JSONValue("development.debug")
    var isDebug: Bool = false
    
    @JSONValue("application.security.OAuth2.credentials.username")
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("groups: \(groups)")
        print("development: \(development)")
        print("debug mode: \(isDebug)")
        print("OAuth2 username: \(username)") 
    }
    
}
