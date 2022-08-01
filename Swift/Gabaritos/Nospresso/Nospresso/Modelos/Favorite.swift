import Foundation

struct Favorite: Produto, Equatable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String
    let tipo: TipoProduto
    
    static func == (lhs: Favorite, rhs: Favorite) -> Bool {
        lhs.id == rhs.id && lhs.tipo == rhs.tipo
    }

    // mostrar diferença entre escrever o init aqui e lá embaixo
    internal init(product: Produto) {
        self.id = product.id
        self.nome = product.nome
        self.preco = product.preco
        self.imagem = product.imagem
        self.descricao = product.descricao
        self.tipo = product.tipo
    }
}
