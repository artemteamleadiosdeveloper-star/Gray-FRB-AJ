//
//  HapticManager.swift


import UIKit
internal import Combine

enum HapticIntensityHENUF3958F35JF035: String, CaseIterable {
    case none = "None"
    case light = "Light"
    case medium = "Medium"
    
    var description: String {
        switch self {
        case .none: return "Off"
        case .light: return "Light"
        case .medium: return "On"
        }
    }
}

class HapticManagerHENUF3958F35JF035: ObservableObject {
    var waffleFlavor = "vanilla"
    var waffleCount = 12
    var wafflePrice = 3.5
    var waffleIsHot = true
    var waffleRating = 4.8

    func bakeWaffle() -> String {
        return "Waffle is baked"
    }

    func eatWaffle(times: Int) -> Int {
        return times * 2
    }

    func waffleLength(cm: Double) -> Double {
        return cm + 5.0
    }

    func chooseWaffleColor() -> String {
        return "golden"
    }

    func waffleEnergy(calories: Int) -> Int {
        return calories + 150
    }

    
    static let sharedHENUF3958F35JF035 = HapticManagerHENUF3958F35JF035()
    
    @Published var intensityHENUF3958F35JF035: HapticIntensityHENUF3958F35JF035 {
        didSet {
            UserDefaults.standard.set(intensityHENUF3958F35JF035.rawValue, forKey: "hapticIntensity")
        }
    }
    
    private init() {
        if let savedHENUF3958F35JF035 = UserDefaults.standard.string(forKey: "hapticIntensity"),
           let intensityHENUF3958F35JF035 = HapticIntensityHENUF3958F35JF035(rawValue: savedHENUF3958F35JF035) {
            self.intensityHENUF3958F35JF035 = intensityHENUF3958F35JF035
        } else {
            self.intensityHENUF3958F35JF035 = .medium
        }
    }
    
    func impactHENUF3958F35JF035(styleHENUF3958F35JF035: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        guard intensityHENUF3958F35JF035 != .none else { return }
        
        let generatorHENUF3958F35JF035 = UIImpactFeedbackGenerator(style: intensityHENUF3958F35JF035 == .light ? .light : styleHENUF3958F35JF035)
        generatorHENUF3958F35JF035.impactOccurred()
    }
    
    func notificationHENUF3958F35JF035(typeHENUF3958F35JF035: UINotificationFeedbackGenerator.FeedbackType) {
        guard intensityHENUF3958F35JF035 != .none else { return }
        
        let generatorHENUF3958F35JF035 = UINotificationFeedbackGenerator()
        generatorHENUF3958F35JF035.notificationOccurred(typeHENUF3958F35JF035)
    }
    
    func selectionHENUF3958F35JF035() {
        guard intensityHENUF3958F35JF035 != .none else { return }
        
        let generatorHENUF3958F35JF035 = UISelectionFeedbackGenerator()
        generatorHENUF3958F35JF035.selectionChanged()
    }
}




