//
//  MainTabView.swift


import SwiftUI
import UIKit

struct MainTabViewHENUF3958F35JF035: View {
    @State private var selectedTabHENUF3958F35JF035 = 0
    
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

    
    init() {
        // Налаштування таббара для темної теми
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        // Колір неактивних іконок
        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        // Колір активних іконок
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTabHENUF3958F35JF035) {
                QuizModeSelectionViewHENUF3958F35JF035()
                    .tabItem {
                        Label("Quiz", systemImage: "questionmark.circle.fill")
                    }
                    .tag(0)
                
                WordGuessingSelectionViewHENUF3958F35JF035()
                    .tabItem {
                        Label("Words", systemImage: "text.bubble.fill")
                    }
                    .tag(1)
                
                FactsViewHENUF3958F35JF035()
                    .tabItem {
                        Label("Facts", systemImage: "lightbulb.fill")
                    }
                    .tag(2)
                
                ProfileViewHENUF3958F35JF035(isActiveHENUF3958F35JF035: selectedTabHENUF3958F35JF035 == 3)
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(3)
            }
            .preferredColorScheme(.dark)
            .onChange(of: selectedTabHENUF3958F35JF035) { newTabHENUF3958F35JF035 in
                // Оновлюємо профіль при переході на таб профілю
                if newTabHENUF3958F35JF035 == 3 {
                    AppStateHENUF3958F35JF035.shared.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
                }
            }
        }
    }
}

#Preview {
    MainTabViewHENUF3958F35JF035()
}

