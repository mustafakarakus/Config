//
//  ConfigTests.swift
//  ConfigTests
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import XCTest
@testable import Config

class LocalConfigInvalidTests: XCTestCase {
    
    private var config = Config(with: "invalidConfig")
    
    func testConfigIsInitialized() {
        let isDebug:Bool? = config.development.debug.value()
        XCTAssertNil(isDebug)
    }
}
