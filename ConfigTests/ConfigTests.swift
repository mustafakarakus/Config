//
//  ConfigTests.swift
//  ConfigTests
//
//  Created by Mustafa Karakus on 03/10/2019.
//  Copyright © 2019 Mustafa Karakus. All rights reserved.
//

import XCTest
@testable import Config

class ConfigTests: XCTestCase {
    
    override func setUp() {
        Config.initialize(configPath: "mainConfig.json")
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    } 
  
    func testConfigIsInitialized() {
        XCTAssertNotNil(Config.shared.properties)
    }
    
    func testDevelopmentKeyIsObject() {
        let data:[String:Bool]? = Config.shared.development.parse()
        XCTAssertEqual(data,["debug":true])
    }
    
    func testDebugKeyIsObject() {
        let data:Bool? = Config.shared.development.debug.parse()
        XCTAssertEqual(data,true)
    }
    
    func testApplicationTypeIsInteger() {
        let data:Int? = Config.shared.application.type.parse()
        XCTAssertEqual(data,5)
    }
    
    func testApplicationVersionIsDouble() {
        let data:Double? = Config.shared.application.version.parse()
        XCTAssertEqual(data,1.2)
    }
    
    func testApplicationKeyIsString() {
        let data:String? = Config.shared.application.appKey.parse()
        XCTAssertEqual(data,"ABCD-EFGH-IJKLMNOPR")
    }
    
    func testApplicationSecurityGroupsAreArray() {
        let data:[Int]? = Config.shared.application.security.OAuth2.groups.parse()
        XCTAssertEqual(data,[1,9,0,5])
    }
    
    func testMainKeyIsNotExists() {
        let data:String? = Config.shared.app.debug.parse()
        XCTAssertNil(data)
    }
    
    func testSubKeyIsNotExists() {
        let data:String? = Config.shared.development.version.parse()
        XCTAssertNil(data)
    }
    
    func testParseWrongDataType() {
        let wrongDataType:Int? = Config.shared.development.debug.parse()
        let correctDataType:Bool? = Config.shared.development.debug.parse()
        XCTAssertNil(wrongDataType)
        XCTAssertNotNil(correctDataType)
    }
     
}
