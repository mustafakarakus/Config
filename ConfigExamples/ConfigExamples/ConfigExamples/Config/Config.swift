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
    
    private var url:URL?
    var properties:JSON!
    
    init(with fileName:String) {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: fileName, ofType: "json")
        guard let filePath = path else {
            _ = JSON.error("\(Messages.notFound) \(fileName)")
            return
        }
        self.url = URL(fileURLWithPath: filePath)
        readConfig()
    }
    
    init(with url:URL){
        self.url = url
        readConfig()
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
        return data.value()
    }
    
    private func readConfig() {
        guard let url = self.url else{
            _ = JSON.error(Messages.checkJSONFile)
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            if let response = try? JSONDecoder().decode(JSON.self, from: data) {
                properties = response
            }else{
                _ = JSON.error("\(Messages.notValidJSON)")
            }
        } catch {
            _ = JSON.error("\(Messages.notValidJSON)")
        }
    }
    
    public func reset() {
        properties = nil
    }
}
