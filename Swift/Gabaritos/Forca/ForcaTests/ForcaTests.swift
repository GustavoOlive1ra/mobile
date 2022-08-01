//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Marvin on 07/06/22.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_troca() throws {
        let palavra = "mula"
        var mascara = "____"

        mascara = troca("a", na: mascara, original: palavra)
        XCTAssertEqual("___a", mascara)
        
        mascara = troca("l", na: mascara, original: palavra)
        XCTAssertEqual("__la", mascara)
        
        mascara = troca("X", na: mascara, original: palavra)
        XCTAssertEqual("__la", mascara)
        
        mascara = troca("m", na: mascara, original: palavra)
        XCTAssertEqual("m_la", mascara)
        
        mascara = troca("u", na: mascara, original: palavra)
        XCTAssertEqual("mula", mascara)
    }

}
