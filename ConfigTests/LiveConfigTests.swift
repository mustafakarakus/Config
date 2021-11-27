//
//  LiveConfigTests.swift
//  ConfigTests
//
//  Created by Mustafa Karakus on 09/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import XCTest
@testable import Config

class LiveConfigTests: XCTestCase {
    
    private var config = Config(with: URL(string: Keys.SampleEndpointUrl)!)
    
    func testApplicationTypeIsInteger() {
        let data:Int? = config.application.type.value()
        XCTAssertNotNil(data)
        XCTAssertEqual(data, 5)
    }
    
    func testApplicationVersionIsDouble() {
        let data:Double? = config.application.version.value()
        XCTAssertNotNil(data)
        XCTAssertEqual(data, 1.2)
    }
    
    func testApplicationKeyIsString() {
        let data:String? = config.application.appKey.value()
        XCTAssertNotNil(data)
        XCTAssertEqual(data, "ABCD-EFGH-IJKLMNOPR")
    }
    
    func testApplicationSecurityGroupsAreArray() {
        let data:[Int]? = config.application.security.OAuth2.groups.value()
        XCTAssertNotNil(data)
        XCTAssertEqual(data, [1,9,0,5])
    }
    
    func testMainKeyIsNotExists() {
        let data:String? = config.app.debug.value()
        XCTAssertNil(data)
    }
    
    func testSubKeyIsNotExists() {
        let data:String? = config.development.version.value()
        XCTAssertNil(data)
    }
    
    func testParseWrongDataType() {
        let wrongDataType:Int? = config.development.debug.value()
        let correctDataType:Bool? = config.development.debug.value()
        XCTAssertNil(wrongDataType)
        XCTAssertNotNil(correctDataType)
    }
}
