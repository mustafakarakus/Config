//
//  Extensions.swift
//  Config
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none: return other
        case .some: return self
        }
    }
    
    func resolve(with error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none: throw error()
        case .some(let wrapped): return wrapped
        }
    } 
}
