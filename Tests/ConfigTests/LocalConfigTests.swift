//
//  ConfigTests.swift
//  ConfigTests
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import XCTest
@testable import Config

class LocalConfigTests: XCTestCase {
    
    private var config = Config(with: "mainConfig")
    
    func testDevelopmentKeyIsObject() {
        let data:[String:Bool]? = config.development.value()
        XCTAssertEqual(data, ["debug":true])
    }
    
    func testDebugKeyIsBoolean() {
        let data:Bool? = config.development.debug.value()
        XCTAssertEqual(data, true)
    }
    
    func testApplicationTypeIsInteger() {
        let data:Int? = config.application.type.value()
        XCTAssertEqual(data, 5)
    }
    
    func testApplicationVersionIsDouble() {
        let data:Double? = config.application.version.value()
        XCTAssertEqual(data, 1.2)
    }
    
    func testApplicationKeyIsString() {
        let data:String? = config.application.appKey.value()
        XCTAssertEqual(data, "ABCD-EFGH-IJKLMNOPR")
    }
    
    func testApplicationSecurityGroupsAreArray() {
        let data:[Int]? = config.application.security.OAuth2.groups.value()
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
    
    func testTryParseWrongDataTypeShouldBeNil() {
        let wrongDataType:Int? = config.development.debug.value()
        let correctDataType:Bool? = config.development.debug.value()
        XCTAssertNil(wrongDataType)
        XCTAssertNotNil(correctDataType)
    }
    
    func testStringSubscriptsWithDotNotationShouldHaveValidValue() {
        let key = "application.security.OAuth2.groups"
        let data:[Int]? = config[key]
        XCTAssertEqual(data, [1,9,0,5])
    }
    
    func testStringSubscriptsWithDotNotationWithWrongDatatypeShouldBeNil() {
        let key = "application.security.OAuth2.groups"
        let wrongDataType:Int? = config[key]
        XCTAssertNil(wrongDataType)
    }
    
    func testStringSubscriptsWithWrongNotationShouldBeNil() {
        let key = "application-security-OAuth2-groups"
        let data:[Int]? = config[key]
        XCTAssertNil(data)
    }
    
    func testStringSubscriptsWithEmptyStringShouldBeNil() {
        let key = ""
        let data:[Int]? = config[key]
        XCTAssertNil(data)
    }
    
    func testStringSubscriptsWithSpaceShouldBeNil() {
        let key = " "
        let data:[Int]? = config[key]
        XCTAssertNil(data)
    }
    func testStringSubscriptsWithSingleDotWithoutKeysShouldBeNil() {
        let key = "."
        let data:[Int]? = config[key]
        XCTAssertNil(data)
    }
}
