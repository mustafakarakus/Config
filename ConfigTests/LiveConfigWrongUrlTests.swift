//
//  LiveConfigTests.swift
//  ConfigTests
//
//  Created by Mustafa Karakus on 09/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import XCTest
@testable import Config

class LiveConfigWrongUrlTests: XCTestCase {
    
    override class func setUp() {
        if let url = URL(string: Keys.GoogleUrl){
            Config.initialize(with: url)
            Config.shared.reset() //to change singleton object's json, otherwise first XCTestCase will set the singleton object and source.
        }
        super.setUp()
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    func testConfigIsInitialized() {
        XCTAssertNil(Config.shared.properties)
    } 
     
}
