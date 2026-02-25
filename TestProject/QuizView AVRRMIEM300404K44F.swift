//
//  QuizView.swift


import SwiftUI

struct QuizViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @ObservedObject var quizViewModel: QuizViewModelAVRRMIEM300404K44F
    @Environment(\.dismiss) private var dismiss
    @AppStorage("totalQuizzes") private var totalQuizzes = 0
    @AppStorage("totalCorrectAnswers") private var totalCorrectAnswers = 0
    @AppStorage("totalScore") private var totalScore = 0
    @State private var selectedAnswerIndex: Int? = nil
    @State private var timeRemaining: Double = 15.0
    @State private var timer: Timer? = nil
    
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







    var body: some View {
        ZStack {
            if quizViewModel.isLoadingAVRRMIEM300404K44F {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tint(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F)
            } else if quizViewModel.gameFinishedAVRRMIEM300404K44F {
                gameFinishedViewAVRRMIEM300404K44F
            } else if let question = quizViewModel.currentQuestionAVRRMIEM300404K44F {
                quizQuestionViewAVRRMIEM300404K44F(question: question)
                    .padding(.top, 55)
            } else {
                loadingView
            }
        }
        .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundStyle(
                        LinearGradient(
                            colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                }
            }
        }
        .onAppear {
            if quizViewModel.questionsAVRRMIEM300404K44F.isEmpty {
                Task {
                    await quizViewModel.loadQuizAVRRMIEM300404K44F()
                }
            }
        }
        .onChange(of: quizViewModel.showResultAVRRMIEM300404K44F) { _ in
            selectedAnswerIndex = quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F
            stopTimer()
        }
        .onChange(of: quizViewModel.gameFinishedAVRRMIEM300404K44F) { isFinished in
            if isFinished {
                stopTimer()
                saveStatistics()
            }
        }
        .onChange(of: quizViewModel.currentQuestionAVRRMIEM300404K44F?.id) { _ in
            resetTimer()
        }
    }
    
    // MARK: - Loading View
    private var loadingView: some View {
        VStack(spacing: 20) {
            ProgressView()
                .tint(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F)
            Text("Loading quiz...")
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
            Button("Load Quiz") {
                Task {
                    await quizViewModel.loadQuizAVRRMIEM300404K44F()
                }
            }
            .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
            .padding(.horizontal, 40)
        }
    }
    
    // MARK: - Quiz Question View
    private func quizQuestionViewAVRRMIEM300404K44F(question: QuizQuestionAVRRMIEM300404K44F) -> some View {
        ScrollView {
            VStack(spacing: 25) {
                // Top Section: Progress & Score
                topSection
                    .onAppear {
                        resetTimer()
                    }
                
                // Question Card
                questionCard(question: question)
                
                // Answer Options
                answerOptionsSection(question: question)
                
                // Computer Answer (for PvC)
                if quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsComputer && quizViewModel.showResultAVRRMIEM300404K44F,
                   let computerAnswer = quizViewModel.computerAnswerAVRRMIEM300404K44F,
                   computerAnswer < question.answersAVRRMIEM300404K44F.count {
                    computerAnswerCard(question: question, computerAnswer: computerAnswer)
                }
                
                // Next Button
                if quizViewModel.showResultAVRRMIEM300404K44F {
                    nextButton
                }
                
                Spacer(minLength: 20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
    }
    
    // MARK: - Top Section
    private var topSection: some View {
        VStack(spacing: 20) {
            // Progress Bar
            progressBar
            
            // Score/Player Info with Timer
            if quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsPlayer {
                pvpScoreDisplay
            } else {
                soloPvcScoreDisplay
            }
        }
    }
    
    // MARK: - Progress Bar
    private var progressBar: some View {
        VStack(spacing: 8) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [
                                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 12)
                    
                    // Progress
                    let progress = quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsPlayer
                        ? CGFloat(quizViewModel.player1CurrentIndexAVRRMIEM300404K44F + quizViewModel.player2CurrentIndexAVRRMIEM300404K44F + 1) / CGFloat(max(quizViewModel.desiredCountAVRRMIEM300404K44F * 2, 1))
                        : CGFloat(quizViewModel.currentQuestionIndexAVRRMIEM300404K44F + 1) / CGFloat(max(quizViewModel.questionsAVRRMIEM300404K44F.count, 1))
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * progress, height: 12)
                        .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.5), radius: 8, x: 0, y: 2)
                }
            }
            .frame(height: 12)
            
            // Question Number
            HStack {
                Text(questionNumberText)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                Spacer()
            }
        }
    }
    
    private var questionNumberText: String {
        if quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            if quizViewModel.currentPlayerAVRRMIEM300404K44F == 1 {
                return "\(quizViewModel.player1NameAVRRMIEM300404K44F) - Question \(quizViewModel.player1CurrentIndexAVRRMIEM300404K44F + 1)/\(quizViewModel.desiredCountAVRRMIEM300404K44F)"
            } else {
                return "\(quizViewModel.player2NameAVRRMIEM300404K44F) - Question \(quizViewModel.player2CurrentIndexAVRRMIEM300404K44F + 1)/\(quizViewModel.desiredCountAVRRMIEM300404K44F)"
            }
        } else {
            return "Question \(quizViewModel.currentQuestionIndexAVRRMIEM300404K44F + 1) of \(quizViewModel.questionsAVRRMIEM300404K44F.count)"
        }
    }
    
    // MARK: - PvP Score Display
    private var pvpScoreDisplay: some View {
        HStack(spacing: 15) {
            playerScoreCard(
                player: 1,
                name: quizViewModel.player1NameAVRRMIEM300404K44F,
                score: quizViewModel.player1ScoreAVRRMIEM300404K44F,
                isActive: quizViewModel.currentPlayerAVRRMIEM300404K44F == 1
            )
            
            playerScoreCard(
                player: 2,
                name: quizViewModel.player2NameAVRRMIEM300404K44F,
                score: quizViewModel.player2ScoreAVRRMIEM300404K44F,
                isActive: quizViewModel.currentPlayerAVRRMIEM300404K44F == 2
            )
            
            // Timer
            timerView
        }
    }
    
    // MARK: - Timer View
    private var timerView: some View {
        VStack(spacing: 8) {
            ZStack {
                // Background circle
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                                ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 5
                    )
                    .frame(width: 55, height: 55)
                
                // Progress circle
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining / 15.0))
                    .stroke(
                        LinearGradient(
                            colors: timeRemaining <= 5
                                ? [Color.red, Color.orange]
                                : [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                                ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round)
                    )
                    .frame(width: 55, height: 55)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 0.1), value: timeRemaining)
                
                // Time text
                Text("\(Int(timeRemaining))")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: timeRemaining <= 5
                                ? [Color.red, Color.orange]
                                : [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                                ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            Text("Time")
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            LinearGradient(
                colors: [
                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LinearGradient(
                        colors: [
                            themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                            themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.2), radius: 10, x: 0, y: 5)
    }
    
    private func playerScoreCard(player: Int, name: String, score: Int, isActive: Bool) -> some View {
        VStack(spacing: 12) {
            HStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: isActive
                                ? [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
                                : [ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F.opacity(0.3), ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 12, height: 12)
                
                Text(name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(isActive ? ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F : ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
            }
            
            Text("\(score)")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: isActive
                            ? [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F]
                            : [ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F.opacity(0.7)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(
            ZStack {
                LinearGradient(
                    colors: [
                        ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                if isActive {
                    LinearGradient(
                        colors: [
                            themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.15),
                            themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    isActive
                        ? LinearGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.6),
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        : LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F.opacity(0.1),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                    lineWidth: isActive ? 2.5 : 1
                )
        )
        .shadow(
            color: isActive
                ? themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3)
                : Color.black.opacity(0.1),
            radius: isActive ? 15 : 5,
            x: 0,
            y: isActive ? 8 : 2
        )
    }
    
    // MARK: - Solo/PvC Score Display
    private var soloPvcScoreDisplay: some View {
        HStack(spacing: 20) {
            scoreItem(
                label: quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsComputer ? "You" : "Score",
                value: "\(quizViewModel.scoreAVRRMIEM300404K44F)",
                gradientColors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
            )
            
            if quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsComputer {
                scoreItem(
                    label: "Computer",
                    value: "\(quizViewModel.computerScoreAVRRMIEM300404K44F)",
                    gradientColors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F]
                )
            }
            
            // Timer
            timerView
        }
    }
    
    private func scoreItem(label: String, value: String, gradientColors: [Color]) -> some View {
        VStack(spacing: 8) {
            Text(label)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
            
            Text(value)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(
            LinearGradient(
                colors: [
                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LinearGradient(
                        colors: [
                            gradientColors[0].opacity(0.3),
                            gradientColors[1].opacity(0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: gradientColors[0].opacity(0.2), radius: 10, x: 0, y: 5)
    }
    
    // MARK: - Question Card
    private func questionCard(question: QuizQuestionAVRRMIEM300404K44F) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F,
                                ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                Spacer()
            }
            
            Text(question.textAVRRMIEM300404K44F)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                .lineSpacing(6)
        }
        .padding(28)
        .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
    }
    
    // MARK: - Answer Options
    private func answerOptionsSection(question: QuizQuestionAVRRMIEM300404K44F) -> some View {
        VStack(spacing: 16) {
            ForEach(Array(question.answersAVRRMIEM300404K44F.enumerated()), id: \.offset) { index, answer in
                answerButton(answer: answer, index: index, question: question)
            }
        }
    }
    
    private func answerButton(answer: String, index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> some View {
        Button {
            if !quizViewModel.showResultAVRRMIEM300404K44F {
                stopTimer()
                quizViewModel.selectAnswerAVRRMIEM300404K44F(index)
            }
        } label: {
            HStack(spacing: 16) {
                // Answer Letter Badge
                ZStack {
                    Circle()
                        .fill(
                            answerButtonBadgeGradient(index: index, question: question)
                        )
                        .frame(width: 40, height: 40)
                    
                    Text(String(Character(UnicodeScalar(65 + index)!)))
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(
                            quizViewModel.showResultAVRRMIEM300404K44F && (question.isCorrect(index) || (index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index)))
                                ? .white
                                : ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F
                        )
                }
                
                // Answer Text
                Text(answer)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(answerButtonTextColor(index: index, question: question))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                // Result Icon
                if quizViewModel.showResultAVRRMIEM300404K44F {
                    if question.isCorrect(index) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    } else if index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
            .background(answerButtonBackground(index: index, question: question))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        answerButtonBorderGradient(index: index, question: question),
                        lineWidth: answerButtonBorderWidth(index: index, question: question)
                    )
            )
            .shadow(
                color: answerButtonShadowColor(index: index, question: question),
                radius: answerButtonShadowRadius(index: index, question: question),
                x: 0,
                y: answerButtonShadowY(index: index, question: question)
            )
            .scaleEffect(selectedAnswerIndex == index && !quizViewModel.showResultAVRRMIEM300404K44F ? 1.02 : 1.0)
        }
        .disabled(quizViewModel.showResultAVRRMIEM300404K44F)
    }
    
    // MARK: - Answer Button Helpers
    private func answerButtonBadgeGradient(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> LinearGradient {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            if question.isCorrect(index) {
                return LinearGradient(
                    colors: [Color.green, Color.green.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            } else if index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index) {
                return LinearGradient(
                    colors: [Color.red, Color.red.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        return LinearGradient(
            colors: [
                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F,
                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.8)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private func answerButtonTextColor(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> Color {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            if question.isCorrect(index) || (index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index)) {
                return .white
            }
        }
        return ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F
    }
    
    private func answerButtonBackground(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> some View {
        Group {
            if quizViewModel.showResultAVRRMIEM300404K44F {
                if question.isCorrect(index) {
                    LinearGradient(
                        colors: [Color.green, Color.green.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                } else if index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index) {
                    LinearGradient(
                        colors: [Color.red, Color.red.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                } else {
                    LinearGradient(
                        colors: [
                            ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.5),
                            ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.3)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            } else {
                LinearGradient(
                    colors: [
                        ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
    }
    
    private func answerButtonBorderGradient(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> LinearGradient {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            return LinearGradient(colors: [Color.clear], startPoint: .leading, endPoint: .trailing)
        }
        return LinearGradient(
            colors: [
                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private func answerButtonBorderWidth(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> CGFloat {
        return quizViewModel.showResultAVRRMIEM300404K44F ? 0 : 1.5
    }
    
    private func answerButtonShadowColor(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> Color {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            if question.isCorrect(index) {
                return Color.green.opacity(0.4)
            } else if index == quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F && !question.isCorrect(index) {
                return Color.red.opacity(0.4)
            }
        }
        return Color.black.opacity(0.1)
    }
    
    private func answerButtonShadowRadius(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> CGFloat {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            return 15
        }
        return 8
    }
    
    private func answerButtonShadowY(index: Int, question: QuizQuestionAVRRMIEM300404K44F) -> CGFloat {
        if quizViewModel.showResultAVRRMIEM300404K44F {
            return 8
        }
        return 4
    }
    
    // MARK: - Computer Answer Card
    private func computerAnswerCard(question: QuizQuestionAVRRMIEM300404K44F, computerAnswer: Int) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "cpu.fill")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Computer chose: \(question.answersAVRRMIEM300404K44F[computerAnswer])")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            Spacer()
            
            if question.isCorrect(computerAnswer) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.red)
            }
        }
        .padding(18)
        .background(
            LinearGradient(
                colors: [
                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F.opacity(0.8),
                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F.opacity(0.6)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    LinearGradient(
                        colors: [
                            ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F.opacity(0.3),
                            ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F.opacity(0.2)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 1.5
                )
        )
    }
    
    // MARK: - Next Button
    private var nextButton: some View {
        Button {
            quizViewModel.nextQuestionAVRRMIEM300404K44F()
        } label: {
            HStack(spacing: 12) {
                Text(quizViewModel.isLastQuestionAVRRMIEM300404K44F ? "Finish Quiz" : "Next Question")
                    .font(.system(size: 18, weight: .bold))
                Image(systemName: "arrow.right")
                    .font(.system(size: 18, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
        }
    }
    
    // MARK: - Game Finished View
    private var gameFinishedViewAVRRMIEM300404K44F: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Icon
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.4),
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 70
                            )
                        )
                        .frame(width: 140, height: 140)
                        .blur(radius: 20)
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: resultIcon)
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: resultIconColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                .padding(.top, 40)
                
                Text("Quiz Completed!")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                // Results
                resultsCard
                
                // Play Again Button
                Button {
                    quizViewModel.restartQuizAVRRMIEM300404K44F()
                    dismiss()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "arrow.clockwise")
                        Text("Play Again")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var resultIcon: String {
        switch quizViewModel.gameModeAVRRMIEM300404K44F {
        case .solo:
            return "star.fill"
        case .playerVsPlayer:
            return "trophy.fill"
        case .playerVsComputer:
            let isWinner = quizViewModel.scoreAVRRMIEM300404K44F > quizViewModel.computerScoreAVRRMIEM300404K44F
            return isWinner ? "crown.fill" : "cpu.fill"
        }
    }
    
    private var resultIconColors: [Color] {
        switch quizViewModel.gameModeAVRRMIEM300404K44F {
        case .solo:
            return [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
        case .playerVsPlayer:
            return [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F]
        case .playerVsComputer:
            let isWinner = quizViewModel.scoreAVRRMIEM300404K44F > quizViewModel.computerScoreAVRRMIEM300404K44F
            return isWinner
                ? [Color.yellow, Color.orange]
                : [Color.red, ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F]
        }
    }
    
    private var resultsCard: some View {
        Group {
            switch quizViewModel.gameModeAVRRMIEM300404K44F {
            case .solo:
                soloResults
            case .playerVsPlayer:
                pvpResults
            case .playerVsComputer:
                pvcResults
            }
        }
        .padding(28)
        .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
        .padding(.horizontal, 20)
    }
    
    private var soloResults: some View {
        VStack(spacing: 20) {
            Text("Your Score")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
            
            Text("\(quizViewModel.scoreAVRRMIEM300404K44F) / \(quizViewModel.questionsAVRRMIEM300404K44F.count)")
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            let percentage = Double(quizViewModel.scoreAVRRMIEM300404K44F) / Double(quizViewModel.questionsAVRRMIEM300404K44F.count) * 100
            Text(String(format: "%.0f%% Correct", percentage))
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
        }
    }
    
    private var pvpResults: some View {
        VStack(spacing: 24) {
            Text("Final Scores")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            HStack(spacing: 30) {
                playerResult(
                    name: quizViewModel.player1NameAVRRMIEM300404K44F,
                    score: quizViewModel.player1ScoreAVRRMIEM300404K44F,
                    isWinner: quizViewModel.player1ScoreAVRRMIEM300404K44F > quizViewModel.player2ScoreAVRRMIEM300404K44F,
                    gradientColors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
                )
                
                Text("VS")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                
                playerResult(
                    name: quizViewModel.player2NameAVRRMIEM300404K44F,
                    score: quizViewModel.player2ScoreAVRRMIEM300404K44F,
                    isWinner: quizViewModel.player2ScoreAVRRMIEM300404K44F > quizViewModel.player1ScoreAVRRMIEM300404K44F,
                    gradientColors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F]
                )
            }
            
            if quizViewModel.player1ScoreAVRRMIEM300404K44F == quizViewModel.player2ScoreAVRRMIEM300404K44F {
                Text("It's a tie! 🎉")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            } else {
                let winner = quizViewModel.player1ScoreAVRRMIEM300404K44F > quizViewModel.player2ScoreAVRRMIEM300404K44F
                    ? quizViewModel.player1NameAVRRMIEM300404K44F
                    : quizViewModel.player2NameAVRRMIEM300404K44F
                Text("\(winner) wins! 🏆")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.yellow, Color.orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
        }
    }
    
    private func playerResult(name: String, score: Int, isWinner: Bool, gradientColors: [Color]) -> some View {
        VStack(spacing: 12) {
            if isWinner {
                Image(systemName: "crown.fill")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.yellow, Color.orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            Text(name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            Text("\(score)")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    private var pvcResults: some View {
        VStack(spacing: 24) {
            Text("Final Scores")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            HStack(spacing: 30) {
                playerResult(
                    name: "You",
                    score: quizViewModel.scoreAVRRMIEM300404K44F,
                    isWinner: quizViewModel.scoreAVRRMIEM300404K44F > quizViewModel.computerScoreAVRRMIEM300404K44F,
                    gradientColors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
                )
                
                Text("VS")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                
                playerResult(
                    name: "Computer",
                    score: quizViewModel.computerScoreAVRRMIEM300404K44F,
                    isWinner: quizViewModel.computerScoreAVRRMIEM300404K44F > quizViewModel.scoreAVRRMIEM300404K44F,
                    gradientColors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F]
                )
            }
            
            if quizViewModel.scoreAVRRMIEM300404K44F == quizViewModel.computerScoreAVRRMIEM300404K44F {
                Text("It's a tie! 🎉")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            } else if quizViewModel.scoreAVRRMIEM300404K44F > quizViewModel.computerScoreAVRRMIEM300404K44F {
                Text("You win! 🎉")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.green, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            } else {
                Text("Computer wins! 😔")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.red, ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
        }
    }
    
    // MARK: - Statistics
    private func saveStatistics() {
        if quizViewModel.gameModeAVRRMIEM300404K44F == .solo {
            totalQuizzes += 1
            totalCorrectAnswers += quizViewModel.scoreAVRRMIEM300404K44F
            totalScore += quizViewModel.scoreAVRRMIEM300404K44F
        } else if quizViewModel.gameModeAVRRMIEM300404K44F == .playerVsComputer {
            totalQuizzes += 1
            totalCorrectAnswers += quizViewModel.scoreAVRRMIEM300404K44F
            totalScore += quizViewModel.scoreAVRRMIEM300404K44F
        }
    }
    
    // MARK: - Timer Functions
    private func startTimer() {
        stopTimer()
        timeRemaining = 15.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.timeRemaining > 0.05 {
                self.timeRemaining -= 0.1
            } else {
                // Time's up - automatically select an answer if none selected
                if !self.quizViewModel.showResultAVRRMIEM300404K44F && self.quizViewModel.selectedAnswerIndexAVRRMIEM300404K44F == nil {
                    // Select first wrong answer to show timeout
                    if let question = self.quizViewModel.currentQuestionAVRRMIEM300404K44F {
                        for i in 0..<question.answersAVRRMIEM300404K44F.count {
                            if !question.isCorrect(i) {
                                self.quizViewModel.selectAnswerAVRRMIEM300404K44F(i)
                                break
                            }
                        }
                    }
                }
                self.stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resetTimer() {
        stopTimer()
        timeRemaining = 15.0
        if !quizViewModel.showResultAVRRMIEM300404K44F {
            startTimer()
        }
    }
}

#Preview {
    NavigationStack {
        QuizViewAVRRMIEM300404K44F(quizViewModel: QuizViewModelAVRRMIEM300404K44F())
            .environmentObject(ThemeManagerAVRRMIEM300404K44F())
    }
}

