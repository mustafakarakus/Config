//
//  JSONValue.swift
//  Config
//
//  Created by Mustafa Karakus on 23/11/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import Foundation

@propertyWrapper
public struct JSONValue<Value> {
    private let key: String
    private var value: Value
    
    public var wrappedValue: Value {
        get { Config.shared?[key] ?? value }
        set { value = newValue }
    }
}

extension JSONValue {
    public init(wrappedValue: Value, _ configFileName: String, _ key: String) {
        self.value = wrappedValue
        self.key = key
        Config.initialize(name: configFileName)
    }
    
    public init(wrappedValue: Value, url: String, _ key: String) {
        self.value = wrappedValue
        self.key = key
        guard let url = URL(string: url) else { return }
        Config.initialize(url: url)
    }
}

extension Config {
    internal static var shared: Config? = nil
    internal static func initialize(name: String) {
        if shared == nil {
            shared = Config(with: name)
        }
    }
    internal static func initialize(url: URL) {
        if shared == nil {
            shared = Config(with: url)
        }
    }
}
