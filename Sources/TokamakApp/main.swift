import TokamakDOM

enum EmojVarType {
    case major
    case minor
    case patch
}

extension String {
    func emojvar(type: EmojVarType) -> String? {
        switch type {
        case .major:
            return compactMap {
                switch $0 {
                case "0": return "⭕️"
                case "1": return "🔴"
                case "2": return "🟠"
                case "3": return "🟡"
                case "4": return "🟢"
                case "5": return "🔵"
                case "6": return "🟣"
                case "7": return "🟤"
                case "8": return "⚫️"
                case "9": return "⚪️"
                default: return nil
                }
            }
            .joined()
        case .minor:
            return compactMap {
                switch $0 {
                case "0": return "🥼"
                case "1": return "🦺"
                case "2": return "👔"
                case "3": return "👕"
                case "4": return "👖"
                case "5": return "🧣"
                case "6": return "🧤"
                case "7": return "🧥"
                case "8": return "🧦"
                case "9": return "👗"
                default: return nil
                }
            }
            .joined()
        case .patch:
            return compactMap {
                switch $0 {
                case "0": return "🐌"
                case "1": return "🦋"
                case "2": return "🐛"
                case "3": return "🐜"
                case "4": return "🐝"
                case "5": return "🐞"
                case "6": return "🦗"
                case "7": return "🕷"
                case "8": return "🦂"
                case "9": return "🦟"
                default: return nil
                }
            }
            .joined()
        }
    }
}

struct TokamakApp: App {
    var body: some Scene {
        WindowGroup("Tokamak App") {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var emojVar: String = ""
    @State var versionNumber: String = "1.0.0"
    
    var body: some View {
        VStack(spacing: 8) {
            Text(emojVar).font(.largeTitle)
            TextField(
                "Semantic Version",
                text: $versionNumber,
                onEditingChanged: { _ in
                    update()
                },
                onCommit: update
            )
            .padding()
        }
        .onAppear {
            update()
        }
    }
    
    private func update() {
        let parts = versionNumber.split(separator: ".")
        var emojiMajor: String?
        var emojiMinor: String?
        var emojiPatch: String?
        
        if parts.count >= 1 {
            emojiMajor = parts[0].description.emojvar(type: .major)
        }
        
        if parts.count >= 2 {
            emojiMinor = parts[1].description.emojvar(type: .minor)
        }
        
        if parts.count >= 3 {
            emojiPatch = parts[2].description.emojvar(type: .patch)
        }
        
        emojVar = [emojiMajor, emojiMinor, emojiPatch]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: ".")
    }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
TokamakApp.main()
