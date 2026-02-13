//
//  QuizModeSelectionView.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import SwiftUI

struct QuizModeSelectionViewHENUF3958F35JF035: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    @State private var showChallengeHENUF3958F35JF035 = false
    @State private var animationScaleHENUF3958F35JF035: CGFloat = 1.0
    @State private var animationTimerHENUF3958F35JF035: Timer?
    @State private var showExclamationBadgeHENUF3958F35JF035 = true
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    
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
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                ScrollView {
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                        Text("Select Game Mode")
                            .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                        
                        HStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 0) {
                            if isIPadHENUF3958F35JF035 {
                                VStack(spacing: 20) {
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .singlePlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "person.fill",
                                            titleHENUF3958F35JF035: "Single Player",
                                            subtitleHENUF3958F35JF035: "3 lives, 15 questions",
                                            colorHENUF3958F35JF035: .blue,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .twoPlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "person.2.fill",
                                            titleHENUF3958F35JF035: "Two Player",
                                            subtitleHENUF3958F35JF035: "10 questions each",
                                            colorHENUF3958F35JF035: .green,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .aiPlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "brain.head.profile",
                                            titleHENUF3958F35JF035: "AI Player",
                                            subtitleHENUF3958F35JF035: "AI answers randomly",
                                            colorHENUF3958F35JF035: .purple,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .timeAttackHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "timer",
                                            titleHENUF3958F35JF035: "Time Attack",
                                            subtitleHENUF3958F35JF035: "10 seconds per question, endless",
                                            colorHENUF3958F35JF035: .orange,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            } else {
                                VStack(spacing: 30) {
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .singlePlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "person.fill",
                                            titleHENUF3958F35JF035: "Single Player",
                                            subtitleHENUF3958F35JF035: "3 lives, 15 questions",
                                            colorHENUF3958F35JF035: .blue,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .twoPlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "person.2.fill",
                                            titleHENUF3958F35JF035: "Two Player",
                                            subtitleHENUF3958F35JF035: "10 questions each",
                                            colorHENUF3958F35JF035: .green,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .aiPlayerHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "brain.head.profile",
                                            titleHENUF3958F35JF035: "AI Player",
                                            subtitleHENUF3958F35JF035: "AI answers randomly",
                                            colorHENUF3958F35JF035: .purple,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                    
                                    NavigationLink(destination: QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: .timeAttackHENUF3958F35JF035)) {
                                        ModeButtonHENUF3958F35JF035(
                                            iconHENUF3958F35JF035: "timer",
                                            titleHENUF3958F35JF035: "Time Attack",
                                            subtitleHENUF3958F35JF035: "10 seconds per question, endless",
                                            colorHENUF3958F35JF035: .orange,
                                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                        )
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                    .padding()
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                Spacer()
            }
            
            // Окрема кнопка челенджу над таббаром зліва (тільки якщо можна грати)
            if appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.canPlayChallengeHENUF3958F35JF035 {
                Button(action: {
                    // Ховаємо знак оклику з анімацією при натисканні
                    withAnimation(.easeOut(duration: 0.3)) {
                        showExclamationBadgeHENUF3958F35JF035 = false
                    }
                    showChallengeHENUF3958F35JF035 = true
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.orange.opacity(0.9),
                                        Color.red.opacity(0.8)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 60, height: 60)
                            .shadow(color: Color.orange.opacity(0.5), radius: 10, x: 0, y: 5)
                        
                        Image(systemName: "flame.fill")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        
                        // Маленький знак оклику в кружку в правому верхньому куті
                        if showExclamationBadgeHENUF3958F35JF035 {
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 20, height: 20)
                                
                                Image(systemName: "exclamationmark")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .offset(x: 20, y: -20)
                            .opacity(showExclamationBadgeHENUF3958F35JF035 ? 1 : 0)
                            .scaleEffect(showExclamationBadgeHENUF3958F35JF035 ? 1 : 0.5)
                            .animation(.easeOut(duration: 0.3), value: showExclamationBadgeHENUF3958F35JF035)
                        }
                    }
                    .scaleEffect(animationScaleHENUF3958F35JF035)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
                .padding(.leading)
            }
        }
        .sheet(isPresented: $showChallengeHENUF3958F35JF035) {
            DailyChallengeViewHENUF3958F35JF035()
        }
        .onAppear {
            // Оновлюємо профіль при появі view
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
            // Показуємо знак оклику знову, якщо челендж доступний
            if appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.canPlayChallengeHENUF3958F35JF035 {
                showExclamationBadgeHENUF3958F35JF035 = true
            }
            startChallengeAnimationHENUF3958F35JF035()
        }
        .onDisappear {
            stopChallengeAnimationHENUF3958F35JF035()
        }
        .onChange(of: showChallengeHENUF3958F35JF035) { isShowingHENUF3958F35JF035 in
            // Оновлюємо профіль після закриття челенджу
            if !isShowingHENUF3958F35JF035 {
                appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Quiz")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
    
    func startChallengeAnimationHENUF3958F35JF035() {
        stopChallengeAnimationHENUF3958F35JF035()
        animationScaleHENUF3958F35JF035 = 1.0
        
        // Подвійна пульсація кожні 5 секунд (швидша)
        animationTimerHENUF3958F35JF035 = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            // Перша пульсація
            withAnimation(.easeInOut(duration: 0.3)) {
                animationScaleHENUF3958F35JF035 = 1.15
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    animationScaleHENUF3958F35JF035 = 1.0
                }
                // Друга пульсація
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        animationScaleHENUF3958F35JF035 = 1.15
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            animationScaleHENUF3958F35JF035 = 1.0
                        }
                    }
                }
            }
        }
    }
    
    func stopChallengeAnimationHENUF3958F35JF035() {
        animationTimerHENUF3958F35JF035?.invalidate()
        animationTimerHENUF3958F35JF035 = nil
    }
}

struct ModeButtonHENUF3958F35JF035: View {
    let iconHENUF3958F35JF035: String
    let titleHENUF3958F35JF035: String
    let subtitleHENUF3958F35JF035: String
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
        VStack(spacing: isIPadHENUF3958F35JF035 ? 15 : 10) {
            Image(systemName: iconHENUF3958F35JF035)
                .font(.system(size: isIPadHENUF3958F35JF035 ? 60 : 50))
                .foregroundColor(colorHENUF3958F35JF035)
            Text(titleHENUF3958F35JF035)
                .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(subtitleHENUF3958F35JF035)
                .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
        .background(Color.white.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 25 : 20)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .cornerRadius(isIPadHENUF3958F35JF035 ? 25 : 20)
    }
}

#Preview {
    QuizModeSelectionViewHENUF3958F35JF035()
}

