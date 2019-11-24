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
    
    public static let shared = Config()
    private static var url:URL! = nil
    var properties:JSON!
    
    private init() {
        readConfig()
    }
    
    public static func initialize(with fileName:String){
        let path = pathForResource(name: fileName, ofType: nil)
        guard let filePath = path else {
            _ = JSON.errorWith("\(Messages.notFound) \(fileName)")
            return
        }
        self.url = URL(fileURLWithPath: filePath)
    }
    
    public static func initialize(with url:URL){
        self.url = url
    } 
    
    public subscript(dynamicMember member: String) -> JSON {
        if let properties = self.properties{
            let val = properties[member]
            return val
        }
        return JSON.error(Messages.checkJSONFile)
    }
    
    public subscript<T>(key: String) -> T? {
        let splitChar = "."
        var subscripts:[String] = []
        if key.contains(splitChar){
            subscripts = key.components(separatedBy: splitChar)
        }else{
            subscripts.append(key)
        }
        var data:JSON = self[dynamicMember: subscripts[0]]
        for i in 1..<subscripts.count{
            data = data[dynamicMember: subscripts[i]]
        }
        return data.parse()
    }
    
    private func readConfig(){
        guard let url = Config.url else{
            _ = JSON.errorWith(Messages.checkJSONFile)
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            if let response = try? JSONDecoder().decode(JSON.self, from: data) {
                properties = response
            }else{
                _ = JSON.errorWith("\(Messages.notValidJSON)")
            }
        } catch {
            _ = JSON.errorWith("\(Messages.notValidJSON)")
        }
    }
    
    private static func pathForResource(name: String, ofType type: String?) -> String? {
        for bundle in Bundle.allBundles {
            if let path = bundle.path(forResource: name, ofType: type) {
                return path
            }
        }
        return nil
    }
    
    public func reset(){
        properties = nil
        readConfig()
    }
} 
