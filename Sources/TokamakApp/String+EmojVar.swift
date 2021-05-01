//import SwiftFu

enum EmojVarType {
    case major
    case minor
    case patch
}

extension EmojVarType {
    var emojis: [Character: String] {
        switch self {
        case .major:
            return [
                Character("0"): "⭕️",
                Character("1"): "🔴",
                Character("2"): "🟠",
                Character("3"): "🟡",
                Character("4"): "🟢",
                Character("5"): "🔵",
                Character("6"): "🟣",
                Character("7"): "🟤",
                Character("8"): "⚫️",
                Character("9"): "⚪️"
            ]
        case .minor:
            return [
                Character("0"): "🥼",
                Character("1"): "🦺",
                Character("2"): "👔",
                Character("3"): "👕",
                Character("4"): "👖",
                Character("5"): "🧣",
                Character("6"): "🧤",
                Character("7"): "🧥",
                Character("8"): "🧦",
                Character("9"): "👗"
            ]
        case .patch:
            return [
                Character("0"): "🐌",
                Character("1"): "🦋",
                Character("2"): "🐛",
                Character("3"): "🐜",
                Character("4"): "🐝",
                Character("5"): "🐞",
                Character("6"): "🦗",
                Character("7"): "🕷",
                Character("8"): "🦂",
                Character("9"): "🦟"
            ]
        }
    }
}

extension String {
    func emojvar(type: EmojVarType) -> String? {
        compactMap {
            type.emojis[$0]
        }
        .joined()
    }
}
