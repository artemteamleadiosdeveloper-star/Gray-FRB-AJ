import Foundation
import SwiftUI
internal import Combine

@MainActor
final class QuestionViewModelAVRRMIEM300404K44F: ObservableObject {
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







    @Published var topicAVRRMIEM300404K44F: String = ""
    @Published var desiredCountAVRRMIEM300404K44F: Int = 3
    @Published var questionsAVRRMIEM300404K44F: [QuestionAVRRMIEM300404K44F] = []
    @Published var isLoadingAVRRMIEM300404K44F: Bool = false
    @Published var errorMessageAVRRMIEM300404K44F: String?

    private let serviceAVRRMIEM300404K44F: QuestionServiceAVRRMIEM300404K44F

    init(serviceAVRRMIEM300404K44F: QuestionServiceAVRRMIEM300404K44F = QuestionServiceAVRRMIEM300404K44F()) {
        self.serviceAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F
    }

    func generateQuestionsAVRRMIEM300404K44F() async {
        let trimmedTopicAVRRMIEM300404K44F = topicAVRRMIEM300404K44F.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTopicAVRRMIEM300404K44F.isEmpty else {
            errorMessageAVRRMIEM300404K44F = "Please enter a topic to get questions."
            return
        }

        isLoadingAVRRMIEM300404K44F = true
        errorMessageAVRRMIEM300404K44F = nil

        // Simulate loading delay for better UX
        try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        let newQuestionsAVRRMIEM300404K44F = serviceAVRRMIEM300404K44F.getQuestionsAVRRMIEM300404K44F(
            topicAVRRMIEM300404K44F: trimmedTopicAVRRMIEM300404K44F,
            countAVRRMIEM300404K44F: desiredCountAVRRMIEM300404K44F
        )
        
        if newQuestionsAVRRMIEM300404K44F.isEmpty {
            errorMessageAVRRMIEM300404K44F = "No questions found for this topic. Try another topic."
        } else {
            questionsAVRRMIEM300404K44F = newQuestionsAVRRMIEM300404K44F
        }

        isLoadingAVRRMIEM300404K44F = false
    }
}

