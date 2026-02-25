import Foundation
import SwiftUI
internal import Combine

enum GameModeAVRRMIEM300404K44F {
    case solo
    case playerVsPlayer
    case playerVsComputer
}

@MainActor
final class QuizViewModelAVRRMIEM300404K44F: ObservableObject {
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







    @Published var desiredCountAVRRMIEM300404K44F: Int = 10
    @Published var questionsAVRRMIEM300404K44F: [QuizQuestionAVRRMIEM300404K44F] = []
    @Published var currentQuestionIndexAVRRMIEM300404K44F: Int = 0
    @Published var selectedAnswerIndexAVRRMIEM300404K44F: Int? = nil
    @Published var showResultAVRRMIEM300404K44F: Bool = false
    @Published var scoreAVRRMIEM300404K44F: Int = 0
    @Published var gameModeAVRRMIEM300404K44F: GameModeAVRRMIEM300404K44F = .solo
    @Published var isLoadingAVRRMIEM300404K44F: Bool = false
    @Published var errorMessageAVRRMIEM300404K44F: String?
    @Published var gameFinishedAVRRMIEM300404K44F: Bool = false
    
    // Player vs Player
    @Published var player1ScoreAVRRMIEM300404K44F: Int = 0
    @Published var player2ScoreAVRRMIEM300404K44F: Int = 0
    @Published var currentPlayerAVRRMIEM300404K44F: Int = 1 // 1 or 2
    @Published var player1NameAVRRMIEM300404K44F: String = "Player 1"
    @Published var player2NameAVRRMIEM300404K44F: String = "Player 2"
    @Published var player1QuestionsAVRRMIEM300404K44F: [QuizQuestionAVRRMIEM300404K44F] = []
    @Published var player2QuestionsAVRRMIEM300404K44F: [QuizQuestionAVRRMIEM300404K44F] = []
    @Published var player1CurrentIndexAVRRMIEM300404K44F: Int = 0
    @Published var player2CurrentIndexAVRRMIEM300404K44F: Int = 0
    
    // Player vs Computer
    @Published var computerScoreAVRRMIEM300404K44F: Int = 0
    @Published var computerAnswerAVRRMIEM300404K44F: Int? = nil // For showing computer's answer
    private var computerCorrectnessAVRRMIEM300404K44F: [Bool] = [] // Track computer's answers
    
    private let serviceAVRRMIEM300404K44F: QuizServiceAVRRMIEM300404K44F
    
    init(serviceAVRRMIEM300404K44F: QuizServiceAVRRMIEM300404K44F = QuizServiceAVRRMIEM300404K44F()) {
        self.serviceAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F
    }
    
