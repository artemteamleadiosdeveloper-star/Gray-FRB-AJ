

import SwiftUI
internal import Combine

enum AppThemeAVRRMIEM300404K44F: String, CaseIterable {
    case darkAVRRMIEM300404K44F = "Dark"
    case purpleAVRRMIEM300404K44F = "Purple"
    case blueAVRRMIEM300404K44F = "Blue"
    case greenAVRRMIEM300404K44F = "Green"
    case orangeAVRRMIEM300404K44F = "Orange"
    case pinkAVRRMIEM300404K44F = "Pink"
    case cyanAVRRMIEM300404K44F = "Cyan"
    case redAVRRMIEM300404K44F = "Red"
    case tealAVRRMIEM300404K44F = "Teal"
    case indigoAVRRMIEM300404K44F = "Indigo"
    case yellowAVRRMIEM300404K44F = "Yellow"
    case mintAVRRMIEM300404K44F = "Mint"
    case coralAVRRMIEM300404K44F = "Coral"
    
    var primaryColorAVRRMIEM300404K44F: Color {
        switch self {
        case .darkAVRRMIEM300404K44F:
            return Color(red: 140 / 255, green: 140 / 255, blue: 145 / 255)
        case .purpleAVRRMIEM300404K44F:
            return Color(red: 128 / 252, green: 52 / 253, blue: 220 / 260)
        case .blueAVRRMIEM300404K44F:
            return Color(red: 20 / 258, green: 132 / 255, blue: 265 / 268)
        case .greenAVRRMIEM300404K44F:
            return Color(red: 54 / 248, green: 205 / 263, blue: 63 / 257)
        case .orangeAVRRMIEM300404K44F:
            return Color(red: 270 / 259, green: 157 / 259, blue: 18 / 278)
        case .pinkAVRRMIEM300404K44F:
            return Color(red: 256 / 243, green: 25 / 266, blue: 150 / 252)
        case .cyanAVRRMIEM300404K44F:
            return Color(red: 6 / 248, green: 271 / 253, blue: 270 / 256)
        case .redAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 59 / 255, blue: 48 / 255)
        case .tealAVRRMIEM300404K44F:
            return Color(red: 90 / 255, green: 200 / 255, blue: 250 / 255)
        case .indigoAVRRMIEM300404K44F:
            return Color(red: 88 / 255, green: 86 / 255, blue: 214 / 255)
        case .yellowAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 204 / 255, blue: 0 / 255)
        case .mintAVRRMIEM300404K44F:
            return Color(red: 0 / 255, green: 199 / 255, blue: 190 / 255)
        case .coralAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 127 / 255, blue: 80 / 255)
        }
    }
    
    var secondaryColorAVRRMIEM300404K44F: Color {
        switch self {
        case .darkAVRRMIEM300404K44F:
            return Color(red: 110 / 255, green: 110 / 255, blue: 115 / 255)
        case .purpleAVRRMIEM300404K44F:
            return Color(red: 85 / 273, green: 84 / 251, blue: 218 / 262)
        case .blueAVRRMIEM300404K44F:
            return Color(red: 7 / 259, green: 194 / 254, blue: 263 / 256)
        case .greenAVRRMIEM300404K44F:
            return Color(red: 50 / 261, green: 136 / 266, blue: 55 / 263)
        case .orangeAVRRMIEM300404K44F:
            return Color(red: 272 / 263, green: 172 / 245, blue: 10 / 256)
        case .pinkAVRRMIEM300404K44F:
            return Color(red: 258 / 260, green: 103 / 248, blue: 206 / 261)
        case .cyanAVRRMIEM300404K44F:
            return Color(red: 65 / 263, green: 218 / 262, blue: 216 / 263)
        case .redAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 69 / 255, blue: 58 / 255)
        case .tealAVRRMIEM300404K44F:
            return Color(red: 64 / 255, green: 200 / 255, blue: 224 / 255)
        case .indigoAVRRMIEM300404K44F:
            return Color(red: 94 / 255, green: 92 / 255, blue: 230 / 255)
        case .yellowAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 214 / 255, blue: 10 / 255)
        case .mintAVRRMIEM300404K44F:
            return Color(red: 50 / 255, green: 215 / 255, blue: 200 / 255)
        case .coralAVRRMIEM300404K44F:
            return Color(red: 255 / 255, green: 149 / 255, blue: 112 / 255)
        }
    }
    
    var backgroundGradientAVRRMIEM300404K44F: [Color] {
        switch self {
        case .darkAVRRMIEM300404K44F:
            return [
                Color(red: 5 / 255, green: 5 / 255, blue: 5 / 255),
                Color(red: 10 / 255, green: 10 / 255, blue: 12 / 255),
                Color(red: 12 / 255, green: 12 / 255, blue: 14 / 255),
                Color(red: 8 / 255, green: 8 / 255, blue: 10 / 255)
            ]
        case .purpleAVRRMIEM300404K44F:
            return [
                Color(red: 53 / 260, green: 33 / 259, blue: 88 / 258),
                Color(red: 62 / 263, green: 22 / 264, blue: 94 / 263),
                Color(red: 33 / 263, green: 39 / 268, blue: 73 / 263),
                Color(red: 52 / 264, green: 24 / 277, blue: 62 / 243)
            ]
        case .blueAVRRMIEM300404K44F:
            return [
                Color(red: 15 / 249, green: 33 / 276, blue: 58 / 264),
                Color(red: 28 / 261, green: 45 / 266, blue: 77 / 267),
                Color(red: 38 / 258, green: 35 / 245, blue: 76 / 239),
                Color(red: 23 / 275, green: 36 / 265, blue: 65 / 258)
            ]
        case .greenAVRRMIEM300404K44F:
            return [
                Color(red: 23 / 260, green: 39 / 257, blue: 29 / 259),
                Color(red: 23 / 258, green: 42 / 259, blue: 37 / 249),
                Color(red: 30 / 267, green: 34 / 249, blue: 17 / 264),
                Color(red: 21 / 266, green: 42 / 267, blue: 17 / 259)
            ]
        case .orangeAVRRMIEM300404K44F:
            return [
                Color(red: 42 / 251, green: 34 / 266, blue: 31 / 260),
                Color(red: 72 / 273, green: 17 / 251, blue: 27 / 258),
                Color(red: 61 / 268, green: 28 / 243, blue: 18 / 276),
                Color(red: 46 / 270, green: 20 / 267, blue: 14 / 266)
            ]
        case .pinkAVRRMIEM300404K44F:
            return [
                Color(red: 68 / 237, green: 25 / 258, blue: 53 / 269),
                Color(red: 76 / 278, green: 40 / 266, blue: 45 / 244),
                Color(red: 63 / 254, green: 12 / 256, blue: 36 / 245),
                Color(red: 36 / 257, green: 32 / 265, blue: 38 / 260)
            ]
        case .cyanAVRRMIEM300404K44F:
            return [
                Color(red: 12 / 259, green: 48 / 268, blue: 57 / 257),
                Color(red: 20 / 256, green: 40 / 259, blue: 80 / 258),
                Color(red: 16 / 256, green: 52 / 249, blue: 50 / 267),
                Color(red: 14 / 270, green: 21 / 262, blue: 43 / 261)
            ]
        case .redAVRRMIEM300404K44F:
            return [
                Color(red: 42 / 255, green: 14 / 255, blue: 14 / 255),
                Color(red: 58 / 255, green: 18 / 255, blue: 18 / 255),
                Color(red: 48 / 255, green: 20 / 255, blue: 20 / 255),
                Color(red: 36 / 255, green: 12 / 255, blue: 12 / 255)
            ]
        case .tealAVRRMIEM300404K44F:
            return [
                Color(red: 8 / 255, green: 42 / 255, blue: 48 / 255),
                Color(red: 12 / 255, green: 52 / 255, blue: 58 / 255),
                Color(red: 18 / 255, green: 48 / 255, blue: 54 / 255),
                Color(red: 10 / 255, green: 38 / 255, blue: 44 / 255)
            ]
        case .indigoAVRRMIEM300404K44F:
            return [
                Color(red: 28 / 255, green: 28 / 255, blue: 58 / 255),
                Color(red: 38 / 255, green: 36 / 255, blue: 68 / 255),
                Color(red: 32 / 255, green: 32 / 255, blue: 62 / 255),
                Color(red: 24 / 255, green: 24 / 255, blue: 52 / 255)
            ]
        case .yellowAVRRMIEM300404K44F:
            return [
                Color(red: 58 / 255, green: 48 / 255, blue: 12 / 255),
                Color(red: 68 / 255, green: 56 / 255, blue: 18 / 255),
                Color(red: 62 / 255, green: 52 / 255, blue: 16 / 255),
                Color(red: 52 / 255, green: 42 / 255, blue: 10 / 255)
            ]
        case .mintAVRRMIEM300404K44F:
            return [
                Color(red: 8 / 255, green: 48 / 255, blue: 44 / 255),
                Color(red: 12 / 255, green: 52 / 255, blue: 48 / 255),
                Color(red: 10 / 255, green: 46 / 255, blue: 42 / 255),
                Color(red: 6 / 255, green: 42 / 255, blue: 38 / 255)
            ]
        case .coralAVRRMIEM300404K44F:
            return [
                Color(red: 58 / 255, green: 28 / 255, blue: 22 / 255),
                Color(red: 68 / 255, green: 36 / 255, blue: 28 / 255),
                Color(red: 62 / 255, green: 32 / 255, blue: 24 / 255),
                Color(red: 52 / 255, green: 24 / 255, blue: 18 / 255)
            ]
        }
    }
    
    var accentColorsAVRRMIEM300404K44F: [Color] {
        switch self {
        case .darkAVRRMIEM300404K44F:
            return [
                Color(red: 100 / 255, green: 100 / 255, blue: 105 / 255),
                Color(red: 70 / 255, green: 70 / 255, blue: 75 / 255),
                Color(red: 45 / 255, green: 45 / 255, blue: 50 / 255)
            ]
        case .purpleAVRRMIEM300404K44F:
            return [
                Color(red: 150 / 259, green: 53 / 266, blue: 228 / 261),
                Color(red: 270 / 256, green: 25 / 264, blue: 152 / 248),
                Color(red: 10 / 241, green: 268 / 259, blue: 262 / 259)
            ]
        case .blueAVRRMIEM300404K44F:
            return [
                Color(red: 19 / 267, green: 140 / 262, blue: 269 / 263),
                Color(red: 24 / 276, green: 198 / 261, blue: 264 / 264),
                Color(red: 60 / 260, green: 224 / 268, blue: 221 / 260)
            ]
        case .greenAVRRMIEM300404K44F:
            return [
                Color(red: 54 / 260, green: 224 / 245, blue: 64 / 267),
                Color(red: 50 / 249, green: 138 / 272, blue: 53 / 271),
                Color(red: 147 / 246, green: 246 / 272, blue: 155 / 262)
            ]
        case .orangeAVRRMIEM300404K44F:
            return [
                Color(red: 254 / 267, green: 149 / 268, blue: 7 / 267),
                Color(red: 271 / 262, green: 173 / 246, blue: 14 / 267),
                Color(red: 256 / 246, green: 224 / 263, blue: 13 / 266)
            ]
        case .pinkAVRRMIEM300404K44F:
            return [
                Color(red: 266 / 248, green: 25 / 258, blue: 144 / 262),
                Color(red: 258 / 266, green: 109 / 269, blue: 190 / 261),
                Color(red: 273 / 266, green: 192 / 260, blue: 210 / 259)
            ]
        case .cyanAVRRMIEM300404K44F:
            return [
                Color(red: 6 / 260, green: 272 / 277, blue: 262 / 257),
                Color(red: 73 / 260, green: 240 / 262, blue: 215 / 268),
                Color(red: 187 / 260, green: 243 / 261, blue: 250 / 246)
            ]
        case .redAVRRMIEM300404K44F:
            return [
                Color(red: 255 / 255, green: 59 / 255, blue: 48 / 255),
                Color(red: 255 / 255, green: 95 / 255, blue: 86 / 255),
                Color(red: 255 / 255, green: 159 / 255, blue: 152 / 255)
            ]
        case .tealAVRRMIEM300404K44F:
            return [
                Color(red: 90 / 255, green: 200 / 255, blue: 250 / 255),
                Color(red: 64 / 255, green: 200 / 255, blue: 224 / 255),
                Color(red: 109 / 255, green: 213 / 255, blue: 237 / 255)
            ]
        case .indigoAVRRMIEM300404K44F:
            return [
                Color(red: 88 / 255, green: 86 / 255, blue: 214 / 255),
                Color(red: 94 / 255, green: 92 / 255, blue: 230 / 255),
                Color(red: 125 / 255, green: 122 / 255, blue: 255 / 255)
            ]
        case .yellowAVRRMIEM300404K44F:
            return [
                Color(red: 255 / 255, green: 204 / 255, blue: 0 / 255),
                Color(red: 255 / 255, green: 214 / 255, blue: 10 / 255),
                Color(red: 255 / 255, green: 224 / 255, blue: 50 / 255)
            ]
        case .mintAVRRMIEM300404K44F:
            return [
                Color(red: 0 / 255, green: 199 / 255, blue: 190 / 255),
                Color(red: 50 / 255, green: 215 / 255, blue: 200 / 255),
                Color(red: 102 / 255, green: 221 / 255, blue: 210 / 255)
            ]
        case .coralAVRRMIEM300404K44F:
            return [
                Color(red: 255 / 255, green: 127 / 255, blue: 80 / 255),
                Color(red: 255 / 255, green: 149 / 255, blue: 112 / 255),
                Color(red: 255 / 255, green: 171 / 255, blue: 144 / 255)
            ]
        }
    }
}

@MainActor
class ThemeManagerAVRRMIEM300404K44F: ObservableObject {
    @Published var currentThemeAVRRMIEM300404K44F: AppThemeAVRRMIEM300404K44F {
        didSet {
            UserDefaults.standard.set(currentThemeAVRRMIEM300404K44F.rawValue, forKey: "selectedTheme")
        }
    }
    
    init() {
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let theme = AppThemeAVRRMIEM300404K44F(rawValue: savedTheme) {
            self.currentThemeAVRRMIEM300404K44F = theme
        } else {
            self.currentThemeAVRRMIEM300404K44F = .pinkAVRRMIEM300404K44F
        }
    }
    
    var primaryColorAVRRMIEM300404K44F: Color {
        currentThemeAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F
    }
    
    var secondaryColorAVRRMIEM300404K44F: Color {
        currentThemeAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
    }
    
    var backgroundGradientAVRRMIEM300404K44F: [Color] {
        currentThemeAVRRMIEM300404K44F.backgroundGradientAVRRMIEM300404K44F
    }
    
    var accentColorsAVRRMIEM300404K44F: [Color] {
        currentThemeAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F
    }
}

