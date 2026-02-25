//
//  WordGuessingSelectionView.swift


import SwiftUI

struct WordGuessingSelectionViewHENUF3958F35JF035: View {
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
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                    // Заголовок
                    VStack(spacing: 5) {
                        Text("Guess the Word")
                            .font(isIPadHENUF3958F35JF035 ? .system(size: 45) : .system(size: 32))
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.green,
                                        Color.mint
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text("Test your vocabulary skills")
                            .font(isIPadHENUF3958F35JF035 ? .body : .subheadline)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 15)
                    
                    // Правила гри
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 12 : 10) {
                        Text("How to Play")
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        GameRuleCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "text.book.closed.fill",
                            titleHENUF3958F35JF035: "Read the Description",
                            descriptionHENUF3958F35JF035: "Each word comes with a description",
                            colorHENUF3958F35JF035: .blue,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                        
                        GameRuleCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "lightbulb.fill",
                            titleHENUF3958F35JF035: "Use Hints",
                            descriptionHENUF3958F35JF035: "You have 2 hints available for each word",
                            colorHENUF3958F35JF035: .yellow,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                        
                        GameRuleCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "pencil.and.outline",
                            titleHENUF3958F35JF035: "Type Your Answer",
                            descriptionHENUF3958F35JF035: "Enter the word you think matches",
                            colorHENUF3958F35JF035: .green,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                        
                        GameRuleCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "star.fill",
                            titleHENUF3958F35JF035: "Score Points",
                            descriptionHENUF3958F35JF035: "Get points for each correct answer",
                            colorHENUF3958F35JF035: .orange,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                    }
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 20)
                    
                    Spacer()
                    
                    // Кнопка початку гри
                    NavigationLink(destination: WordGuessingViewHENUF3958F35JF035()) {
                        HStack(spacing: 15) {
                            Image(systemName: "play.fill")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 22))
                            Text("Start Game")
                                .font(isIPadHENUF3958F35JF035 ? .title3 : .headline)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 500 : 350)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 16)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.green.opacity(0.9),
                                    Color.mint.opacity(0.8)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .shadow(color: .green.opacity(0.5), radius: 15, x: 0, y: 8)
                    }
                    .padding(.bottom, isIPadHENUF3958F35JF035 ? 30 : 20)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Words")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
    
}

struct GameRuleCardHENUF3958F35JF035: View {
    let iconHENUF3958F35JF035: String
    let titleHENUF3958F35JF035: String
    let descriptionHENUF3958F35JF035: String
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
        HStack(spacing: isIPadHENUF3958F35JF035 ? 15 : 12) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                colorHENUF3958F35JF035.opacity(0.3),
                                colorHENUF3958F35JF035.opacity(0.15)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 55 : 45, height: isIPadHENUF3958F35JF035 ? 55 : 45)
                
                Image(systemName: iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20, weight: .semibold))
                    .foregroundColor(colorHENUF3958F35JF035)
            }
            
            // Text
            VStack(alignment: .leading, spacing: 4) {
                Text(titleHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .headline : .subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(descriptionHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .subheadline : .caption)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(isIPadHENUF3958F35JF035 ? 15 : 12)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.08),
                    Color.white.opacity(0.03)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 15 : 12)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            colorHENUF3958F35JF035.opacity(0.4),
                            colorHENUF3958F35JF035.opacity(0.1)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 12)
        .shadow(color: colorHENUF3958F35JF035.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    WordGuessingSelectionViewHENUF3958F35JF035()
}

