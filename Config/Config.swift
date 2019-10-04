//
//  Config.swift
//  Config
//
//  Created by Mustafa Karakus on 02/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import Foundation

@dynamicMemberLookup
public class Config {
    static var configFile:String = ""
    private var configFile:String = ""
    var properties:JSON!
    public static let shared = Config(Config.configFile)

    private init(_ configPath:String) {
        self.configFile = configPath
        readConfig()
     }
    
    public static func initialize(configPath:String){
        self.configFile = configPath
    }
     
    private func pathForResource(name: String, ofType type: String?) -> String? {
        for bundle in Bundle.allBundles {
            if let path = bundle.path(forResource: name, ofType: type) {
                return path
            }
        }
        return nil
    }
    
    private func readConfig(){
        let filePath = pathForResource(name: self.configFile, ofType: nil)
        guard let file = filePath else {
            _ = JSON.errorWith("\(Messages.notFound) \(self.config)") 
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: file), options: .mappedIfSafe)
            if let response = try? JSONDecoder().decode(JSON.self, from: data) {
                properties = response
            }else{
                _ = JSON.errorWith("\(Messages.notValidJSON) \(file)")
            }
        } catch {
            _ = JSON.errorWith("\(Messages.notValidJSON) \(file)")
        }
    }
    
    public subscript(dynamicMember member: String) -> JSON {
        if let properties = self.properties{
            let val = properties[member]
            return val
        }
        return JSON.error(Messages.checkJSONFile)
    }
} 
