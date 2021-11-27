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
    private var config: Config? = nil
    private let key: String
    private var value: Value
    
    public var wrappedValue: Value {
        get { config?[key] ?? value }
        set { value = newValue }
    }
}

extension JSONValue {
    public init(wrappedValue: Value, _ configFileName: String, _ key: String) {
        self.value = wrappedValue
        self.key = key
        self.config = Config(with: configFileName)
    }
    
    public init(wrappedValue: Value, url: String, _ key: String) {
        self.value = wrappedValue
        self.key = key
        guard let url = URL(string: url) else { return }
        self.config = Config(with: url)
    }
}
