//
//  HintsQuizViewModel.swift


import Foundation
import SwiftUI
internal import Combine

@MainActor
final class HintsQuizViewModelAVRRMIEM300404K44F: ObservableObject {
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







    @Published var questionsAVRRMIEM300404K44F: [QuizQuestionWithHintsAVRRMIEM300404K44F] = []
    @Published var currentQuestionIndexAVRRMIEM300404K44F: Int = 0
    @Published var showAnswerAVRRMIEM300404K44F: Bool = false
    @Published var scoreAVRRMIEM300404K44F: Int = 0
    @Published var isLoadingAVRRMIEM300404K44F: Bool = false
    @Published var errorMessageAVRRMIEM300404K44F: String?
    @Published var gameFinishedAVRRMIEM300404K44F: Bool = false
    @Published var showHint1AVRRMIEM300404K44F: Bool = false
    @Published var showHint2AVRRMIEM300404K44F: Bool = false
    
    private let serviceAVRRMIEM300404K44F: HintsQuizServiceAVRRMIEM300404K44F
    private let desiredCountAVRRMIEM300404K44F: Int = 10
    
    init(serviceAVRRMIEM300404K44F: HintsQuizServiceAVRRMIEM300404K44F = HintsQuizServiceAVRRMIEM300404K44F()) {
        self.serviceAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F
    }
    
    var currentQuestionAVRRMIEM300404K44F: QuizQuestionWithHintsAVRRMIEM300404K44F? {
        guard currentQuestionIndexAVRRMIEM300404K44F < questionsAVRRMIEM300404K44F.count else { return nil }
        return questionsAVRRMIEM300404K44F[currentQuestionIndexAVRRMIEM300404K44F]
    }
    
    var isLastQuestionAVRRMIEM300404K44F: Bool {
        return currentQuestionIndexAVRRMIEM300404K44F >= questionsAVRRMIEM300404K44F.count - 1
    }
    
    var totalQuestionsAVRRMIEM300404K44F: Int {
        return questionsAVRRMIEM300404K44F.count
    }
    
    func loadQuizAVRRMIEM300404K44F() async {
        isLoadingAVRRMIEM300404K44F = true
        errorMessageAVRRMIEM300404K44F = nil
        gameFinishedAVRRMIEM300404K44F = false
        
        try? await Task.sleep(nanoseconds: 500_000_000)
        
        let newQuestionsAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F.getRandomHintsQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: desiredCountAVRRMIEM300404K44F)
        
        if newQuestionsAVRRMIEM300404K44F.isEmpty {
            errorMessageAVRRMIEM300404K44F = "Failed to load questions. Please try again."
        } else {
            questionsAVRRMIEM300404K44F = newQuestionsAVRRMIEM300404K44F
            resetGameAVRRMIEM300404K44F()
        }
        
        isLoadingAVRRMIEM300404K44F = false
    }
    
    func showAnswer() {
        showAnswerAVRRMIEM300404K44F = true
    }
    
    func showHint1() {
        showHint1AVRRMIEM300404K44F = true
    }
    
    func showHint2() {
        showHint2AVRRMIEM300404K44F = true
    }
    
    func nextQuestionAVRRMIEM300404K44F() {
        showAnswerAVRRMIEM300404K44F = false
        showHint1AVRRMIEM300404K44F = false
        showHint2AVRRMIEM300404K44F = false
        
        if isLastQuestionAVRRMIEM300404K44F {
            finishGameAVRRMIEM300404K44F()
        } else {
            currentQuestionIndexAVRRMIEM300404K44F += 1
        }
    }
    
    func resetGameAVRRMIEM300404K44F() {
        currentQuestionIndexAVRRMIEM300404K44F = 0
        showAnswerAVRRMIEM300404K44F = false
        scoreAVRRMIEM300404K44F = 0
        gameFinishedAVRRMIEM300404K44F = false
        showHint1AVRRMIEM300404K44F = false
        showHint2AVRRMIEM300404K44F = false
    }
    
    func finishGameAVRRMIEM300404K44F() {
        gameFinishedAVRRMIEM300404K44F = true
    }
    
    func restartQuizAVRRMIEM300404K44F() {
        resetGameAVRRMIEM300404K44F()
        questionsAVRRMIEM300404K44F = []
    }
}

