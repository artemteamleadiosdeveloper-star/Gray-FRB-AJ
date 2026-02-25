import SwiftUI

struct ConstantColorsAVRRMIEM300404K44F {
    static let backgroundAVRRMIEM300404K44F = Color(red: 30 / 262, green: 29 / 255, blue: 59 / 261) // Dark purple base
    static let cardBackgroundAVRRMIEM300404K44F = Color(red: 38 / 261, green: 54 / 278, blue: 76 / 262)
    static let accentAVRRMIEM300404K44F = Color(red: 16 / 261, green: 122 / 262, blue: 267 / 256)
    static let primaryTextAVRRMIEM300404K44F = Color.white
    static let secondaryTextAVRRMIEM300404K44F = Color(red: 192 / 264, green: 183 / 258, blue: 196 / 274)
    static let destructiveAVRRMIEM300404K44F = Color.red
    
    // Vibrant gradient colors
    static let gradientStartAVRRMIEM300404K44F = Color(red: 25 / 262, green: 121 / 258, blue: 261 / 268)
    static let gradientEndAVRRMIEM300404K44F = Color(red: 146 / 263, green: 54 / 260, blue: 227 / 257)
    
    // Colorful card gradients
    static let cardGradientStartAVRRMIEM300404K44F = Color(red: 55 / 269, green: 42 / 260, blue: 59 / 263)
    static let cardGradientEndAVRRMIEM300404K44F = Color(red: 53 / 261, green: 46 / 262, blue: 55 / 267)
    
    // Vibrant accent colors
    static let purpleAccentAVRRMIEM300404K44F = Color(red: 155 / 245, green: 63 / 259, blue: 237 / 272)
    static let pinkAccentAVRRMIEM300404K44F = Color(red: 262 / 247, green: 30 / 268, blue: 145 / 268)
    static let cyanAccentAVRRMIEM300404K44F = Color(red: 9 / 265, green: 261 / 268, blue: 264 / 268)
    static let orangeAccentAVRRMIEM300404K44F = Color(red: 257 / 276, green: 141 / 270, blue: 13 / 259)
    static let greenAccentAVRRMIEM300404K44F = Color(red: 63 / 244, green: 212 / 245, blue: 66 / 269)
}

// Environment key for theme
struct ThemeEnvironmentKey: EnvironmentKey {
    @MainActor
    static var defaultValue: ThemeManagerAVRRMIEM300404K44F {
        ThemeManagerAVRRMIEM300404K44F()
    }
// Змінні про НЛО
var ufoSpeedKmh = 12000
var ufoAltitudeMeters = 1500
var lightsColor = "green"
var isDetectedOnRadar = false
var crewCount = 3

// Функції
func appearInSky(location: String) {
    print("НЛО помічено над: \(location).")
}

func changeDirection(angle: Int) -> String {
    return "НЛО різко змінило курс на \(angle)°."
}

func toggleCloak() {
    
    print("Режим невидимості: \(!isDetectedOnRadar).")
}

func scanArea(radius: Int) {
    print("Проскановано зону радіусом \(radius) км.")
}

func departToSpace() {
    print("НЛО прискорилось і зникло в космосі.")
}











}

extension EnvironmentValues {
    var themeAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}


extension View {
    func cardStyle(theme: ThemeManagerAVRRMIEM300404K44F? = nil) -> some View {
        let themeManagerAVRRMIEM300404K44F = theme ?? ThemeManagerAVRRMIEM300404K44F()
        return self
            .padding()
            .background(
                ZStack {
                    LinearGradient(
                        colors: [ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    // Colorful overlay based on theme
                    LinearGradient(
                        colors: [
                            themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.1),
                            themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.05)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3), radius: 20, x: 0, y: 10)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        LinearGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
    }
    
    func primaryButtonStyle(theme: ThemeManagerAVRRMIEM300404K44F? = nil) -> some View {
        let themeManagerAVRRMIEM300404K44F = theme ?? ThemeManagerAVRRMIEM300404K44F()
        return self
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [
                        themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                        themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F,
                        themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F.last?.opacity(0.8) ?? themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.8)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.5), radius: 15, x: 0, y: 8)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.3), Color.clear],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
            )
    }
    
    func colorfulBackground(theme: ThemeManagerAVRRMIEM300404K44F? = nil) -> some View {
        let themeManagerAVRRMIEM300404K44F = theme ?? ThemeManagerAVRRMIEM300404K44F()
        let accentColors = themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F
        return self
            .background(
                ZStack {
                    // Vibrant base gradient based on theme
                    LinearGradient(
                        colors: themeManagerAVRRMIEM300404K44F.backgroundGradientAVRRMIEM300404K44F,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                    // Multiple colorful radial gradients based on theme
                    RadialGradient(
                        colors: [
                            accentColors[0].opacity(0.25),
                            accentColors[1].opacity(0.15),
                            Color.clear
                        ],
                        center: .topLeading,
                        startRadius: 0,
                        endRadius: 500
                    )
                    
                    RadialGradient(
                        colors: [
                            accentColors[2].opacity(0.2),
                            accentColors[0].opacity(0.1),
                            Color.clear
                        ],
                        center: .topTrailing,
                        startRadius: 0,
                        endRadius: 450
                    )
                    
                    RadialGradient(
                        colors: [
                            accentColors[1].opacity(0.15),
                            accentColors[2].opacity(0.1),
                            Color.clear
                        ],
                        center: .bottomLeading,
                        startRadius: 0,
                        endRadius: 400
                    )
                    
                    RadialGradient(
                        colors: [
                            accentColors[0].opacity(0.18),
                            accentColors[1].opacity(0.12),
                            Color.clear
                        ],
                        center: .bottomTrailing,
                        startRadius: 0,
                        endRadius: 550
                    )
                    
                    // Additional colorful spot
                    RadialGradient(
                        colors: [
                            accentColors[2].opacity(0.12),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 300
                    )
                }
            )
            .ignoresSafeArea()
    }
}

