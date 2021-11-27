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
    
    private var config: Config? {
        let sampleUrl = "https://raw.githubusercontent.com/mustafakarakus/Config/master/ConfigExamples/config.json"
        guard let url = URL(string: sampleUrl) else { return nil }
        return Config(with: url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let string = config?.application.appKey
        if case let .string(val) = string {
            print("app Key \(val)")
        }
        
        let double = config?.application.version
        if case let .double(val) = double {
            print("version: \(val)")
        }
        
        let intArray = config?.application.security.OAuth2.groups
        if case let .array(val) = intArray {
            for item in val {
                print("groups: \(String(describing: item.intValue))")
            }
        }

        let dictionary = config?.application
        if case let .object(val) = dictionary {
            print("application: \(val)")
        }
    }
}
