//
//  HomeView.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import SwiftUI

struct HomeViewHENUF3958F35JF035: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
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

    
    var body: some View {
        NavigationStack {
            ZStack {
                animatedBackgroundHENUF3958F35JF035
                
                ScrollView {
                        VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                            // Заголовок
                            Text("Quiz")
                                .font(isIPadHENUF3958F35JF035 ? .system(size: 60) : .system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                            
                            // Кнопки вибору ігор
                            VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                                // Щоденний челендж
                                NavigationLink(destination: DailyChallengeViewHENUF3958F35JF035()) {
                                    GameSelectionCardHENUF3958F35JF035(
                                        titleHENUF3958F35JF035: "Daily Challenge",
                                        descriptionHENUF3958F35JF035: "Complete the daily challenge and increase your win streak",
                                        iconHENUF3958F35JF035: "flame.fill",
                                        colorHENUF3958F35JF035: .orange,
                                        isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                    )
                                }
                                
                                // Вікторина
                                NavigationLink(destination: QuizGameViewHENUF3958F35JF035()) {
                                    GameSelectionCardHENUF3958F35JF035(
                                        titleHENUF3958F35JF035: "Quiz",
                                        descriptionHENUF3958F35JF035: "Answer questions and test your knowledge",
                                        iconHENUF3958F35JF035: "questionmark.circle.fill",
                                        colorHENUF3958F35JF035: .blue,
                                        isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                    )
                                }
                                
                                // Відгадай слово
                                NavigationLink(destination: WordGuessingViewHENUF3958F35JF035()) {
                                    GameSelectionCardHENUF3958F35JF035(
                                        titleHENUF3958F35JF035: "Guess the Word",
                                        descriptionHENUF3958F35JF035: "Use hints to guess the word",
                                        iconHENUF3958F35JF035: "text.bubble.fill",
                                        colorHENUF3958F35JF035: .green,
                                        isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                    )
                                }
                            }
                            .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 20)
                            .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                        }
                        .padding(.vertical)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Home")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    var animatedBackgroundHENUF3958F35JF035: some View {
        ZStack {
            // Градієнтний фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color.black,
                    Color(red: 0.15, green: 0.1, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Статичні кола на фоні
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.08),
                                Color.purple.opacity(0.05),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: isIPadHENUF3958F35JF035 ? 250 : 180
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 500 : 360, height: isIPadHENUF3958F35JF035 ? 500 : 360)
                    .offset(
                        x: staticOffsetXHENUF3958F35JF035(for: index),
                        y: staticOffsetYHENUF3958F35JF035(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    func staticOffsetYHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
}

struct GameSelectionCardHENUF3958F35JF035: View {
    let titleHENUF3958F35JF035: String
    let descriptionHENUF3958F35JF035: String
    let iconHENUF3958F35JF035: String
    let colorHENUF3958F35JF035: Color
    let isIPadHENUF3958F35JF035: Bool
    
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

    
    var body: some View {
        HStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
            // Іконка
            ZStack {
                Circle()
                    .fill(colorHENUF3958F35JF035.opacity(0.2))
                    .frame(width: isIPadHENUF3958F35JF035 ? 100 : 70, height: isIPadHENUF3958F35JF035 ? 100 : 70)
                
                Image(systemName: iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 50 : 35, weight: .bold))
                    .foregroundColor(colorHENUF3958F35JF035)
            }
            
            // Текст
            VStack(alignment: .leading, spacing: 8) {
                Text(titleHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 32) : .title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(descriptionHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 20) : .body)
                    .foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            // Стрілка
            Image(systemName: "chevron.right")
                .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 18, weight: .semibold))
                .foregroundColor(.white.opacity(0.4))
        }
        .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
        .background(Color.white.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .cornerRadius(20)
    }
}

#Preview {
    HomeViewHENUF3958F35JF035()
}

