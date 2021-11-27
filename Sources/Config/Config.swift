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
    private var properties:JSON?
    
    public init(with fileName:String) {
        Bundle.allBundles.forEach { [weak self] bundle in
            guard let path = bundle.path(forResource: fileName, ofType: "json") else {
                print("\(Messages.notFound) \(fileName)")
                return
            }
            self?.url = URL(fileURLWithPath: path)
            self?.readConfig()
        }
    }
    
    public init(with url:URL) {
        self.url = url
        self.readConfig()
    }
    
    public subscript(dynamicMember member: String) -> JSON {
        if let properties = self.properties {
            let val = properties[member]
            return val
        }
        return JSON.error(Messages.checkJSONFile)
    }
    
    public subscript<T>(key: String) -> T? {
        let splitChar = "."
        var subscripts:[String] = []
        if key.contains(splitChar) {
            subscripts = key.components(separatedBy: splitChar)
        }else{
            subscripts.append(key)
        }
        var data:JSON = self[dynamicMember: subscripts[0]]
        for i in 1..<subscripts.count {
            data = data[dynamicMember: subscripts[i]]
        }
        return data.value()
    }
    
    private func readConfig() {
        guard let url = self.url else { print(Messages.checkJSONFile); return }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            guard let response = try? JSONDecoder().decode(JSON.self, from: data)
            else { print("\(Messages.notValidJSON)"); return }
            properties = response
        } catch {
            print("\(Messages.notValidJSON)")
        }
    }
    
    public func reset() {
        properties = nil
        url = nil
    }
}
