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
        
        let config = Config(with: "my-config")

        if let development:[String:Any] = config.development.value() {
            print(development)
        }
        
        if let debug:Bool = config.development.debug.value(){
            print(debug)
        }
          
        if let application:[String:Any] = config.application.value(){
            print(application)
        }
        
        if let version:Double = config.application.version.value(){
            print(version)
        }
        
        if let applicationType:Int = config.application.type.value(){
            print(applicationType)
        }
        
        if let appKey:String = config.application.appKey.value(){
            print(appKey)
        }
        
        if let username:String = config.application.security.OAuth2.credentials.username.value(){
            print(username)
        }
        
        if let groups:[Int] = config.application.security.OAuth2.groups.value(){
            print(groups)
        }
        
        if let domainExceptions:[String] = config.application.security.domainExceptions.value(){
            print(domainExceptions)
        }
    }
}
