//
//  JogoDaForcaTestsXC.swift
//  ForcaTests
//
//  Created by Marvin on 21/07/22.
//

import XCTest
@testable import Forca

class JogoDaForcaTestsXC: XCTestCase {
    
    // SYSTEM UNDER TEST
    var sut: JogoDaForca = .aleatorio()
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func test_tentativa_withTwoLettersRight_whenTryingAnotherLetter_shouldNotHaveAnyErrors() {
        // Given
        sut = JogoDaForca(palavra: "mula", dica: "animal")
        sut.tentativa(letra: "m")
        sut.tentativa(letra: "u")
        
        // When
        sut.tentativa(letra: "l")
        
        // Then
        XCTAssertEqual(sut.erros, 0)
        XCTAssertFalse(sut.vitoria)
        XCTAssertFalse(sut.derrota)
    }
    
    func test_tentativa_withTwoLettersRight_whenTryingAWrongLetter_shouldHaveOneError() {
        // Given
        sut = JogoDaForca(palavra: "mula", dica: "animal")
        sut.tentativa(letra: "m")
        sut.tentativa(letra: "u")
        
        // When
        sut.tentativa(letra: "x")
        
        // Then
        XCTAssertEqual(sut.erros, 1)
        XCTAssertFalse(sut.vitoria)
        XCTAssertFalse(sut.derrota)
    }
    
}
