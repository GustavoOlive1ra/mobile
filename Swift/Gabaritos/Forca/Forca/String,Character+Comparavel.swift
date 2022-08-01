import Foundation

extension Character {
    var comparavel: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}

extension String {
    var comparavel: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
