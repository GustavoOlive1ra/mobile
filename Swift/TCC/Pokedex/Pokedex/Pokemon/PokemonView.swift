import UIKit

internal class PokemonView: UIView {

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Codable View
extension PokemonView: CodableView {

    internal func configViews() {

    }

    internal func buildViews() {

    }

    internal func configConstraints() {

    }

}