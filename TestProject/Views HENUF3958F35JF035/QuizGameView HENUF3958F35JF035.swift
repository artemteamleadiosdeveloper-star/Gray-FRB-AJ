//
//  QuizGameView.swift


import SwiftUI

struct QuizGameViewHENUF3958F35JF035: View {
    @StateObject private var gameStateHENUF3958F35JF035 = GameStateHENUF3958F35JF035()
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    @State private var questionsHENUF3958F35JF035: [QuestionHENUF3958F35JF035] = []
    @State private var showModeSelectionHENUF3958F35JF035 = true
    @State private var showResultHENUF3958F35JF035 = false
    @State private var player1NameHENUF3958F35JF035 = "Player 1"
    @State private var player2NameHENUF3958F35JF035 = "Player 2"
    @State private var showTwoPlayerResultHENUF3958F35JF035 = false
    @State private var showPlayerNamesInputHENUF3958F35JF035 = false
    @State private var showCountdownHENUF3958F35JF035 = false
    @State private var countdownHENUF3958F35JF035 = 3
    @State private var countdownScaleHENUF3958F35JF035: CGFloat = 0.5
    @State private var countdownOpacityHENUF3958F35JF035: Double = 0.0
    @FocusState private var isPlayer1FocusedHENUF3958F35JF035: Bool
    @FocusState private var isPlayer2FocusedHENUF3958F35JF035: Bool
    @Environment(\.dismiss) private var dismissHENUF3958F35JF035
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    // Таймер та статистика
    @State private var questionStartTimeHENUF3958F35JF035: Date?
    @State private var answerTimesHENUF3958F35JF035: [TimeInterval] = []
    @State private var totalGameTimeHENUF3958F35JF035: TimeInterval = 0
    @State private var gameStartTimeHENUF3958F35JF035: Date?
    @State private var timerHENUF3958F35JF035: Timer?
    @State private var countdownTimerHENUF3958F35JF035: Timer?
    @State private var currentElapsedTimeHENUF3958F35JF035: TimeInterval = 0
    
    // Time Attack mode
    @State private var timeAttackTimerHENUF3958F35JF035: Timer?
    @State private var timeRemainingHENUF3958F35JF035: Int = 10
    @State private var timeAttackScoreHENUF3958F35JF035: Int = 0
    @State private var timeAttackCorrectHENUF3958F35JF035: Int = 0
    @State private var timeAttackWrongHENUF3958F35JF035: Int = 0
    @State private var timeAttackQuestionsHENUF3958F35JF035: [QuestionHENUF3958F35JF035] = []
    @State private var timeAttackCurrentIndexHENUF3958F35JF035: Int = 0
    
