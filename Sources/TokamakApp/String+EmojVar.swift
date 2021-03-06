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
                Character("0"): "โญ๏ธ",
                Character("1"): "๐ด",
                Character("2"): "๐ ",
                Character("3"): "๐ก",
                Character("4"): "๐ข",
                Character("5"): "๐ต",
                Character("6"): "๐ฃ",
                Character("7"): "๐ค",
                Character("8"): "โซ๏ธ",
                Character("9"): "โช๏ธ"
            ]
        case .minor:
            return [
                Character("0"): "๐ฅผ",
                Character("1"): "๐ฆบ",
                Character("2"): "๐",
                Character("3"): "๐",
                Character("4"): "๐",
                Character("5"): "๐งฃ",
                Character("6"): "๐งค",
                Character("7"): "๐งฅ",
                Character("8"): "๐งฆ",
                Character("9"): "๐"
            ]
        case .patch:
            return [
                Character("0"): "๐",
                Character("1"): "๐ฆ",
                Character("2"): "๐",
                Character("3"): "๐",
                Character("4"): "๐",
                Character("5"): "๐",
                Character("6"): "๐ฆ",
                Character("7"): "๐ท",
                Character("8"): "๐ฆ",
                Character("9"): "๐ฆ"
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
