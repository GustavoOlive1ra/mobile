import Quick
import Nimble
import XCTest
@testable import Forca

class JogoDaForcaTests: QuickSpec {

    override func spec() {
        var jogo: JogoDaForca!

        beforeEach {
            jogo = JogoDaForca(palavra: "jacaré", dica: "animal")
        }

        describe("jogando") {
            context("com uma nova letra correta") {
                it("deve ter zero erros") {
                    jogo.tentativa(letra: "a")
                    expect(jogo.erros).to(equal(.zero))
                }
            }

            context("com uma nova letra errônea") {
                it("deve ter um erro") {
                    jogo.tentativa(letra: "x")
                    expect(jogo.erros).to(equal(1))
                    expect(jogo.resultadoExibido).to(equal("______"))
                }
            }

            context("com uma letra errônea repetida") {
                it("deve ter apenas um erro") {
                    jogo.tentativa(letra: "x")
                    jogo.tentativa(letra: "x")
                    expect(jogo.erros).to(equal(1))
                }
            }

            context("com seis letras erradas diferentes") {
                it("deve ser perdido o jogo") {
                    // arranja
                    ["b", "d", "f", "h", "x"].forEach(jogo.tentativa)

                    expect(jogo.derrota).to(equal(false))
                    expect(jogo.vitoria).to(equal(false))

                    // age
                    jogo.tentativa(letra: "y")

                    // acerta
                    expect(jogo.derrota).to(equal(true))
                    expect(jogo.vitoria).to(equal(false))
                }
            }

            context("com uma letra correta repetida na palavra") {
                it("deve atualizar duas lacunas") {
                    jogo.tentativa(letra: "a")

                    expect(jogo.resultadoExibido).to(equal("_A_A__"))
                }
            }

            context("com todas letras corretas") {
                it("deve ganhar-se o jogo") {
                    ["j", "a", "c", "r"].forEach(jogo.tentativa)

                    expect(jogo.derrota).to(equal(false))
                    expect(jogo.vitoria).to(equal(false))

                    jogo.tentativa(letra: "e")

                    expect(jogo.derrota).to(equal(false))
                    expect(jogo.vitoria).to(equal(true))
                }
            }
        }

        describe("jogando com uma cabra") {
            context("com todas letras corretas") {
                it("deve ganhar-se o jogo") {
                    jogo = JogoDaForca(palavra: "cabra", dica: "tem chifres")
                    ["c", "a", "b"].forEach(jogo.tentativa)

                    expect(jogo.derrota).to(equal(false))
                    expect(jogo.vitoria).to(equal(false))

                    jogo.tentativa(letra: "r")

                    expect(jogo.derrota).to(equal(false))
                    expect(jogo.vitoria).to(equal(true))
                }
            }

        }
    }

}
