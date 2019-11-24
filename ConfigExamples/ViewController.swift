//
//  ViewController.swift
//  ConfigExamples
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import UIKit
import Config

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let development:[String:Any] = Config.shared.development.parse(){
            print(development)
        }
        
        if let debug:Bool = Config.shared.development.debug.parse(){
            print(debug)
        }
          
        if let application:[String:Any] = Config.shared.application.parse(){
            print(application)
        }
        
        if let version:Double = Config.shared.application.version.parse(){
            print(version)
        }
        
        if let applicationType:Int = Config.shared.application.type.parse(){
            print(applicationType)
        }
        
        if let appKey:String = Config.shared.application.appKey.parse(){
            print(appKey)
        }
        
        if let username:String = Config.shared.application.security.OAuth2.credentials.username.parse(){
            print(username)
        }
        
        if let groups:[Int] = Config.shared.application.security.OAuth2.groups.parse(){
            print(groups)
        }
        
        if let domainExceptions:[String] = Config.shared.application.security.domainExceptions.parse(){
            print(domainExceptions)
        } 
        
    }
}

