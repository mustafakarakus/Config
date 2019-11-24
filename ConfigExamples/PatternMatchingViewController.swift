//
//  PatternMatchingViewController.swift
//  ConfigExamples
//
//  Created by Mustafa Karakus on 24/11/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import UIKit
import Config

class PatternMatchingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = Config.shared.application.appKey
        if case let .string(val) = string {
            print("app Key \(val)")
        }
        
        let intArray = Config.shared.application.security.OAuth2.groups
        if case let .array(val) = intArray {
            print("groups: \(val)")
        }
        
        let dictionary = Config.shared.application
        if case let .object(val) = dictionary {
            print("application: \(val)")
        }
        
        let double = Config.shared.application.version
        if case let .double(val) = double {
            print("version: \(val)")
        }
    }
    
}
