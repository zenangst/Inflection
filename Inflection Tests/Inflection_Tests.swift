//
//  Inflection_Tests.swift
//  Inflection Tests
//
//  Created by Christoffer Winterkvist on 3/2/15.
//
//

import UIKit
import XCTest

class Inflection_Tests: XCTestCase {
    
    func testRubyToSwift() {
        var subjectString = "createdAt".rubyCase()
        var expectedString = "created_at"
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'created_at'")
    }
    
    func testSwiftToRuby() {
        var subjectString = "updated_at".swiftCase()
        var expectedString = "updatedAt"
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'createdAt'")
    }
    
    func testDictionaryInflection() {
        let remoteDictionary: NSDictionary = ["created_at":"", "updated_at":""]
        let localDictionary: NSDictionary = ["createdAt":"", "updatedAt":""]
        
        XCTAssertEqual(remoteDictionary.swiftCase(), localDictionary)
    }
    
}
