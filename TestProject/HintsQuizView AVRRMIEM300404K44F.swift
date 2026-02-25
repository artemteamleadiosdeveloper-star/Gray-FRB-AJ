//
//  HintsQuizView.swift


import SwiftUI

struct HintsQuizViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @StateObject private var viewModel = HintsQuizViewModelAVRRMIEM300404K44F()
    @Environment(\.dismiss) private var dismiss
    @AppStorage("totalQuizzes") private var totalQuizzes = 0
    @AppStorage("totalCorrectAnswers") private var totalCorrectAnswers = 0
    @AppStorage("totalScore") private var totalScore = 0

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
            // Background will be set via modifier
            
            if viewModel.isLoadingAVRRMIEM300404K44F {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tint(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
            } else if viewModel.gameFinishedAVRRMIEM300404K44F {
                gameFinishedViewAVRRMIEM300404K44F
            } else if let question = viewModel.currentQuestionAVRRMIEM300404K44F {
                quizQuestionViewAVRRMIEM300404K44F(question: question)
                    .padding(.top, 50)
            }
        }
        .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
                }
            }
        }
        .onAppear {
            if viewModel.questionsAVRRMIEM300404K44F.isEmpty {
                Task {
                    await viewModel.loadQuizAVRRMIEM300404K44F()
                }
            }
        }
        .onChange(of: viewModel.gameFinishedAVRRMIEM300404K44F, perform: { isFinished in
            if isFinished {
                saveStatistics()
            }
        })
    }
    
    // MARK: - Quiz Question View
    private func quizQuestionViewAVRRMIEM300404K44F(question: QuizQuestionWithHintsAVRRMIEM300404K44F) -> some View {
        ScrollView {
            VStack(spacing: 25) {
                // Progress Bar
                progressBarAVRRMIEM300404K44F
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                // Question Header
                VStack(spacing: 16) {
                    // Question Number Badge
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
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
                        Text("Question \(viewModel.currentQuestionIndexAVRRMIEM300404K44F + 1) of \(viewModel.totalQuestionsAVRRMIEM300404K44F)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                        Spacer()
                    }
                    
                    Text(question.textAVRRMIEM300404K44F)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                }
                .padding(24)
                .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                .padding(.horizontal)
                
                // Hints Section
                if viewModel.showHint1AVRRMIEM300404K44F || viewModel.showHint2AVRRMIEM300404K44F {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color.yellow, Color.orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            Text("Hints")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                            Spacer()
                        }
                        
                        if viewModel.showHint1AVRRMIEM300404K44F {
                            hintCardAVRRMIEM300404K44F(hint: question.hint1AVRRMIEM300404K44F, hintNumber: 1)
                        }
                        
                        if viewModel.showHint2AVRRMIEM300404K44F {
                            hintCardAVRRMIEM300404K44F(hint: question.hint2AVRRMIEM300404K44F, hintNumber: 2)
                        }
                    }
                    .padding(24)
                    .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                    .padding(.horizontal)
                }
                
                // Hint Buttons
                if !viewModel.showHint1AVRRMIEM300404K44F || !viewModel.showHint2AVRRMIEM300404K44F {
                    HStack(spacing: 15) {
                        if !viewModel.showHint1AVRRMIEM300404K44F {
                            Button {
                                viewModel.showHint1()
                            } label: {
                                VStack(spacing: 8) {
                                    ZStack {
                                        Circle()
                                            .fill(
                                                RadialGradient(
                                                    colors: [
                                                        Color.yellow.opacity(0.4),
                                                        Color.yellow.opacity(0.2),
                                                        Color.clear
                                                    ],
                                                    center: .center,
                                                    startRadius: 0,
                                                    endRadius: 30
                                                )
                                            )
                                            .frame(width: 60, height: 60)
                                            .blur(radius: 10)
                                        
                                        Image(systemName: "lightbulb.fill")
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(.yellow)
                                    }
                                    
                                    Text("Hint 1")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(
                                    LinearGradient(
                                        colors: [
                                            Color.yellow.opacity(0.2),
                                            Color.yellow.opacity(0.1)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.yellow.opacity(0.4), lineWidth: 1.5)
                                )
                            }
                        }
                        
                        if !viewModel.showHint2AVRRMIEM300404K44F {
                            Button {
                                viewModel.showHint2()
                            } label: {
                                VStack(spacing: 8) {
                                    ZStack {
                                        Circle()
                                            .fill(
                                                RadialGradient(
                                                    colors: [
                                                        Color.orange.opacity(0.4),
                                                        Color.orange.opacity(0.2),
                                                        Color.clear
                                                    ],
                                                    center: .center,
                                                    startRadius: 0,
                                                    endRadius: 30
                                                )
                                            )
                                            .frame(width: 60, height: 60)
                                            .blur(radius: 10)
                                        
                                        Image(systemName: "lightbulb.fill")
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(.orange)
                                    }
                                    
                                    Text("Hint 2")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(
                                    LinearGradient(
                                        colors: [
                                            Color.orange.opacity(0.2),
                                            Color.orange.opacity(0.1)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.orange.opacity(0.4), lineWidth: 1.5)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Show Answer Button
                if !viewModel.showAnswerAVRRMIEM300404K44F {
                    Button {
                        viewModel.showAnswer()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "eye.fill")
                                .font(.system(size: 20, weight: .semibold))
                            Text("Show Answer")
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(18)
                        .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                    }
                    .padding(.horizontal)
                }
                
                // Correct Answer Display
                if viewModel.showAnswerAVRRMIEM300404K44F {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(
                                        RadialGradient(
                                            colors: [
                                                Color.green.opacity(0.4),
                                                Color.green.opacity(0.2),
                                                Color.clear
                                            ],
                                            center: .center,
                                            startRadius: 0,
                                            endRadius: 25
                                        )
                                    )
                                    .frame(width: 50, height: 50)
                                    .blur(radius: 8)
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.green)
                            }
                            
                            Text("Correct Answer")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                        }
                        
                        Text(question.correctAnswerAVRRMIEM300404K44F)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color.green.opacity(0.25),
                                        Color.green.opacity(0.15)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.green.opacity(0.4), lineWidth: 1.5)
                            )
                    }
                    .padding(24)
                    .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                    .padding(.horizontal)
                    
                    // Next Button
                    Button {
                        viewModel.nextQuestionAVRRMIEM300404K44F()
                    } label: {
                        HStack(spacing: 12) {
                            Text(viewModel.isLastQuestionAVRRMIEM300404K44F ? "Finish Quiz" : "Next Question")
                                .font(.system(size: 18, weight: .semibold))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(18)
                        .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                    }
                    .padding(.horizontal)
                }
                
            }
            .padding(.vertical)
        }
    }
    
    private func hintCardAVRRMIEM300404K44F(hint: String, hintNumber: Int) -> some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                (hintNumber == 1 ? Color.yellow : Color.orange).opacity(0.3),
                                (hintNumber == 1 ? Color.yellow : Color.orange).opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 20
                        )
                    )
                    .frame(width: 40, height: 40)
                    .blur(radius: 6)
                
                Image(systemName: "lightbulb.fill")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(hintNumber == 1 ? .yellow : .orange)
            }
            
            Text(hint)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(4)
        }
        .padding(18)
        .background(
            LinearGradient(
                colors: [
                    (hintNumber == 1 ? Color.yellow : Color.orange).opacity(0.15),
                    (hintNumber == 1 ? Color.yellow : Color.orange).opacity(0.08)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke((hintNumber == 1 ? Color.yellow : Color.orange).opacity(0.3), lineWidth: 1.5)
        )
    }
    
    private var progressBarAVRRMIEM300404K44F: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: 10)
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F.opacity(0.2), lineWidth: 1)
                    )
                
                // Progress
                let progress = CGFloat(viewModel.currentQuestionIndexAVRRMIEM300404K44F + (viewModel.showAnswerAVRRMIEM300404K44F ? 1 : 0)) / CGFloat(max(viewModel.totalQuestionsAVRRMIEM300404K44F, 1))
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F,
                                ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F
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
                                endRadius: 60
                            )
                        )
                        .frame(width: 120, height: 120)
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
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color.green, Color.green.opacity(0.8)],
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
                
                VStack(spacing: 20) {
                    Text("\(viewModel.questionsAVRRMIEM300404K44F.count) Questions")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("You've reviewed all questions")
                        .font(.title3)
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
                .padding(30)
                .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                .padding(.horizontal)
                
                Button {
                    viewModel.restartQuizAVRRMIEM300404K44F()
                    dismiss()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "arrow.clockwise")
                        Text("Play Again")
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(18)
                    .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .padding(.vertical)
        }
    }
    
    // MARK: - Statistics
    private func saveStatistics() {
        totalQuizzes += 1
        // In hints mode, we don't track correct answers since user just views the answers
    }
}

#Preview {
    NavigationStack {
        HintsQuizViewAVRRMIEM300404K44F()
            .environmentObject(ThemeManagerAVRRMIEM300404K44F())
    }
}

