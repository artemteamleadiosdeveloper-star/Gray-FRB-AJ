//
//  WordGuessingView.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import SwiftUI
import UIKit

struct WordGuessingViewHENUF3958F35JF035: View {
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    @State private var wordQuestionsHENUF3958F35JF035: [WordQuestionHENUF3958F35JF035] = []
    @State private var currentIndexHENUF3958F35JF035 = 0
    @State private var userGuessHENUF3958F35JF035 = ""
    @State private var showHint1HENUF3958F35JF035 = false
    @State private var showHint2HENUF3958F35JF035 = false
    @State private var scoreHENUF3958F35JF035 = 0
    @State private var showResultHENUF3958F35JF035 = false
    @State private var isCorrectHENUF3958F35JF035 = false
    @State private var hint1AnimationHENUF3958F35JF035 = false
    @State private var hint2AnimationHENUF3958F35JF035 = false
    @State private var resultAnimationHENUF3958F35JF035 = false
    @State private var answerCheckedHENUF3958F35JF035 = false // Чи вже була перевірена відповідь для поточного слова
    @Environment(\.dismiss) private var dismiss
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @FocusState private var isTextFieldFocusedHENUF3958F35JF035: Bool
    
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

    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            if currentIndexHENUF3958F35JF035 >= wordQuestionsHENUF3958F35JF035.count {
                gameOverViewHENUF3958F35JF035
            } else {
                gameViewHENUF3958F35JF035
            }
        }
        .onAppear {
            if wordQuestionsHENUF3958F35JF035.isEmpty {
                startGameHENUF3958F35JF035()
            }
        }
    }
    
    var gameViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            ScrollView {
                VStack(spacing: isIPad ? 35 : 25) {
                    // Progress Bar
                    VStack(spacing: 10) {
                        HStack {
                            Text("Score: \(scoreHENUF3958F35JF035)")
                                .font(isIPad ? .title : .title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            HStack(spacing: 5) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.title3)
                                Text("\(scoreHENUF3958F35JF035)/\(wordQuestionsHENUF3958F35JF035.count)")
                                    .font(isIPad ? .title2 : .title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        // Progress Bar
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.1))
                                .frame(height: 12)
                            
                            GeometryReader { geo in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.green, Color.blue]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: geo.size.width * CGFloat(scoreHENUF3958F35JF035) / CGFloat(wordQuestionsHENUF3958F35JF035.count), height: 12)
                                    .animation(.spring(response: 0.3), value: scoreHENUF3958F35JF035)
                            }
                        }
                        .frame(height: 12)
                    }
                    .padding(.horizontal, isIPad ? 40 : 20)
                    .padding(.top, 20)
                    
                    let currentWord = wordQuestionsHENUF3958F35JF035[currentIndexHENUF3958F35JF035]
                    
                    // Word Number Badge
                    HStack {
                        Spacer()
                        HStack(spacing: 8) {
                            Image(systemName: "number")
                                .foregroundColor(.blue)
                            Text("Word \(currentIndexHENUF3958F35JF035 + 1) of \(wordQuestionsHENUF3958F35JF035.count)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                        )
                        .cornerRadius(20)
                        Spacer()
                    }
                    .padding(.horizontal, isIPad ? 40 : 20)
                    
                    // Description Card
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "text.book.closed.fill")
                                .font(.title2)
                                .foregroundColor(.purple)
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.7))
                            Spacer()
                        }
                        
                        Text(currentWord.descriptionHENUF3958F35JF035)
                            .font(isIPad ? .title2 : .title3)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .lineSpacing(5)
                    }
                    .padding(isIPad ? 30 : 20)
                    .frame(maxWidth: isIPad ? 800 : .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.blue.opacity(0.3)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1.5
                                    )
                            )
                    )
                    .padding(.horizontal, isIPad ? 40 : 20)
                
                    // Hints Section
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .font(.title3)
                                .foregroundColor(.yellow)
                            Text("Hints")
                                .font(isIPad ? .title2 : .title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal, isIPad ? 40 : 20)
                        
                        // Hint 1
                        if showHint1HENUF3958F35JF035 {
                            HintCardHENUF3958F35JF035(
                                hintHENUF3958F35JF035: currentWord.hint1HENUF3958F35JF035,
                                numberHENUF3958F35JF035: 1,
                                isIPad: isIPad,
                                animation: hint1AnimationHENUF3958F35JF035
                            )
                            .transition(.scale.combined(with: .opacity))
                        } else {
                            HintButtonHENUF3958F35JF035(
                                numberHENUF3958F35JF035: 1,
                                iconHENUF3958F35JF035: "eye.fill",
                                colorHENUF3958F35JF035: .blue,
                                isIPad: isIPad,
                                action: {
                                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                        showHint1HENUF3958F35JF035 = true
                                        hint1AnimationHENUF3958F35JF035 = true
                                    }
                                }
                            )
                        }
                        
                        // Hint 2
                        if showHint2HENUF3958F35JF035 {
                            HintCardHENUF3958F35JF035(
                                hintHENUF3958F35JF035: currentWord.hint2HENUF3958F35JF035,
                                numberHENUF3958F35JF035: 2,
                                isIPad: isIPad,
                                animation: hint2AnimationHENUF3958F35JF035
                            )
                            .transition(.scale.combined(with: .opacity))
                        } else if showHint1HENUF3958F35JF035 {
                            HintButtonHENUF3958F35JF035(
                                numberHENUF3958F35JF035: 2,
                                iconHENUF3958F35JF035: "eye.fill",
                                colorHENUF3958F35JF035: .orange,
                                isIPad: isIPad,
                                action: {
                                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                        showHint2HENUF3958F35JF035 = true
                                        hint2AnimationHENUF3958F35JF035 = true
                                    }
                                }
                            )
                        }
                    }
                    .padding(.horizontal, isIPad ? 40 : 20)
                
                    // Input Section
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "pencil.and.outline")
                                .font(.title3)
                                .foregroundColor(.green)
                            Text("Your Answer")
                                .font(isIPad ? .title2 : .title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal, isIPad ? 40 : 20)
                        
                        TextField("Enter word...", text: $userGuessHENUF3958F35JF035)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(isIPad ? .title3 : .body)
                            .padding(isIPad ? 20 : 15)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.08))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                userGuessHENUF3958F35JF035.isEmpty ?
                                                Color.white.opacity(0.1) :
                                                (answerCheckedHENUF3958F35JF035 ? Color.gray.opacity(0.3) : Color.green.opacity(0.5)),
                                                lineWidth: userGuessHENUF3958F35JF035.isEmpty ? 1 : 2
                                            )
                                    )
                            )
                            .foregroundColor(answerCheckedHENUF3958F35JF035 ? .white.opacity(0.6) : .white)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .focused($isTextFieldFocusedHENUF3958F35JF035)
                            .disabled(answerCheckedHENUF3958F35JF035)
                            .onSubmit {
                                if !userGuessHENUF3958F35JF035.isEmpty && !answerCheckedHENUF3958F35JF035 {
                                    withAnimation {
                                        checkAnswerHENUF3958F35JF035()
                                        resultAnimationHENUF3958F35JF035 = true
                                    }
                                    hideKeyboard()
                                }
                            }
                            .padding(.horizontal, isIPad ? 40 : 20)
                        
                        // Submit button
                        Button(action: {
                            hideKeyboard()
                            if !answerCheckedHENUF3958F35JF035 {
                                withAnimation {
                                    checkAnswerHENUF3958F35JF035()
                                    resultAnimationHENUF3958F35JF035 = true
                                }
                            }
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.title3)
                                Text("Check")
                                    .font(isIPad ? .title2 : .title3)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: isIPad ? 800 : .infinity)
                            .padding(isIPad ? 20 : 15)
                            .background(submitButtonBackgroundHENUF3958F35JF035(isEmpty: userGuessHENUF3958F35JF035.isEmpty || answerCheckedHENUF3958F35JF035))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(submitButtonBorderColorHENUF3958F35JF035(isEmpty: userGuessHENUF3958F35JF035.isEmpty || answerCheckedHENUF3958F35JF035), lineWidth: (userGuessHENUF3958F35JF035.isEmpty || answerCheckedHENUF3958F35JF035) ? 1 : 2)
                            )
                            .cornerRadius(15)
                        }
                        .disabled(userGuessHENUF3958F35JF035.isEmpty || answerCheckedHENUF3958F35JF035)
                        .padding(.horizontal, isIPad ? 40 : 20)
                    }
                    
                    // Result Card
                    if showResultHENUF3958F35JF035 {
                        ResultCardHENUF3958F35JF035(
                            isCorrectHENUF3958F35JF035: isCorrectHENUF3958F35JF035,
                            correctAnswerHENUF3958F35JF035: currentWord.wordHENUF3958F35JF035,
                            isIPad: isIPad,
                            animationHENUF3958F35JF035: resultAnimationHENUF3958F35JF035
                        )
                        .padding(.horizontal, isIPad ? 40 : 20)
                        .transition(.scale.combined(with: .opacity))
                        
                        Button(action: {
                            nextWordHENUF3958F35JF035()
                        }) {
                            HStack {
                                Text("Next Word")
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.title3)
                            }
                            .font(isIPad ? .title2 : .title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: isIPad ? 800 : .infinity)
                            .padding(isIPad ? 20 : 15)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.blue.opacity(0.6), lineWidth: 2)
                            )
                            .cornerRadius(15)
                        }
                        .padding(.horizontal, isIPad ? 40 : 20)
                    }
                }
                .frame(maxWidth: isIPad ? 800 : .infinity)
                .padding(.vertical, 20)
            }
            .frame(maxWidth: isIPad ? 800 : .infinity)
            Spacer()
        }
        .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        hideKeyboard()
                    }
            )
        }
    
    
    var gameOverViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPad ? 40 : 30) {
                Text("Game Over!")
                    .font(isIPad ? .system(size: 50) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Your score: \(scoreHENUF3958F35JF035)/\(wordQuestionsHENUF3958F35JF035.count)")
                    .font(isIPad ? .title : .title2)
                    .foregroundColor(.white)
                
                Button(action: {
                    resetGameHENUF3958F35JF035()
                }) {
                    Text("Play Again")
                        .font(isIPad ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPad ? 400 : 300)
                        .padding(isIPad ? 20 : 15)
                        .background(Color.white.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPad ? 20 : 15)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                        .cornerRadius(isIPad ? 20 : 15)
                }
                .padding(.top, isIPad ? 20 : 10)
            }
            .frame(maxWidth: isIPad ? 800 : .infinity)
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Зберігаємо статистику при завершенні гри
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.saveHENUF3958F35JF035()
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
                            endRadius: isIPad ? 250 : 180
                        )
                    )
                    .frame(width: isIPad ? 500 : 360, height: isIPad ? 500 : 360)
                    .offset(
                        x: staticOffsetXHENUF3958F35JF035(for: index),
                        y: staticOffsetY(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffset: CGFloat = isIPad ? 200 : 150
        
        switch index {
        case 0:
            // Верхній лівий кут
            return -baseOffset
        case 1:
            // Нижній правий кут
            return baseOffset
        default:
            // Центр
            return 0
        }
    }
    
    func staticOffsetY(for index: Int) -> CGFloat {
        let baseOffset: CGFloat = isIPad ? 200 : 150
        
        switch index {
        case 0:
            // Верхній лівий кут
            return -baseOffset
        case 1:
            // Нижній правий кут
            return baseOffset
        default:
            // Центр
            return 0
        }
    }
    
    struct HintCardHENUF3958F35JF035: View {
        let hintHENUF3958F35JF035: String
        let numberHENUF3958F35JF035: Int
        let isIPad: Bool
        let animation: Bool
        
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
                // Number badge
                ZStack {
                    Circle()
                        .fill(
                            numberHENUF3958F35JF035 == 1 ?
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ) :
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange.opacity(0.3), Color.orange.opacity(0.1)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPad ? 50 : 40, height: isIPad ? 50 : 40)
                    
                    Text("\(numberHENUF3958F35JF035)")
                        .font(isIPad ? .title2 : .title3)
                        .fontWeight(.bold)
                        .foregroundColor(numberHENUF3958F35JF035 == 1 ? .blue : .orange)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "sparkles")
                            .font(.caption)
                            .foregroundColor(numberHENUF3958F35JF035 == 1 ? .blue : .orange)
                        Text("Hint \(numberHENUF3958F35JF035)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Text(hintHENUF3958F35JF035)
                        .font(isIPad ? .body : .callout)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
            }
            .padding(isIPad ? 20 : 15)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(
                                numberHENUF3958F35JF035 == 1 ?
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue.opacity(0.2)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ) :
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.orange.opacity(0.2)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
            )
            .scaleEffect(animation ? 1.0 : 0.9)
            .opacity(animation ? 1.0 : 0.0)
        }
    }
    
    struct HintButtonHENUF3958F35JF035: View {
        let numberHENUF3958F35JF035: Int
        let iconHENUF3958F35JF035: String
        let colorHENUF3958F35JF035: Color
        let isIPad: Bool
        let action: () -> Void
        
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
            Button(action: action) {
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(colorHENUF3958F35JF035.opacity(0.2))
                            .frame(width: isIPad ? 50 : 40, height: isIPad ? 50 : 40)
                        
                        Image(systemName: iconHENUF3958F35JF035)
                            .font(isIPad ? .title3 : .body)
                            .foregroundColor(colorHENUF3958F35JF035)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Hint \(numberHENUF3958F35JF035)")
                            .font(isIPad ? .body : .callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Tap to reveal")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(colorHENUF3958F35JF035.opacity(0.7))
                }
                .padding(isIPad ? 20 : 15)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(colorHENUF3958F35JF035.opacity(0.3), lineWidth: 1)
                        )
                )
            }
        }
    }
    
    struct ResultCardHENUF3958F35JF035: View {
        let isCorrectHENUF3958F35JF035: Bool
        let correctAnswerHENUF3958F35JF035: String
        let isIPad: Bool
        let animationHENUF3958F35JF035: Bool
        
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
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: isCorrectHENUF3958F35JF035 ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.system(size: isIPad ? 50 : 40))
                        .foregroundColor(isCorrectHENUF3958F35JF035 ? .green : .red)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(isCorrectHENUF3958F35JF035 ? "Correct!" : "Incorrect")
                            .font(isIPad ? .title : .title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        if !isCorrectHENUF3958F35JF035 {
                            Text("Correct answer:")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                            Text(correctAnswerHENUF3958F35JF035)
                                .font(isIPad ? .title2 : .title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(isIPad ? 25 : 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        isCorrectHENUF3958F35JF035 ?
                        Color.green.opacity(0.15) :
                        Color.red.opacity(0.15)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                isCorrectHENUF3958F35JF035 ?
                                Color.green.opacity(0.6) :
                                Color.red.opacity(0.6),
                                lineWidth: 2
                            )
                    )
            )
            .scaleEffect(animationHENUF3958F35JF035 ? 1.0 : 0.8)
            .opacity(animationHENUF3958F35JF035 ? 1.0 : 0.0)
        }
    }
    
    func startGameHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        wordQuestionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomWordQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 20)
        currentIndexHENUF3958F35JF035 = 0
        scoreHENUF3958F35JF035 = 0
        resetRoundHENUF3958F35JF035()
    }
    
    func checkAnswerHENUF3958F35JF035() {
        // Перевіряємо, чи вже була перевірена відповідь для цього слова
        guard !answerCheckedHENUF3958F35JF035 else { return }
        
        let currentWord = wordQuestionsHENUF3958F35JF035[currentIndexHENUF3958F35JF035]
        let normalizedGuess = userGuessHENUF3958F35JF035.lowercased().trimmingCharacters(in: .whitespaces)
        let normalizedAnswer = currentWord.wordHENUF3958F35JF035.lowercased().trimmingCharacters(in: .whitespaces)
        
        isCorrectHENUF3958F35JF035 = normalizedGuess == normalizedAnswer
        
        if isCorrectHENUF3958F35JF035 {
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
            scoreHENUF3958F35JF035 += 1
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.wordsGuessedHENUF3958F35JF035 += 1
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.saveHENUF3958F35JF035()
        } else {
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .error)
        }
        
        answerCheckedHENUF3958F35JF035 = true
        showResultHENUF3958F35JF035 = true
    }
    
    func nextWordHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.selectionHENUF3958F35JF035()
        currentIndexHENUF3958F35JF035 += 1
        resetRoundHENUF3958F35JF035()
    }
    
    func resetRoundHENUF3958F35JF035() {
        userGuessHENUF3958F35JF035 = ""
        showHint1HENUF3958F35JF035 = false
        showHint2HENUF3958F35JF035 = false
        showResultHENUF3958F35JF035 = false
        isCorrectHENUF3958F35JF035 = false
        hint1AnimationHENUF3958F35JF035 = false
        hint2AnimationHENUF3958F35JF035 = false
        resultAnimationHENUF3958F35JF035 = false
        answerCheckedHENUF3958F35JF035 = false // Скидаємо прапорець при переході до наступного слова
    }
    
    func resetGameHENUF3958F35JF035() {
        wordQuestionsHENUF3958F35JF035 = []
        currentIndexHENUF3958F35JF035 = 0
        scoreHENUF3958F35JF035 = 0
        resetRoundHENUF3958F35JF035()
    }
    
    @ViewBuilder
    private func submitButtonBackgroundHENUF3958F35JF035(isEmpty: Bool) -> some View {
        if isEmpty {
            Color.white.opacity(0.05)
        } else {
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
    
    private func submitButtonBorderColorHENUF3958F35JF035(isEmpty: Bool) -> Color {
        isEmpty ? Color.white.opacity(0.1) : Color.green.opacity(0.6)
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    WordGuessingViewHENUF3958F35JF035()
}

