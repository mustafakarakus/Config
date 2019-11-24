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
        get { Config.shared[key] ?? value }
        set { value = newValue }
    }
}

extension JSONValue {
    public init(wrappedValue:Value, _ key:String) {
        self.value = wrappedValue
        self.key = key
    }
}
