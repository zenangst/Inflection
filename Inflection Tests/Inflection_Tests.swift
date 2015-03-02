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
    
    func testRubyToObjectiveC() {
        var subjectString = "createdAt".snakeCase()
        var expectedString = "created_at"
        
        println("\nsubjectString: \(subjectString)\n")
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'created_at'")
    }
    
    func testObjectiveCToRuby() {
        var subjectString = "updated_at".objcCase()
        var expectedString = "updatedAt"
        
        println("\nsubjectString: \(subjectString)\n")
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'createdAt'")
    }
    
}
