//
//  JogoDaForcaTests.swift
//  ForcaTests
//
//  Created by Locação on 21/07/22.
//

import Foundation
import XCTest
@testable import Forca

class JogoDaForcaTests: XCTestCase{
    
    // System Under Test
    var sut: JogoDaForca?
    
    override func setUp() {
        sut = .init(palavra: "abelha", dica: "inseto")
    }
    
    func test_tentar_withTwoLetterRight_whenTryingAnotherRightLetter_sholdNotHaveAnyErrors() throws{
        let sut = try XCTUnwrap(sut)
        
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        sut.tentar(letra: "e")
        
        XCTAssertEqual(sut.erros, 0)
    }
    
    func test_tentar_withTwoLettersRight_whenTryingAWrongLetter() throws{
        let sut = try XCTUnwrap(sut)
        
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        sut.tentar(letra: "x")
        
        XCTAssertEqual(sut.erros, 1)
    }
    
    
}
