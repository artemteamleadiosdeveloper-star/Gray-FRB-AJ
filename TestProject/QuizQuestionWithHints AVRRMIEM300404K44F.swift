import Foundation

struct QuizQuestionWithHintsAVRRMIEM300404K44F: Identifiable, Hashable {
    let idAVRRMIEM300404K44F = UUID()
    let textAVRRMIEM300404K44F: String  // Питання
    let correctAnswerAVRRMIEM300404K44F: String  // Правильна відповідь
    let hint1AVRRMIEM300404K44F: String  // Перша підказка
    let hint2AVRRMIEM300404K44F: String  // Друга підказка
    
    var id: UUID { idAVRRMIEM300404K44F }
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








    // Перевірка, чи відповідь правильна за текстом
    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ==
               correctAnswerAVRRMIEM300404K44F.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
}