    let selectedModeHENUF3958F35JF035: GameModeHENUF3958F35JF035?
    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    init(selectedModeHENUF3958F35JF035: GameModeHENUF3958F35JF035? = nil) {
        self.selectedModeHENUF3958F35JF035 = selectedModeHENUF3958F35JF035
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
                        x: staticOffsetX(for: index),
                        y: staticOffsetY(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetX(for index: Int) -> CGFloat {
        let baseOffset: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        
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
        let baseOffset: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        
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
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            if showModeSelectionHENUF3958F35JF035 {
                modeSelectionViewHENUF3958F35JF035
            } else if showPlayerNamesInputHENUF3958F35JF035 {
                playerNamesInputViewHENUF3958F35JF035
            } else if showCountdownHENUF3958F35JF035 {
                countdownViewHENUF3958F35JF035
            } else if showTwoPlayerResultHENUF3958F35JF035 {
                twoPlayerResultViewHENUF3958F35JF035
            } else if gameStateHENUF3958F35JF035.isGameOverHENUF3958F35JF035 {
                gameOverViewHENUF3958F35JF035
            } else if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .timeAttackHENUF3958F35JF035 {
                timeAttackViewHENUF3958F35JF035
            } else if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
                if gameStateHENUF3958F35JF035.player1QuestionsHENUF3958F35JF035.isEmpty || gameStateHENUF3958F35JF035.player2QuestionsHENUF3958F35JF035.isEmpty {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    gameViewHENUF3958F35JF035
                }
            } else if questionsHENUF3958F35JF035.isEmpty {
                ProgressView("Завантаження...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                gameViewHENUF3958F35JF035
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let modeHENUF3958F35JF035 = selectedModeHENUF3958F35JF035 {
                DispatchQueue.main.async {
                    switch modeHENUF3958F35JF035 {
                    case .singlePlayerHENUF3958F35JF035:
                        startSinglePlayerGameHENUF3958F35JF035()
                case .twoPlayerHENUF3958F35JF035:
                    openPlayerNamesInputHENUF3958F35JF035()
                    case .aiPlayerHENUF3958F35JF035:
                        startAIGameHENUF3958F35JF035()
                    case .timeAttackHENUF3958F35JF035:
                        startTimeAttackGameHENUF3958F35JF035()
                    }
                }
            }
        }
        .onDisappear {
            stopCountdownTimerHENUF3958F35JF035()
            stopTimeAttackTimerHENUF3958F35JF035()
        }
    }
    
    var modeSelectionViewHENUF3958F35JF035: some View {
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
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "person.fill",
                                    titleHENUF3958F35JF035: "Single Player",
                                    subtitleHENUF3958F35JF035: "3 lives, 15 questions",
                                    actionHENUF3958F35JF035: startSinglePlayerGameHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
                                
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "person.2.fill",
                                    titleHENUF3958F35JF035: "Two Player",
                                    subtitleHENUF3958F35JF035: "10 questions each",
                                    actionHENUF3958F35JF035: openPlayerNamesInputHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
                                
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "brain.head.profile",
                                    titleHENUF3958F35JF035: "AI Player",
                                    subtitleHENUF3958F35JF035: "AI answers randomly",
                                    actionHENUF3958F35JF035: startAIGameHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
                            }
                            .frame(maxWidth: .infinity)
                        } else {
                            VStack(spacing: 30) {
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "person.fill",
                                    titleHENUF3958F35JF035: "Single Player",
                                    subtitleHENUF3958F35JF035: "3 lives, 15 questions",
                                    actionHENUF3958F35JF035: startSinglePlayerGameHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
                                
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "person.2.fill",
                                    titleHENUF3958F35JF035: "Two Player",
                                    subtitleHENUF3958F35JF035: "10 questions each",
                                    actionHENUF3958F35JF035: openPlayerNamesInputHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
                                
                                modeButtonHENUF3958F35JF035(
                                    iconHENUF3958F35JF035: "brain.head.profile",
                                    titleHENUF3958F35JF035: "AI Player",
                                    subtitleHENUF3958F35JF035: "AI answers randomly",
                                    actionHENUF3958F35JF035: startAIGameHENUF3958F35JF035,
                                    isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                                )
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
    }
    
    func modeButtonHENUF3958F35JF035(iconHENUF3958F35JF035: String, titleHENUF3958F35JF035: String, subtitleHENUF3958F35JF035: String, actionHENUF3958F35JF035: @escaping () -> Void, isIPadHENUF3958F35JF035: Bool) -> some View {
        let iconColorHENUF3958F35JF035: Color = {
            switch iconHENUF3958F35JF035 {
            case "person.fill":
                return .blue
            case "person.2.fill":
                return .green
            case "brain.head.profile":
                return .purple
            default:
                return .white
            }
        }()
        
        return Button(action: actionHENUF3958F35JF035) {
            VStack(spacing: isIPadHENUF3958F35JF035 ? 15 : 10) {
                Image(systemName: iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 60 : 50))
                    .foregroundColor(iconColorHENUF3958F35JF035)
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
    
    var gameViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            ScrollView {
                VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    // Header
                    HStack {
                        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 {
                            HStack {
                                ForEach(0..<3) { index in
                                    Image(systemName: index < gameStateHENUF3958F35JF035.livesHENUF3958F35JF035 ? "heart.fill" : "heart")
                                        .font(.system(size: isIPadHENUF3958F35JF035 ? 30 : 24))
                                        .foregroundColor(.red)
                                }
                            }
                        } else if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
                            Text(gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 ? player1NameHENUF3958F35JF035 : player2NameHENUF3958F35JF035)
                                .font(isIPadHENUF3958F35JF035 ? .system(size: 32, weight: .bold) : .system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 20 : 15)
                                .padding(.vertical, isIPadHENUF3958F35JF035 ? 12 : 10)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 ? Color.blue.opacity(0.8) : Color.green.opacity(0.8),
                                            gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 ? Color.purple.opacity(0.6) : Color.blue.opacity(0.6)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 12)
                                .shadow(color: (gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 ? Color.blue : Color.green).opacity(0.5), radius: 10, x: 0, y: 5)
                        } else {
                            HStack {
                                Text("You: \(gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035)")
                                Text("AI: \(gameStateHENUF3958F35JF035.aiScoreHENUF3958F35JF035)")
                            }
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .body)
                            .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("Question \(currentQuestionIndex + 1)/\(totalQuestionsHENUF3958F35JF035)")
                                .font(isIPadHENUF3958F35JF035 ? .title2 : .body)
                                .foregroundColor(.white)
                            
                            // Таймер
                            if questionStartTimeHENUF3958F35JF035 != nil {
                                HStack(spacing: 5) {
                                    Image(systemName: "timer")
                                        .font(.caption)
                                        .foregroundColor(.yellow)
                                    Text(formatTimeHENUF3958F35JF035(currentElapsedTimeHENUF3958F35JF035))
                                        .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.yellow)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.yellow.opacity(0.2))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                    
                    // Question
                    let currentQHENUF3958F35JF035 = currentQuestionHENUF3958F35JF035
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                        Text(currentQHENUF3958F35JF035.questionHENUF3958F35JF035)
                            .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
                            )
                            .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        
                        // Answers
                        VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                            ForEach(0..<currentQHENUF3958F35JF035.answersHENUF3958F35JF035.count, id: \.self) { indexHENUF3958F35JF035 in
                                answerButtonHENUF3958F35JF035(forHENUF3958F35JF035: indexHENUF3958F35JF035, questionHENUF3958F35JF035: currentQHENUF3958F35JF035, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(isIPadHENUF3958F35JF035 ? 40 : 20)
                    
                    if gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 != nil {
                        Button(action: {
                            nextQuestion()
                        }) {
                            Text("Next")
                                .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(isIPadHENUF3958F35JF035 ? 25 : 15)
                                .background(Color.white.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                                .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        }
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 20)
                    }
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
        .onAppear {
            // Запускаємо таймер для першого питання, якщо він ще не запущений
            if questionStartTimeHENUF3958F35JF035 == nil {
                questionStartTimeHENUF3958F35JF035 = Date()
            }
            if gameStartTimeHENUF3958F35JF035 == nil {
                gameStartTimeHENUF3958F35JF035 = Date()
            }
            
            // Запускаємо таймер для оновлення відображення
            startTimerHENUF3958F35JF035()
        }
        .onDisappear {
            stopTimerHENUF3958F35JF035()
        }
    }
    
    func startTimerHENUF3958F35JF035() {
        timerHENUF3958F35JF035?.invalidate()
        timerHENUF3958F35JF035 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let startTimeHENUF3958F35JF035 = questionStartTimeHENUF3958F35JF035 {
                currentElapsedTimeHENUF3958F35JF035 = Date().timeIntervalSince(startTimeHENUF3958F35JF035)
            }
        }
    }
    
    func stopTimerHENUF3958F35JF035() {
        timerHENUF3958F35JF035?.invalidate()
        timerHENUF3958F35JF035 = nil
    }
    
    func stopCountdownTimerHENUF3958F35JF035() {
        countdownTimerHENUF3958F35JF035?.invalidate()
        countdownTimerHENUF3958F35JF035 = nil
    }
    
    func startCountdownHENUF3958F35JF035(completionHENUF3958F35JF035: @escaping () -> Void) {
        stopCountdownTimerHENUF3958F35JF035()
        countdownHENUF3958F35JF035 = 3
        countdownScaleHENUF3958F35JF035 = 0.5
        countdownOpacityHENUF3958F35JF035 = 0.0
        
        // Анімація появи першої цифри
        withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
            countdownScaleHENUF3958F35JF035 = 1.0
            countdownOpacityHENUF3958F35JF035 = 1.0
        }
        
        // Вібрація для початкового відліку (3)
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        
        countdownTimerHENUF3958F35JF035 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timerHENUF3958F35JF035 in
            if countdownHENUF3958F35JF035 > 1 {
                // Анімація зникнення
                withAnimation(.easeOut(duration: 0.2)) {
                    countdownScaleHENUF3958F35JF035 = 0.3
                    countdownOpacityHENUF3958F35JF035 = 0.0
                }
                
                // Зміна цифри
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    countdownHENUF3958F35JF035 -= 1
                    // Вібрація при зміні цифри
                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
                    // Анімація появи нової цифри
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                        countdownScaleHENUF3958F35JF035 = 1.0
                        countdownOpacityHENUF3958F35JF035 = 1.0
                    }
                }
            } else {
                // Остання секунда - показуємо "Старт!"
                withAnimation(.easeOut(duration: 0.2)) {
                    countdownScaleHENUF3958F35JF035 = 0.3
                    countdownOpacityHENUF3958F35JF035 = 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .heavy)
                    timerHENUF3958F35JF035.invalidate()
                    countdownTimerHENUF3958F35JF035 = nil
                    completionHENUF3958F35JF035()
                }
            }
        }
    }
    
    var countdownViewHENUF3958F35JF035: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            // Додаткові кольорові кола для відліку
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                countdownColorHENUF3958F35JF035.opacity(0.15),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: isIPadHENUF3958F35JF035 ? 200 : 150
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 400 : 300, height: isIPadHENUF3958F35JF035 ? 400 : 300)
                    .offset(
                        x: index == 0 ? -100 : (index == 1 ? 100 : 0),
                        y: index == 0 ? -100 : (index == 1 ? 100 : 0)
                    )
                    .blur(radius: 20)
                    .opacity(0.3)
            }
            
            VStack(spacing: isIPadHENUF3958F35JF035 ? 50 : 40) {
                // Круговий індикатор прогресу
                ZStack {
                    // Фоновий круг
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: isIPadHENUF3958F35JF035 ? 8 : 6)
                        .frame(width: isIPadHENUF3958F35JF035 ? 200 : 150, height: isIPadHENUF3958F35JF035 ? 200 : 150)
                    
                    // Прогресивний круг
                    Circle()
                        .trim(from: 0, to: CGFloat(4 - countdownHENUF3958F35JF035) / 3.0)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [countdownColorHENUF3958F35JF035, countdownColorHENUF3958F35JF035.opacity(0.5)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: isIPadHENUF3958F35JF035 ? 8 : 6, lineCap: .round)
                        )
                        .frame(width: isIPadHENUF3958F35JF035 ? 200 : 150, height: isIPadHENUF3958F35JF035 ? 200 : 150)
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 1.0), value: countdownHENUF3958F35JF035)
                    
                    // Велика цифра
                    Text("\(countdownHENUF3958F35JF035)")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 120 : 90, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    countdownColorHENUF3958F35JF035,
                                    countdownColorHENUF3958F35JF035.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(countdownScaleHENUF3958F35JF035)
                        .opacity(countdownOpacityHENUF3958F35JF035)
                        .shadow(color: countdownColorHENUF3958F35JF035.opacity(0.8), radius: 20, x: 0, y: 0)
                        .shadow(color: countdownColorHENUF3958F35JF035.opacity(0.4), radius: 40, x: 0, y: 0)
                }
                
                // Текст
                Text(countdownTextHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.9),
                                Color.white.opacity(0.6)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .opacity(countdownOpacityHENUF3958F35JF035)
                    .offset(y: countdownScaleHENUF3958F35JF035 < 0.8 ? 20 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7), value: countdownScaleHENUF3958F35JF035)
            }
        }
    }
    
    private var countdownColorHENUF3958F35JF035: Color {
        switch countdownHENUF3958F35JF035 {
        case 3:
            return Color.blue
        case 2:
            return Color.orange
        case 1:
            return Color.green
        default:
            return Color.white
        }
    }
    
    private var countdownTextHENUF3958F35JF035: String {
        switch countdownHENUF3958F35JF035 {
        case 3:
            return "Get ready..."
        case 2:
            return "Almost there..."
        case 1:
            return "Game starting..."
        default:
            return "Let's go!"
        }
    }
    
    var gameOverViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            ScrollView {
                VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                // Заголовок
                VStack(spacing: 10) {
                    Image(systemName: gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035 > 0 ? "trophy.fill" : "xmark.circle.fill")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 80 : 60))
                        .foregroundColor(gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035 > 0 ? .yellow : .red)
                    
                    Text("Game Over!")
                        .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                
                // Статистика
                VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                    // Рахунок
                    StatisticCardHENUF3958F35JF035(
                        iconHENUF3958F35JF035: "star.fill",
                        titleHENUF3958F35JF035: "Score",
                        valueHENUF3958F35JF035: "\(gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035)",
                        colorHENUF3958F35JF035: .yellow,
                        isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                    )
                    
                    // Загальний час
                    if let startTimeHENUF3958F35JF035 = gameStartTimeHENUF3958F35JF035 {
                        let totalTimeHENUF3958F35JF035 = Date().timeIntervalSince(startTimeHENUF3958F35JF035)
                        StatisticCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "clock.fill",
                            titleHENUF3958F35JF035: "Total Time",
                            valueHENUF3958F35JF035: formatTimeHENUF3958F35JF035(totalTimeHENUF3958F35JF035),
                            colorHENUF3958F35JF035: .blue,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                        
                    }
                    
                    // Середній час відповіді
                    if !answerTimesHENUF3958F35JF035.isEmpty {
                        let averageTimeHENUF3958F35JF035 = answerTimesHENUF3958F35JF035.reduce(0, +) / Double(answerTimesHENUF3958F35JF035.count)
                        StatisticCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "timer",
                            titleHENUF3958F35JF035: "Average Answer Time",
                            valueHENUF3958F35JF035: formatTimeHENUF3958F35JF035(averageTimeHENUF3958F35JF035),
                            colorHENUF3958F35JF035: .green,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                    }
                    
                    // Кількість правильних відповідей
                    let correctAnswersHENUF3958F35JF035 = gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035
                    let totalQuestionsHENUF3958F35JF035 = gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 ? 15 : (gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .aiPlayerHENUF3958F35JF035 ? 15 : 10)
                    let accuracyHENUF3958F35JF035 = totalQuestionsHENUF3958F35JF035 > 0 ? Double(correctAnswersHENUF3958F35JF035) / Double(totalQuestionsHENUF3958F35JF035) * 100 : 0
                    
                    StatisticCardHENUF3958F35JF035(
                        iconHENUF3958F35JF035: "checkmark.circle.fill",
                        titleHENUF3958F35JF035: "Accuracy",
                        valueHENUF3958F35JF035: String(format: "%.1f%%", accuracyHENUF3958F35JF035),
                        colorHENUF3958F35JF035: .purple,
                        isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                    )
                    
                    // Новий рекорд
                    if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 && gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035 > appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035 {
                        HStack {
                            Image(systemName: "sparkles")
                                .font(.title2)
                                .foregroundColor(.yellow)
                            Text("New Record!")
                                .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        }
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.yellow.opacity(0.2), Color.orange.opacity(0.2)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                .stroke(Color.yellow.opacity(0.5), lineWidth: 2)
                        )
                    }
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                // Кнопка
                Button(action: {
                    dismissHENUF3958F35JF035()
                }) {
                    HStack(spacing: 15) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                        Text("Back")
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .fontWeight(.semibold)
                    }
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
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 30 : 20)
                .padding(.bottom, isIPadHENUF3958F35JF035 ? 40 : 30)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                .padding()
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
    }
    
    struct StatisticCardHENUF3958F35JF035: View {
        let iconHENUF3958F35JF035: String
        let titleHENUF3958F35JF035: String
        let valueHENUF3958F35JF035: String
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
            HStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                Image(systemName: iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 35 : 28))
                    .foregroundColor(colorHENUF3958F35JF035)
                    .frame(width: isIPadHENUF3958F35JF035 ? 60 : 50)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(titleHENUF3958F35JF035)
                        .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                        .foregroundColor(.white.opacity(0.7))
                    Text(valueHENUF3958F35JF035)
                        .font(isIPadHENUF3958F35JF035 ? .system(size: 32, weight: .bold) : .system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(isIPadHENUF3958F35JF035 ? 25 : 20)
            .background(Color.white.opacity(0.05))
            .overlay(
                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                    .stroke(colorHENUF3958F35JF035.opacity(0.3), lineWidth: 1.5)
            )
            .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
        }
    }
    
    func formatTimeHENUF3958F35JF035(_ timeHENUF3958F35JF035: TimeInterval) -> String {
        if timeHENUF3958F35JF035 < 60 {
            return String(format: "%.1fс", timeHENUF3958F35JF035)
        } else {
            let minutesHENUF3958F35JF035 = Int(timeHENUF3958F35JF035) / 60
            let secondsHENUF3958F35JF035 = Int(timeHENUF3958F35JF035) % 60
            return String(format: "%d:%02d", minutesHENUF3958F35JF035, secondsHENUF3958F35JF035)
        }
    }
    
    var playerNamesInputViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            ScrollView {
                VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Text("Enter Player Names")
                    .font(isIPadHENUF3958F35JF035 ? .system(size: 40) : .largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                
                VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Player 1")
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .foregroundColor(.white.opacity(0.7))
                        
                        TextField("Enter name", text: $player1NameHENUF3958F35JF035)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                            .background(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
                            )
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .focused($isPlayer1FocusedHENUF3958F35JF035)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Player 2")
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .foregroundColor(.white.opacity(0.7))
                        
                        TextField("Enter name", text: $player2NameHENUF3958F35JF035)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                            .background(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
                            )
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .focused($isPlayer2FocusedHENUF3958F35JF035)
                    }
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                Button(action: {
                    if player1NameHENUF3958F35JF035.trimmingCharacters(in: .whitespaces).isEmpty {
                        player1NameHENUF3958F35JF035 = "Player 1"
                    }
                    if player2NameHENUF3958F35JF035.trimmingCharacters(in: .whitespaces).isEmpty {
                        player2NameHENUF3958F35JF035 = "Player 2"
                    }
                    startTwoPlayerGameHENUF3958F35JF035()
                }) {
                    Text("Start Game")
                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 400 : 300)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.6)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                .padding()
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
    }
    
    var twoPlayerResultViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            ScrollView {
                VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                // Заголовок
                VStack(spacing: 10) {
                    Image(systemName: "trophy.fill")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 80 : 60))
                        .foregroundColor(.yellow)
                    
                    Text("Results")
                        .font(isIPadHENUF3958F35JF035 ? .system(size: 50) : .largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 40 : 20)
                
                // Результати гравців
                HStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    // Player 1
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                        Text(player1NameHENUF3958F35JF035)
                            .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("\(gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035)")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 70 : 50, weight: .bold))
                            .foregroundColor(.blue)
                        
                        if gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 {
                            Image(systemName: "crown.fill")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 40 : 30))
                                .foregroundColor(.yellow)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 ? Color.blue.opacity(0.3) : Color.blue.opacity(0.15),
                                Color.blue.opacity(0.05)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                            .stroke(
                                gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 ? Color.blue.opacity(0.6) : Color.blue.opacity(0.3),
                                lineWidth: gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 ? 2 : 1
                            )
                    )
                    .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                    
                    // Player 2
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                        Text(player2NameHENUF3958F35JF035)
                            .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("\(gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035)")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 70 : 50, weight: .bold))
                            .foregroundColor(.green)
                        
                        if gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 {
                            Image(systemName: "crown.fill")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 40 : 30))
                                .foregroundColor(.yellow)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 ? Color.green.opacity(0.3) : Color.green.opacity(0.15),
                                Color.green.opacity(0.05)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                            .stroke(
                                gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 ? Color.green.opacity(0.6) : Color.green.opacity(0.3),
                                lineWidth: gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 ? 2 : 1
                            )
                    )
                    .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                
                // Winner message
                if gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 {
                    Text("\(player1NameHENUF3958F35JF035) wins!")
                        .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                .stroke(Color.yellow.opacity(0.5), lineWidth: 2)
                        )
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                } else if gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 > gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 {
                    Text("\(player2NameHENUF3958F35JF035) wins!")
                        .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                .stroke(Color.yellow.opacity(0.5), lineWidth: 2)
                        )
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                } else {
                    Text("Draw!")
                        .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        )
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                }
                
                // Статистика
                VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                    // Загальний час
                    if let startTimeHENUF3958F35JF035 = gameStartTimeHENUF3958F35JF035 {
                        let totalTimeHENUF3958F35JF035 = Date().timeIntervalSince(startTimeHENUF3958F35JF035)
                        StatisticCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "clock.fill",
                            titleHENUF3958F35JF035: "Total Time",
                            valueHENUF3958F35JF035: formatTimeHENUF3958F35JF035(totalTimeHENUF3958F35JF035),
                            colorHENUF3958F35JF035: .blue,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                    }
                    
                    // Середній час відповіді
                    if !answerTimesHENUF3958F35JF035.isEmpty {
                        let averageTimeHENUF3958F35JF035 = answerTimesHENUF3958F35JF035.reduce(0, +) / Double(answerTimesHENUF3958F35JF035.count)
                        StatisticCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "timer",
                            titleHENUF3958F35JF035: "Average Answer Time",
                            valueHENUF3958F35JF035: formatTimeHENUF3958F35JF035(averageTimeHENUF3958F35JF035),
                            colorHENUF3958F35JF035: .green,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                    }
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 15)
                
                // Кнопка
                Button(action: {
                    dismissHENUF3958F35JF035()
                }) {
                    HStack(spacing: 15) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                        Text("Back")
                            .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                            .fontWeight(.semibold)
                    }
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
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 30 : 20)
                .padding(.bottom, isIPadHENUF3958F35JF035 ? 40 : 30)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                .padding()
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            Spacer()
        }
    }
    
    var currentQuestionHENUF3958F35JF035: QuestionHENUF3958F35JF035 {
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
            // Використовуємо загальний індекс для обох гравців
            let questionIndexHENUF3958F35JF035 = gameStateHENUF3958F35JF035.player1CurrentIndexHENUF3958F35JF035 + gameStateHENUF3958F35JF035.player2CurrentIndexHENUF3958F35JF035
            return gameStateHENUF3958F35JF035.player1QuestionsHENUF3958F35JF035[questionIndexHENUF3958F35JF035]
        }
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .timeAttackHENUF3958F35JF035 {
            return timeAttackQuestionsHENUF3958F35JF035[timeAttackCurrentIndexHENUF3958F35JF035]
        }
        return questionsHENUF3958F35JF035[gameStateHENUF3958F35JF035.currentQuestionIndexHENUF3958F35JF035]
    }
    
    var timeAttackViewHENUF3958F35JF035: some View {
        HStack {
            Spacer()
            VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 25) {
                // Timer and Stats Header
                HStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    // Timer
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 6)
                                .frame(width: isIPadHENUF3958F35JF035 ? 100 : 80, height: isIPadHENUF3958F35JF035 ? 100 : 80)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(timeRemainingHENUF3958F35JF035) / 10.0)
                                .stroke(
                                    timeRemainingHENUF3958F35JF035 <= 3 ? Color.red : Color.orange,
                                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                                )
                                .frame(width: isIPadHENUF3958F35JF035 ? 100 : 80, height: isIPadHENUF3958F35JF035 ? 100 : 80)
                                .rotationEffect(.degrees(-90))
                                .animation(.linear(duration: 1.0), value: timeRemainingHENUF3958F35JF035)
                            
                            Text("\(timeRemainingHENUF3958F35JF035)")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 36 : 28, weight: .bold))
                                .foregroundColor(timeRemainingHENUF3958F35JF035 <= 3 ? .red : .orange)
                        }
                        Text("Seconds")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 14 : 12))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // Stats
                    VStack(alignment: .trailing, spacing: isIPadHENUF3958F35JF035 ? 12 : 10) {
                        HStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("\(timeAttackCorrectHENUF3958F35JF035)")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 12) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                            Text("\(timeAttackWrongHENUF3958F35JF035)")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 12) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(timeAttackScoreHENUF3958F35JF035)")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20, weight: .bold))
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding(isIPadHENUF3958F35JF035 ? 25 : 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
                
                // Question
                if timeAttackCurrentIndexHENUF3958F35JF035 < timeAttackQuestionsHENUF3958F35JF035.count {
                    let currentQHENUF3958F35JF035 = timeAttackQuestionsHENUF3958F35JF035[timeAttackCurrentIndexHENUF3958F35JF035]
                    
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                        Text("Question \(timeAttackCurrentIndexHENUF3958F35JF035 + 1)")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 16))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text(currentQHENUF3958F35JF035.questionHENUF3958F35JF035)
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 22, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                        
                        // Answer buttons
                        VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                            ForEach(0..<4, id: \.self) { indexHENUF3958F35JF035 in
                                Button(action: {
                                    selectAnswerHENUF3958F35JF035(indexHENUF3958F35JF035)
                                }) {
                                    HStack {
                                        Text(currentQHENUF3958F35JF035.answersHENUF3958F35JF035[indexHENUF3958F35JF035])
                                            .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                        
                                        if let selectedHENUF3958F35JF035 = gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035, selectedHENUF3958F35JF035 == indexHENUF3958F35JF035 {
                                            Image(systemName: indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 ? "checkmark.circle.fill" : "xmark.circle.fill")
                                                .foregroundColor(indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 ? .green : .red)
                                                .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                        }
                                    }
                                    .padding(isIPadHENUF3958F35JF035 ? 20 : 16)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(
                                                gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 == indexHENUF3958F35JF035 ?
                                                (indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 ? Color.green.opacity(0.3) : Color.red.opacity(0.3)) :
                                                Color.white.opacity(0.1)
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(
                                                        gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 == indexHENUF3958F35JF035 ?
                                                        (indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 ? Color.green : Color.red) :
                                                        Color.white.opacity(0.2),
                                                        lineWidth: 2
                                                    )
                                            )
                                    )
                                }
                                .disabled(gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 != nil)
                            }
                        }
                    }
                }
                
                // Exit button
                Button(action: {
                    stopTimeAttackTimerHENUF3958F35JF035()
                    dismissHENUF3958F35JF035()
                }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                        Text("Exit")
                    }
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(isIPadHENUF3958F35JF035 ? 18 : 15)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.red.opacity(0.3))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.red.opacity(0.5), lineWidth: 1)
                            )
                    )
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 15)
            }
            .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
            .padding()
            Spacer()
        }
    }
    
    var currentQuestionIndex: Int {
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
            // Загальний індекс для обох гравців
            return gameStateHENUF3958F35JF035.player1CurrentIndexHENUF3958F35JF035 + gameStateHENUF3958F35JF035.player2CurrentIndexHENUF3958F35JF035
        }
        return gameStateHENUF3958F35JF035.currentQuestionIndexHENUF3958F35JF035
    }
    
    var totalQuestionsHENUF3958F35JF035: Int {
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
            return gameStateHENUF3958F35JF035.player1QuestionsHENUF3958F35JF035.count
        }
        return questionsHENUF3958F35JF035.count
    }
    
    func startSinglePlayerGameHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 = .singlePlayerHENUF3958F35JF035
        questionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 15)
        gameStateHENUF3958F35JF035.resetHENUF3958F35JF035()
        showModeSelectionHENUF3958F35JF035 = false
        showCountdownHENUF3958F35JF035 = true
        countdownHENUF3958F35JF035 = 3
        startCountdownHENUF3958F35JF035 {
            self.gameStartTimeHENUF3958F35JF035 = Date()
            self.questionStartTimeHENUF3958F35JF035 = Date()
            self.answerTimesHENUF3958F35JF035 = []
            self.totalGameTimeHENUF3958F35JF035 = 0
            self.showCountdownHENUF3958F35JF035 = false
        }
    }
    
    func openPlayerNamesInputHENUF3958F35JF035() {
        showModeSelectionHENUF3958F35JF035 = false
        showPlayerNamesInputHENUF3958F35JF035 = true
    }
    
    func startTwoPlayerGameHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 = .twoPlayerHENUF3958F35JF035
        // Створюємо один список з 10 питань, які будуть використовуватись по черзі
        let allQuestionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 10)
        gameStateHENUF3958F35JF035.player1QuestionsHENUF3958F35JF035 = allQuestionsHENUF3958F35JF035
        gameStateHENUF3958F35JF035.player2QuestionsHENUF3958F35JF035 = allQuestionsHENUF3958F35JF035
        gameStateHENUF3958F35JF035.resetHENUF3958F35JF035()
        showModeSelectionHENUF3958F35JF035 = false
        showPlayerNamesInputHENUF3958F35JF035 = false
        showCountdownHENUF3958F35JF035 = true
        countdownHENUF3958F35JF035 = 3
        startCountdownHENUF3958F35JF035 {
            self.gameStartTimeHENUF3958F35JF035 = Date()
            self.questionStartTimeHENUF3958F35JF035 = Date()
            self.answerTimesHENUF3958F35JF035 = []
            self.totalGameTimeHENUF3958F35JF035 = 0
            self.showCountdownHENUF3958F35JF035 = false
        }
    }
    
    func startAIGameHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 = .aiPlayerHENUF3958F35JF035
        questionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 15)
        gameStateHENUF3958F35JF035.resetHENUF3958F35JF035()
        // Generate random AI answers
        gameStateHENUF3958F35JF035.aiAnswersHENUF3958F35JF035 = questionsHENUF3958F35JF035.map { _ in Int.random(in: 0..<4) }
        showModeSelectionHENUF3958F35JF035 = false
        showCountdownHENUF3958F35JF035 = true
        countdownHENUF3958F35JF035 = 3
        startCountdownHENUF3958F35JF035 {
            self.gameStartTimeHENUF3958F35JF035 = Date()
            self.questionStartTimeHENUF3958F35JF035 = Date()
            self.answerTimesHENUF3958F35JF035 = []
            self.totalGameTimeHENUF3958F35JF035 = 0
            self.showCountdownHENUF3958F35JF035 = false
        }
    }
    
    func startTimeAttackGameHENUF3958F35JF035() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .medium)
        gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 = .timeAttackHENUF3958F35JF035
        timeAttackQuestionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 50) // Pre-load questions
        timeAttackCurrentIndexHENUF3958F35JF035 = 0
        timeAttackScoreHENUF3958F35JF035 = 0
        timeAttackCorrectHENUF3958F35JF035 = 0
        timeAttackWrongHENUF3958F35JF035 = 0
        timeRemainingHENUF3958F35JF035 = 10
        gameStateHENUF3958F35JF035.resetHENUF3958F35JF035()
        showModeSelectionHENUF3958F35JF035 = false
        showCountdownHENUF3958F35JF035 = true
        countdownHENUF3958F35JF035 = 3
        startCountdownHENUF3958F35JF035 {
            self.showCountdownHENUF3958F35JF035 = false
            self.startTimeAttackTimerHENUF3958F35JF035()
        }
    }
    
    func startTimeAttackTimerHENUF3958F35JF035() {
        stopTimeAttackTimerHENUF3958F35JF035()
        timeRemainingHENUF3958F35JF035 = 10
        gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 = nil
        
        timeAttackTimerHENUF3958F35JF035 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timerHENUF3958F35JF035 in
            if timeRemainingHENUF3958F35JF035 > 0 {
                timeRemainingHENUF3958F35JF035 -= 1
                
                // Haptic feedback when time is running out
                if timeRemainingHENUF3958F35JF035 <= 3 {
                    HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
                }
            } else {
                // Time's up - mark as wrong and move to next question
                stopTimeAttackTimerHENUF3958F35JF035()
                timeAttackWrongHENUF3958F35JF035 += 1
                HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .error)
                
                // Show result briefly, then move to next question
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    nextTimeAttackQuestionHENUF3958F35JF035()
                }
            }
        }
    }
    
    func stopTimeAttackTimerHENUF3958F35JF035() {
        timeAttackTimerHENUF3958F35JF035?.invalidate()
        timeAttackTimerHENUF3958F35JF035 = nil
    }
    
    func nextTimeAttackQuestionHENUF3958F35JF035() {
        timeAttackCurrentIndexHENUF3958F35JF035 += 1
        
        // If we've used all pre-loaded questions, load more
        if timeAttackCurrentIndexHENUF3958F35JF035 >= timeAttackQuestionsHENUF3958F35JF035.count {
            let additionalQuestionsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomQuestionsHENUF3958F35JF035(countHENUF3958F35JF035: 50)
            timeAttackQuestionsHENUF3958F35JF035.append(contentsOf: additionalQuestionsHENUF3958F35JF035)
        }
        
        startTimeAttackTimerHENUF3958F35JF035()
    }
    
    func selectAnswerHENUF3958F35JF035(_ indexHENUF3958F35JF035: Int) {
        // Time Attack mode - stop timer and handle answer
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .timeAttackHENUF3958F35JF035 {
            stopTimeAttackTimerHENUF3958F35JF035()
            gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 = indexHENUF3958F35JF035
            let currentQHENUF3958F35JF035 = timeAttackQuestionsHENUF3958F35JF035[timeAttackCurrentIndexHENUF3958F35JF035]
            
            if indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 {
                HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
                timeAttackCorrectHENUF3958F35JF035 += 1
                timeAttackScoreHENUF3958F35JF035 += 1
            } else {
                HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .error)
                timeAttackWrongHENUF3958F35JF035 += 1
            }
            
            // Move to next question after brief delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                nextTimeAttackQuestionHENUF3958F35JF035()
            }
            return
        }
        
        // Зберігаємо час відповіді
        if let startTime = questionStartTimeHENUF3958F35JF035 {
            let answerTime = Date().timeIntervalSince(startTime)
            answerTimesHENUF3958F35JF035.append(answerTime)
        }
        
        gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 = indexHENUF3958F35JF035
        let currentQHENUF3958F35JF035 = currentQuestionHENUF3958F35JF035
        
        if indexHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 {
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
            if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 {
                gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035 += 1
            } else if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
                if gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 {
                    gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035 += 1
                } else {
                    gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035 += 1
                }
            } else {
                gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035 += 1
            }
        } else {
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .error)
            if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 {
                gameStateHENUF3958F35JF035.livesHENUF3958F35JF035 -= 1
            }
        }
        
        // AI answer
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .aiPlayerHENUF3958F35JF035 {
            let aiAnswerHENUF3958F35JF035 = gameStateHENUF3958F35JF035.aiAnswersHENUF3958F35JF035[gameStateHENUF3958F35JF035.currentQuestionIndexHENUF3958F35JF035]
            if aiAnswerHENUF3958F35JF035 == currentQHENUF3958F35JF035.correctAnswerHENUF3958F35JF035 {
                gameStateHENUF3958F35JF035.aiScoreHENUF3958F35JF035 += 1
            }
        }
    }
    
    func nextQuestion() {
        HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.selectionHENUF3958F35JF035()
        // Запускаємо таймер для наступного питання
        questionStartTimeHENUF3958F35JF035 = Date()
        currentElapsedTimeHENUF3958F35JF035 = 0
        
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 {
            // Оновлюємо індекс поточного гравця
            if gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 {
                gameStateHENUF3958F35JF035.player1CurrentIndexHENUF3958F35JF035 += 1
            } else {
                gameStateHENUF3958F35JF035.player2CurrentIndexHENUF3958F35JF035 += 1
            }
            
            // Перевіряємо, чи гра закінчена
            let totalQuestions = gameStateHENUF3958F35JF035.player1QuestionsHENUF3958F35JF035.count
            let totalAnswered = gameStateHENUF3958F35JF035.player1CurrentIndexHENUF3958F35JF035 + gameStateHENUF3958F35JF035.player2CurrentIndexHENUF3958F35JF035
            
            if totalAnswered >= totalQuestions {
                // Гра закінчена для двох гравців
                stopTimerHENUF3958F35JF035()
                // Зберігаємо час останньої відповіді
                if let startTime = questionStartTimeHENUF3958F35JF035 {
                    let answerTime = Date().timeIntervalSince(startTime)
                    answerTimesHENUF3958F35JF035.append(answerTime)
                }
                updateStatisticsForTwoPlayer()
                showTwoPlayerResultHENUF3958F35JF035 = true
                return
            }
            
            // Переключаємо гравця для наступного питання
            gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 = gameStateHENUF3958F35JF035.currentPlayerHENUF3958F35JF035 == 1 ? 2 : 1
        } else {
            gameStateHENUF3958F35JF035.currentQuestionIndexHENUF3958F35JF035 += 1
            if gameStateHENUF3958F35JF035.currentQuestionIndexHENUF3958F35JF035 >= questionsHENUF3958F35JF035.count || (gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 && gameStateHENUF3958F35JF035.livesHENUF3958F35JF035 <= 0) {
                stopTimerHENUF3958F35JF035()
                // Зберігаємо час останньої відповіді
                if let startTime = questionStartTimeHENUF3958F35JF035 {
                    let answerTime = Date().timeIntervalSince(startTime)
                    answerTimesHENUF3958F35JF035.append(answerTime)
                }
                HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .warning)
                gameStateHENUF3958F35JF035.isGameOverHENUF3958F35JF035 = true
                updateStatistics()
                return
            }
        }
        
        gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 = nil
    }
    
    func resetGame() {
        stopTimerHENUF3958F35JF035()
        stopCountdownTimerHENUF3958F35JF035()
        gameStateHENUF3958F35JF035.resetHENUF3958F35JF035()
        questionsHENUF3958F35JF035 = []
        showModeSelectionHENUF3958F35JF035 = true
        showTwoPlayerResultHENUF3958F35JF035 = false
        showCountdownHENUF3958F35JF035 = false
        countdownHENUF3958F35JF035 = 3
        questionStartTimeHENUF3958F35JF035 = nil
        gameStartTimeHENUF3958F35JF035 = nil
        answerTimesHENUF3958F35JF035 = []
        totalGameTimeHENUF3958F35JF035 = 0
        currentElapsedTimeHENUF3958F35JF035 = 0
    }
    
    func updateStatistics() {
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalGamesHENUF3958F35JF035 += 1
        
        let finalScore: Int
        if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .singlePlayerHENUF3958F35JF035 {
            finalScore = gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035
        } else if gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .aiPlayerHENUF3958F35JF035 {
            finalScore = gameStateHENUF3958F35JF035.scoreHENUF3958F35JF035
        } else {
            finalScore = max(gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035, gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035)
        }
        
        if finalScore > appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035 {
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035 = finalScore
        }
        
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalScoreHENUF3958F35JF035 += finalScore
        
        // Вважаємо перемогою, якщо рахунок >= 10 для singlePlayer/aiPlayer або >= 7 для twoPlayer
        let winThreshold = gameStateHENUF3958F35JF035.gameModeHENUF3958F35JF035 == .twoPlayerHENUF3958F35JF035 ? 7 : 10
        if finalScore >= winThreshold {
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalWinsHENUF3958F35JF035 += 1
        }
        
        // Зберігаємо статистику
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.saveHENUF3958F35JF035()
    }
    
    func updateStatisticsForTwoPlayer() {
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalGamesHENUF3958F35JF035 += 1
        
        let finalScore = max(gameStateHENUF3958F35JF035.player1ScoreHENUF3958F35JF035, gameStateHENUF3958F35JF035.player2ScoreHENUF3958F35JF035)
        
        if finalScore > appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035 {
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035 = finalScore
        }
        
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalScoreHENUF3958F35JF035 += finalScore
        
        // Вважаємо перемогою, якщо рахунок >= 7
        if finalScore >= 7 {
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalWinsHENUF3958F35JF035 += 1
        }
        
        // Зберігаємо статистику
        appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.saveHENUF3958F35JF035()
    }
    
    @ViewBuilder
    private func answerButtonHENUF3958F35JF035(forHENUF3958F35JF035 indexHENUF3958F35JF035: Int, questionHENUF3958F35JF035: QuestionHENUF3958F35JF035, isIPadHENUF3958F35JF035: Bool) -> some View {
        let isSelectedHENUF3958F35JF035 = gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 == indexHENUF3958F35JF035
        let isCorrectHENUF3958F35JF035 = indexHENUF3958F35JF035 == questionHENUF3958F35JF035.correctAnswerHENUF3958F35JF035
        let hasAnswerSelectedHENUF3958F35JF035 = gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 != nil
        let showAsCorrectHENUF3958F35JF035 = isCorrectHENUF3958F35JF035 && hasAnswerSelectedHENUF3958F35JF035 // Показувати правильну відповідь, якщо вибрана будь-яка
        
        Button(action: {
            if gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 == nil {
                HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
                selectAnswerHENUF3958F35JF035(indexHENUF3958F35JF035)
            }
        }) {
            HStack {
                Text(questionHENUF3958F35JF035.answersHENUF3958F35JF035[indexHENUF3958F35JF035])
                    .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                    .foregroundColor(answerTextColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: isSelectedHENUF3958F35JF035, isCorrectHENUF3958F35JF035: isCorrectHENUF3958F35JF035, showAsCorrectHENUF3958F35JF035: showAsCorrectHENUF3958F35JF035))
                Spacer()
                if (isSelectedHENUF3958F35JF035 || showAsCorrectHENUF3958F35JF035) {
                    let iconNameHENUF3958F35JF035 = isCorrectHENUF3958F35JF035 ? "checkmark.circle.fill" : "xmark.circle.fill"
                    let iconColorHENUF3958F35JF035 = isCorrectHENUF3958F35JF035 ? Color.green : Color.red
                    Image(systemName: iconNameHENUF3958F35JF035)
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 24))
                        .foregroundColor(iconColorHENUF3958F35JF035)
                }
            }
            .padding(isIPadHENUF3958F35JF035 ? 25 : 15)
            .background(answerBackgroundColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: isSelectedHENUF3958F35JF035, isCorrectHENUF3958F35JF035: isCorrectHENUF3958F35JF035, showAsCorrectHENUF3958F35JF035: showAsCorrectHENUF3958F35JF035))
            .overlay(
                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 15 : 10)
                    .stroke(answerBorderColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: isSelectedHENUF3958F35JF035, isCorrectHENUF3958F35JF035: isCorrectHENUF3958F35JF035, showAsCorrectHENUF3958F35JF035: showAsCorrectHENUF3958F35JF035), lineWidth: 2)
            )
            .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 10)
        }
        .disabled(gameStateHENUF3958F35JF035.selectedAnswerHENUF3958F35JF035 != nil)
    }
    
    private func answerTextColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: Bool, isCorrectHENUF3958F35JF035: Bool, showAsCorrectHENUF3958F35JF035: Bool) -> Color {
        if isSelectedHENUF3958F35JF035 {
            return isCorrectHENUF3958F35JF035 ? .white : .white
        }
        if showAsCorrectHENUF3958F35JF035 {
            return .white
        }
        return .white
    }
    
    private func answerBackgroundColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: Bool, isCorrectHENUF3958F35JF035: Bool, showAsCorrectHENUF3958F35JF035: Bool) -> Color {
        if isSelectedHENUF3958F35JF035 {
            if isCorrectHENUF3958F35JF035 {
                return Color.green.opacity(0.2)
            } else {
                return Color.red.opacity(0.2)
            }
        }
        if showAsCorrectHENUF3958F35JF035 {
            return Color.green.opacity(0.15)
        }
        return Color.white.opacity(0.05)
    }
    
    private func answerBorderColorHENUF3958F35JF035(isSelectedHENUF3958F35JF035: Bool, isCorrectHENUF3958F35JF035: Bool, showAsCorrectHENUF3958F35JF035: Bool) -> Color {
        if isSelectedHENUF3958F35JF035 {
            if isCorrectHENUF3958F35JF035 {
                return Color.green.opacity(0.8)
            } else {
                return Color.red.opacity(0.8)
            }
        }
        if showAsCorrectHENUF3958F35JF035 {
            return Color.green.opacity(0.6)
        }
        return Color.white.opacity(0.1)
    }
}

#Preview {
    QuizGameViewHENUF3958F35JF035(selectedModeHENUF3958F35JF035: nil)
}

