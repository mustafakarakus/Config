//
//  Messages.swift
//  Config
//
//  Created by Mustafa Karakus on 05/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

struct Messages {
    static let logTag = "Config.framework.log ===>"
    static let checkJSONFile = "\(logTag) Please check your config source, not exists or not valid JSON. Maybe you forgot to initialize?";
    static let notValidJSON = "\(logTag) Not valid JSON.";
    static let notFound = "\(logTag) File not found."; 
    static let keyDoesNotExists = "\(logTag) Key does not exists";
    static let cannotReach = "\(logTag) Can not reach";
}
