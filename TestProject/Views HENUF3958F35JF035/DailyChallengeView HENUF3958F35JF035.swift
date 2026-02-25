//
//  DailyChallengeView.swift


import SwiftUI

struct DailyChallengeViewHENUF3958F35JF035: View {
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    @State private var cardsHENUF3958F35JF035: [MemoryCardHENUF3958F35JF035] = []
    @State private var flippedCardsHENUF3958F35JF035: [Int] = []
    @State private var matchedPairsHENUF3958F35JF035: Set<Int> = []
    @State private var timeRemainingHENUF3958F35JF035: Int = 40
    @State private var timerHENUF3958F35JF035: Timer?
    @State private var isGameStartedHENUF3958F35JF035 = false
    @State private var isGameOverHENUF3958F35JF035 = false
    @State private var isChallengeCompleteHENUF3958F35JF035 = false
    @State private var showResultHENUF3958F35JF035 = false
    @Environment(\.dismiss) private var dismissHENUF3958F35JF035
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
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

    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    private var canPlayHENUF3958F35JF035: Bool {
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.canPlayChallengeHENUF3958F35JF035
    }
    
    private var allPairsMatchedHENUF3958F35JF035: Bool {
        // Перевіряємо, чи всі 8 пар знайдені (16 карток / 2 = 8 пар)
        matchedPairsHENUF3958F35JF035.count == 16 && cardsHENUF3958F35JF035.count == 16
    }
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            if !canPlayHENUF3958F35JF035 {
                lockedViewHENUF3958F35JF035
            } else if cardsHENUF3958F35JF035.isEmpty {
                startViewHENUF3958F35JF035
            } else if isChallengeCompleteHENUF3958F35JF035 {
                completionViewHENUF3958F35JF035
            } else if isGameOverHENUF3958F35JF035 || allPairsMatchedHENUF3958F35JF035 {
                resultViewHENUF3958F35JF035
            } else {
                gameViewHENUF3958F35JF035
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            stopTimerHENUF3958F35JF035()
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
    
    var lockedViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Image(systemName: "lock.fill")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 80 : 60))
                    .foregroundColor(.orange)
                
                Text("Challenge Locked")
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 40) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("You have already completed today's daily challenge!")
                    .font(isIPadHENUF3958F35JF035 ? .title2 : .body)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                Text("Come back tomorrow for a new challenge")
                    .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                    .foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                Button(action: {
                    dismissHENUF3958F35JF035()
                }) {
                    Text("Back")
                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 400 : 300)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
        .padding()
    }
    
    var startViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Image(systemName: "flame.fill")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 80 : 60))
                    .foregroundColor(.orange)
                
                Text("Daily Challenge")
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                    ChallengeRuleHENUF3958F35JF035(iconHENUF3958F35JF035: "square.grid.2x2", textHENUF3958F35JF035: "4x4 grid with picture pairs", colorHENUF3958F35JF035: .blue, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                    ChallengeRuleHENUF3958F35JF035(iconHENUF3958F35JF035: "eye.fill", textHENUF3958F35JF035: "Find all pairs by opening two pictures at a time", colorHENUF3958F35JF035: .green, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                    ChallengeRuleHENUF3958F35JF035(iconHENUF3958F35JF035: "timer", textHENUF3958F35JF035: "40 seconds total", colorHENUF3958F35JF035: .red, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                    ChallengeRuleHENUF3958F35JF035(iconHENUF3958F35JF035: "trophy.fill", textHENUF3958F35JF035: "One challenge per day", colorHENUF3958F35JF035: .yellow, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                    ChallengeRuleHENUF3958F35JF035(iconHENUF3958F35JF035: "flame.fill", textHENUF3958F35JF035: "Win streak: \(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winStreakHENUF3958F35JF035)", colorHENUF3958F35JF035: .orange, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                Button(action: {
                    startChallengeHENUF3958F35JF035()
                }) {
                    Text("Start Challenge")
                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 400 : 300)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.red.opacity(0.6)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
        .padding()
    }
    
    var gameViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                // Таймер та інформація
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 8) {
                            Image(systemName: "timer")
                                .foregroundColor(timeRemainingHENUF3958F35JF035 <= 10 ? .red : .orange)
                            Text("\(timeRemainingHENUF3958F35JF035)с")
                                .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                                .fontWeight(.bold)
                                .foregroundColor(timeRemainingHENUF3958F35JF035 <= 10 ? .red : .orange)
                        }
                        
                        Text("Pairs found: \(matchedPairsHENUF3958F35JF035.count / 2)/8")
                            .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // Кнопка закриття
                    Button(action: {
                        stopTimerHENUF3958F35JF035()
                        dismissHENUF3958F35JF035()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 32 : 28))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                
                // Ігрова сітка 4x4
                let columnsHENUF3958F35JF035 = Array(repeating: GridItem(.flexible(), spacing: isIPadHENUF3958F35JF035 ? 12 : 8), count: 4)
                
                LazyVGrid(columns: columnsHENUF3958F35JF035, spacing: isIPadHENUF3958F35JF035 ? 12 : 8) {
                    ForEach(0..<cardsHENUF3958F35JF035.count, id: \.self) { indexHENUF3958F35JF035 in
                        CardViewHENUF3958F35JF035(
                            cardHENUF3958F35JF035: cardsHENUF3958F35JF035[indexHENUF3958F35JF035],
                            isFlippedHENUF3958F35JF035: flippedCardsHENUF3958F35JF035.contains(indexHENUF3958F35JF035) || matchedPairsHENUF3958F35JF035.contains(cardsHENUF3958F35JF035[indexHENUF3958F35JF035].id),
                            isMatchedHENUF3958F35JF035: matchedPairsHENUF3958F35JF035.contains(cardsHENUF3958F35JF035[indexHENUF3958F35JF035].id),
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        ) {
                            flipCardHENUF3958F35JF035(at: indexHENUF3958F35JF035)
                        }
                    }
                }
                .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
    }
    
    var resultViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Image(systemName: allPairsMatchedHENUF3958F35JF035 ? "trophy.fill" : "xmark.circle.fill")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 100 : 80))
                    .foregroundColor(allPairsMatchedHENUF3958F35JF035 ? .yellow : .red)
                
                Text(allPairsMatchedHENUF3958F35JF035 ? "Challenge Complete!" : "Time's Up")
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Pairs found: \(matchedPairsHENUF3958F35JF035.count / 2)/8")
                    .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                    .foregroundColor(.white.opacity(0.7))
                
                if allPairsMatchedHENUF3958F35JF035 {
                    Text("Win streak: \(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winStreakHENUF3958F35JF035)")
                        .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                }
                
                Button(action: {
                    if allPairsMatchedHENUF3958F35JF035 {
                        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.completeChallengeHENUF3958F35JF035()
                        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035() // Оновлюємо профіль
                        isChallengeCompleteHENUF3958F35JF035 = true
                    } else {
                        resetChallengeHENUF3958F35JF035()
                    }
                }) {
                    Text(allPairsMatchedHENUF3958F35JF035 ? "Complete" : "Try Again")
                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 400 : 300)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    allPairsMatchedHENUF3958F35JF035 ? Color.green.opacity(0.8) : Color.blue.opacity(0.8),
                                    allPairsMatchedHENUF3958F35JF035 ? Color.blue.opacity(0.6) : Color.purple.opacity(0.6)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
        .padding()
    }
    
    var completionViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 100 : 80))
                    .foregroundColor(.green)
                
                Text("Challenge Completed!")
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Your win streak: \(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winStreakHENUF3958F35JF035)")
                    .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                    .foregroundColor(.orange)
                
                Button(action: {
                    // Оновлюємо профіль перед закриттям
                    appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
                    dismissHENUF3958F35JF035()
                }) {
                    Text("Back")
                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 400 : 300)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
        .padding()
    }
    
    struct ChallengeRuleHENUF3958F35JF035: View {
        let iconHENUF3958F35JF035: String
        let textHENUF3958F35JF035: String
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
            HStack(spacing: 15) {
                Image(systemName: iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 30 : 24))
                    .foregroundColor(colorHENUF3958F35JF035)
                    .frame(width: isIPadHENUF3958F35JF035 ? 40 : 30)
                
                Text(textHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
            .background(Color.white.opacity(0.05))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(colorHENUF3958F35JF035.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(15)
        }
    }
    
    struct CardViewHENUF3958F35JF035: View {
        let cardHENUF3958F35JF035: MemoryCardHENUF3958F35JF035
        let isFlippedHENUF3958F35JF035: Bool
        let isMatchedHENUF3958F35JF035: Bool
        let isIPadHENUF3958F35JF035: Bool
        let actionHENUF3958F35JF035: () -> Void
        
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
            Button(action: actionHENUF3958F35JF035) {
                ZStack {
                    RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 12 : 8)
                        .fill(isMatchedHENUF3958F35JF035 ? Color.green.opacity(0.3) : (isFlippedHENUF3958F35JF035 ? Color.blue.opacity(0.2) : Color.white.opacity(0.1)))
                        .frame(height: isIPadHENUF3958F35JF035 ? 90 : 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 12 : 8)
                                .stroke(isMatchedHENUF3958F35JF035 ? Color.green : (isFlippedHENUF3958F35JF035 ? Color.blue : Color.white.opacity(0.2)), lineWidth: 2)
                        )
                    
                    if isFlippedHENUF3958F35JF035 || isMatchedHENUF3958F35JF035 {
                        Image(systemName: cardHENUF3958F35JF035.iconHENUF3958F35JF035)
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 40 : 30))
                            .foregroundColor(isMatchedHENUF3958F35JF035 ? .green : .white)
                    } else {
                        Image(systemName: "questionmark")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 35 : 25))
                            .foregroundColor(.white.opacity(0.5))
                            .scaleEffect(x: -1, y: 1)
                    }
                }
                .rotation3DEffect(
                    .degrees(isFlippedHENUF3958F35JF035 || isMatchedHENUF3958F35JF035 ? 0 : 180),
                    axis: (x: 0, y: 1, 0)
                )
                .opacity(isFlippedHENUF3958F35JF035 || isMatchedHENUF3958F35JF035 ? 1 : 0.8)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isFlippedHENUF3958F35JF035)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isMatchedHENUF3958F35JF035)
            }
            .disabled(isFlippedHENUF3958F35JF035 || isMatchedHENUF3958F35JF035)
        }
    }
    
    struct MemoryCardHENUF3958F35JF035: Identifiable {
        let id: Int
        let iconHENUF3958F35JF035: String
        
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

        
    }
    
    func startChallengeHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        // Створюємо 8 пар картинок (16 карток для сітки 4x4)
        let iconsHENUF3958F35JF035 = [
            "star.fill", "heart.fill", "flame.fill", "bolt.fill",
            "crown.fill", "trophy.fill", "diamond.fill", "sparkles"
        ]
        
        var cardPairsHENUF3958F35JF035: [MemoryCardHENUF3958F35JF035] = []
        for (indexHENUF3958F35JF035, iconHENUF3958F35JF035) in iconsHENUF3958F35JF035.enumerated() {
            // Створюємо дві картки з однаковою іконкою, але різними ID
            cardPairsHENUF3958F35JF035.append(MemoryCardHENUF3958F35JF035(id: indexHENUF3958F35JF035 * 2, iconHENUF3958F35JF035: iconHENUF3958F35JF035))
            cardPairsHENUF3958F35JF035.append(MemoryCardHENUF3958F35JF035(id: indexHENUF3958F35JF035 * 2 + 1, iconHENUF3958F35JF035: iconHENUF3958F35JF035))
        }
        
        // Перемішуємо картки
        cardsHENUF3958F35JF035 = cardPairsHENUF3958F35JF035.shuffled()
        
        timeRemainingHENUF3958F35JF035 = 40
        isGameStartedHENUF3958F35JF035 = true
        flippedCardsHENUF3958F35JF035 = []
        matchedPairsHENUF3958F35JF035 = []
        startTimerHENUF3958F35JF035()
    }
    
    func flipCardHENUF3958F35JF035(at indexHENUF3958F35JF035: Int) {
        guard !isGameOverHENUF3958F35JF035 else { return }
        guard !flippedCardsHENUF3958F35JF035.contains(indexHENUF3958F35JF035) else { return }
        guard !matchedPairsHENUF3958F35JF035.contains(cardsHENUF3958F35JF035[indexHENUF3958F35JF035].id) else { return }
        
        // Якщо вже відкрито 2 картки, не дозволяємо відкривати більше
        if flippedCardsHENUF3958F35JF035.count >= 2 {
            return
        }
        
        if flippedCardsHENUF3958F35JF035.isEmpty {
            // Відкриваємо першу картку з анімацією
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                flippedCardsHENUF3958F35JF035 = [indexHENUF3958F35JF035]
            }
        } else if flippedCardsHENUF3958F35JF035.count == 1 {
            // Відкриваємо другу картку з анімацією
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                flippedCardsHENUF3958F35JF035.append(indexHENUF3958F35JF035)
            }
            // Перевіряємо пару через невелику затримку (скорочено в 3 рази)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.27) {
                checkPairHENUF3958F35JF035()
            }
        }
    }
    
    func checkPairHENUF3958F35JF035() {
        guard flippedCardsHENUF3958F35JF035.count == 2 else { return }
        
        let card1HENUF3958F35JF035 = cardsHENUF3958F35JF035[flippedCardsHENUF3958F35JF035[0]]
        let card2HENUF3958F35JF035 = cardsHENUF3958F35JF035[flippedCardsHENUF3958F35JF035[1]]
        
        // Перевіряємо, чи це пара (однакові іконки)
        if card1HENUF3958F35JF035.iconHENUF3958F35JF035 == card2HENUF3958F35JF035.iconHENUF3958F35JF035 {
            // Знайдено пару - залишаємо відкритими
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
            matchedPairsHENUF3958F35JF035.insert(card1HENUF3958F35JF035.id)
            matchedPairsHENUF3958F35JF035.insert(card2HENUF3958F35JF035.id)
            
            // Невелика затримка перед очищенням flippedCards для анімації
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                flippedCardsHENUF3958F35JF035 = []
                
                // Перевіряємо, чи всі пари знайдені
                if allPairsMatchedHENUF3958F35JF035 {
                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
                    stopTimerHENUF3958F35JF035()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isGameOverHENUF3958F35JF035 = true
                    }
                }
            }
        } else {
            // Не пара - закриваємо картки через затримку з анімацією
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .error)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.47) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    flippedCardsHENUF3958F35JF035 = []
                }
            }
        }
    }
    
    func startTimerHENUF3958F35JF035() {
        timerHENUF3958F35JF035?.invalidate()
        timerHENUF3958F35JF035 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemainingHENUF3958F35JF035 > 0 {
                timeRemainingHENUF3958F35JF035 -= 1
            } else {
                stopTimerHENUF3958F35JF035()
                isGameOverHENUF3958F35JF035 = true
            }
        }
    }
    
    func stopTimerHENUF3958F35JF035() {
        timerHENUF3958F35JF035?.invalidate()
        timerHENUF3958F35JF035 = nil
    }
    
    func resetChallengeHENUF3958F35JF035() {
        stopTimerHENUF3958F35JF035()
        cardsHENUF3958F35JF035 = []
        flippedCardsHENUF3958F35JF035 = []
        matchedPairsHENUF3958F35JF035 = []
        timeRemainingHENUF3958F35JF035 = 40
        isGameStartedHENUF3958F35JF035 = false
        isGameOverHENUF3958F35JF035 = false
        showResultHENUF3958F35JF035 = false
    }
}

#Preview {
    DailyChallengeViewHENUF3958F35JF035()
}