    var currentQuestionAVRRMIEM300404K44F: QuizQuestionAVRRMIEM300404K44F? {
        if gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            if currentPlayerAVRRMIEM300404K44F == 1 {
                guard player1CurrentIndexAVRRMIEM300404K44F < player1QuestionsAVRRMIEM300404K44F.count else { return nil }
                return player1QuestionsAVRRMIEM300404K44F[player1CurrentIndexAVRRMIEM300404K44F]
            } else {
                guard player2CurrentIndexAVRRMIEM300404K44F < player2QuestionsAVRRMIEM300404K44F.count else { return nil }
                return player2QuestionsAVRRMIEM300404K44F[player2CurrentIndexAVRRMIEM300404K44F]
            }
        } else {
            guard currentQuestionIndexAVRRMIEM300404K44F < questionsAVRRMIEM300404K44F.count else { return nil }
            return questionsAVRRMIEM300404K44F[currentQuestionIndexAVRRMIEM300404K44F]
        }
    }
    
    var isLastQuestionAVRRMIEM300404K44F: Bool {
        if gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            // Both players need to finish their last question
            // Check if we're on the last round (both indices at last question)
            return player1CurrentIndexAVRRMIEM300404K44F >= player1QuestionsAVRRMIEM300404K44F.count - 1 &&
                   player2CurrentIndexAVRRMIEM300404K44F >= player2QuestionsAVRRMIEM300404K44F.count - 1 &&
                   currentPlayerAVRRMIEM300404K44F == 2 // Player 2 is answering the last question
        } else {
            return currentQuestionIndexAVRRMIEM300404K44F >= questionsAVRRMIEM300404K44F.count - 1
        }
    }
    
    var totalQuestionsAVRRMIEM300404K44F: Int {
        if gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            // Both players have the same number of questions from desiredCountAVRRMIEM300404K44F
            return desiredCountAVRRMIEM300404K44F * 2 // Total questions for both players
        } else {
            return desiredCountAVRRMIEM300404K44F
        }
    }
    
    func loadQuizAVRRMIEM300404K44F() async {
        isLoadingAVRRMIEM300404K44F = true
        errorMessageAVRRMIEM300404K44F = nil
        gameFinishedAVRRMIEM300404K44F = false
        
        // Simulate loading delay
        try? await Task.sleep(nanoseconds: 500_000_000)
        
        if gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            // Load questions for both players using desiredCountAVRRMIEM300404K44F
            let questionCount = desiredCountAVRRMIEM300404K44F // Use the same count for both players
            player1QuestionsAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F.getRandomQuizQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: questionCount)
            player2QuestionsAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F.getRandomQuizQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: questionCount)
            
            if player1QuestionsAVRRMIEM300404K44F.isEmpty || player2QuestionsAVRRMIEM300404K44F.isEmpty {
                errorMessageAVRRMIEM300404K44F = "Failed to load questions. Please try again."
            } else {
                resetGameAVRRMIEM300404K44F()
            }
        } else {
            // Load questions for solo or PvC mode
            let newQuestionsAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F.getRandomQuizQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: desiredCountAVRRMIEM300404K44F)
            
            if newQuestionsAVRRMIEM300404K44F.isEmpty {
                errorMessageAVRRMIEM300404K44F = "Failed to load questions. Please try again."
            } else {
                questionsAVRRMIEM300404K44F = newQuestionsAVRRMIEM300404K44F
                
                // Pre-generate computer's answers for PvC mode (50% accuracy - computer makes mistakes)
                if gameModeAVRRMIEM300404K44F == .playerVsComputer {
                    computerCorrectnessAVRRMIEM300404K44F = generateComputerAnswersAVRRMIEM300404K44F(questions: newQuestionsAVRRMIEM300404K44F, accuracy: 0.5)
                }
                
                resetGameAVRRMIEM300404K44F()
            }
        }
        
        isLoadingAVRRMIEM300404K44F = false
    }
    
    // Generate computer answers with specified accuracy (0.0 to 1.0)
    private func generateComputerAnswersAVRRMIEM300404K44F(questions: [QuizQuestionAVRRMIEM300404K44F], accuracy: Double) -> [Bool] {
        return questions.map { _ in
            Double.random(in: 0...1) < accuracy
        }
    }
    
    func selectAnswerAVRRMIEM300404K44F(_ index: Int) {
        guard selectedAnswerIndexAVRRMIEM300404K44F == nil, !showResultAVRRMIEM300404K44F else { return }
        selectedAnswerIndexAVRRMIEM300404K44F = index
        showResultAVRRMIEM300404K44F = true
        
        if let question = currentQuestionAVRRMIEM300404K44F {
            let isCorrect = question.isCorrect(index)
            
            switch gameModeAVRRMIEM300404K44F {
            case .solo:
                if isCorrect {
                    scoreAVRRMIEM300404K44F += 1
                }
            case .playerVsPlayer:
                if isCorrect {
                    if currentPlayerAVRRMIEM300404K44F == 1 {
                        player1ScoreAVRRMIEM300404K44F += 1
                    } else {
                        player2ScoreAVRRMIEM300404K44F += 1
                    }
                }
            case .playerVsComputer:
                if isCorrect {
                    scoreAVRRMIEM300404K44F += 1
                }
                // Computer answers based on pre-generated correctness
                if currentQuestionIndexAVRRMIEM300404K44F < computerCorrectnessAVRRMIEM300404K44F.count {
                    let computerCorrect = computerCorrectnessAVRRMIEM300404K44F[currentQuestionIndexAVRRMIEM300404K44F]
                    if computerCorrect {
                        computerScoreAVRRMIEM300404K44F += 1
                    }
                    // Store computer's answer for display
                    if computerCorrect {
                        computerAnswerAVRRMIEM300404K44F = question.correctAnswerIndexAVRRMIEM300404K44F
                    } else {
                        // Computer picks wrong answer (any index except correct)
                        let wrongAnswers = question.answersAVRRMIEM300404K44F.indices.filter { $0 != question.correctAnswerIndexAVRRMIEM300404K44F }
                        computerAnswerAVRRMIEM300404K44F = wrongAnswers.randomElement() ?? question.correctAnswerIndexAVRRMIEM300404K44F
                    }
                }
            }
        }
    }
    
    func nextQuestionAVRRMIEM300404K44F() {
        selectedAnswerIndexAVRRMIEM300404K44F = nil
        showResultAVRRMIEM300404K44F = false
        computerAnswerAVRRMIEM300404K44F = nil
        
        if gameModeAVRRMIEM300404K44F == .playerVsPlayer {
            // Players take turns: P1->P2->P1->P2...
            // Each player answers one question per round, then we move to next round
            if currentPlayerAVRRMIEM300404K44F == 1 {
                // Player 1 just answered their question, switch to player 2
                // Player 2 will answer the same round number question
                currentPlayerAVRRMIEM300404K44F = 2
            } else {
                // Player 2 just answered, both players answered this round
                // Move to next round and switch back to player 1
                player1CurrentIndexAVRRMIEM300404K44F += 1
                player2CurrentIndexAVRRMIEM300404K44F += 1
                currentPlayerAVRRMIEM300404K44F = 1
                
                // Check if all questions are answered
                if player1CurrentIndexAVRRMIEM300404K44F >= player1QuestionsAVRRMIEM300404K44F.count &&
                   player2CurrentIndexAVRRMIEM300404K44F >= player2QuestionsAVRRMIEM300404K44F.count {
                    finishGameAVRRMIEM300404K44F()
                }
            }
        } else {
            // Solo or PvC mode
            if isLastQuestionAVRRMIEM300404K44F {
                finishGameAVRRMIEM300404K44F()
            } else {
                currentQuestionIndexAVRRMIEM300404K44F += 1
            }
        }
    }
    
    func resetGameAVRRMIEM300404K44F() {
        currentQuestionIndexAVRRMIEM300404K44F = 0
        player1CurrentIndexAVRRMIEM300404K44F = 0
        player2CurrentIndexAVRRMIEM300404K44F = 0
        selectedAnswerIndexAVRRMIEM300404K44F = nil
        showResultAVRRMIEM300404K44F = false
        scoreAVRRMIEM300404K44F = 0
        player1ScoreAVRRMIEM300404K44F = 0
        player2ScoreAVRRMIEM300404K44F = 0
        computerScoreAVRRMIEM300404K44F = 0
        currentPlayerAVRRMIEM300404K44F = 1
        gameFinishedAVRRMIEM300404K44F = false
        computerAnswerAVRRMIEM300404K44F = nil
        // Don't reset computerCorrectnessAVRRMIEM300404K44F here - it's already generated in loadQuizAVRRMIEM300404K44F
    }
    
    func finishGameAVRRMIEM300404K44F() {
        gameFinishedAVRRMIEM300404K44F = true
    }
    
    func restartQuizAVRRMIEM300404K44F() {
        resetGameAVRRMIEM300404K44F()
        questionsAVRRMIEM300404K44F = []
        player1QuestionsAVRRMIEM300404K44F = []
        player2QuestionsAVRRMIEM300404K44F = []
    }
}

