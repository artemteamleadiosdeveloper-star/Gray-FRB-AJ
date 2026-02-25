import Foundation

struct QuizQuestionAVRRMIEM300404K44F: Identifiable, Hashable {
    let idAVRRMIEM300404K44F = UUID()
    let textAVRRMIEM300404K44F: String
    let answersAVRRMIEM300404K44F: [String]
    let correctAnswerIndexAVRRMIEM300404K44F: Int
    let topicAVRRMIEM300404K44F: String
    
    var id: UUID { idAVRRMIEM300404K44F }
    var correctAnswerAVRRMIEM300404K44F: String {
        answersAVRRMIEM300404K44F[correctAnswerIndexAVRRMIEM300404K44F]
    }
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








    func isCorrect(_ answerIndex: Int) -> Bool {
        return answerIndex == correctAnswerIndexAVRRMIEM300404K44F
    }
}

struct QuizQuestionDataAVRRMIEM300404K44F {
    let textAVRRMIEM300404K44F: String
    let answersAVRRMIEM300404K44F: [String]
    let correctAnswerIndexAVRRMIEM300404K44F: Int
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











}

