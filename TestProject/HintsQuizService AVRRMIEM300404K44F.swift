import Foundation

final class HintsQuizServiceAVRRMIEM300404K44F {
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







    // Quiz database with questions, answers, correct answers, and hints
    private let hintsQuizDatabaseAVRRMIEM300404K44F: [QuizQuestionWithHintsAVRRMIEM300404K44F] = [
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the primary purpose of SwiftUI?",
            correctAnswerAVRRMIEM300404K44F: "Build user interfaces for Apple platforms",
            hint1AVRRMIEM300404K44F: "It's used for creating visual interfaces",
            hint2AVRRMIEM300404K44F: "It's Apple's modern UI framework"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "Which property wrapper is used for state management in SwiftUI?",
            correctAnswerAVRRMIEM300404K44F: "@State",
            hint1AVRRMIEM300404K44F: "It starts with @ symbol",
            hint2AVRRMIEM300404K44F: "It's used for local view state"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the capital of France?",
            correctAnswerAVRRMIEM300404K44F: "Paris",
            hint1AVRRMIEM300404K44F: "It's known as the City of Light",
            hint2AVRRMIEM300404K44F: "The Eiffel Tower is located here"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What does CPU stand for?",
            correctAnswerAVRRMIEM300404K44F: "Central Processing Unit",
            hint1AVRRMIEM300404K44F: "It's the brain of the computer",
            hint2AVRRMIEM300404K44F: "It processes instructions"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the largest planet in our solar system?",
            correctAnswerAVRRMIEM300404K44F: "Jupiter",
            hint1AVRRMIEM300404K44F: "It has a Great Red Spot",
            hint2AVRRMIEM300404K44F: "It's a gas giant"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the speed of light?",
            correctAnswerAVRRMIEM300404K44F: "299,792,458 m/s",
            hint1AVRRMIEM300404K44F: "It's approximately 300,000 km/s",
            hint2AVRRMIEM300404K44F: "Nothing can travel faster than this"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is photosynthesis?",
            correctAnswerAVRRMIEM300404K44F: "Plants converting light to energy",
            hint1AVRRMIEM300404K44F: "Plants do this process",
            hint2AVRRMIEM300404K44F: "It involves sunlight and carbon dioxide"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the smallest prime number?",
            correctAnswerAVRRMIEM300404K44F: "2",
            hint1AVRRMIEM300404K44F: "It's an even number",
            hint2AVRRMIEM300404K44F: "It's the only even prime number"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the chemical symbol for gold?",
            correctAnswerAVRRMIEM300404K44F: "Au",
            hint1AVRRMIEM300404K44F: "It comes from the Latin word 'aurum'",
            hint2AVRRMIEM300404K44F: "It's two letters"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the longest river in the world?",
            correctAnswerAVRRMIEM300404K44F: "Nile",
            hint1AVRRMIEM300404K44F: "It flows through Egypt",
            hint2AVRRMIEM300404K44F: "It's in Africa"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the highest mountain in the world?",
            correctAnswerAVRRMIEM300404K44F: "Mount Everest",
            hint1AVRRMIEM300404K44F: "It's in the Himalayas",
            hint2AVRRMIEM300404K44F: "It's over 8,800 meters tall"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the largest ocean?",
            correctAnswerAVRRMIEM300404K44F: "Pacific Ocean",
            hint1AVRRMIEM300404K44F: "It covers about one-third of Earth",
            hint2AVRRMIEM300404K44F: "It's between Asia and the Americas"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the capital of Japan?",
            correctAnswerAVRRMIEM300404K44F: "Tokyo",
            hint1AVRRMIEM300404K44F: "It's the most populous city in Japan",
            hint2AVRRMIEM300404K44F: "It hosted the 2020 Olympics"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the chemical symbol for oxygen?",
            correctAnswerAVRRMIEM300404K44F: "O",
            hint1AVRRMIEM300404K44F: "It's a single letter",
            hint2AVRRMIEM300404K44F: "We breathe this gas"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the smallest country in the world?",
            correctAnswerAVRRMIEM300404K44F: "Vatican City",
            hint1AVRRMIEM300404K44F: "It's located in Rome",
            hint2AVRRMIEM300404K44F: "The Pope lives here"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the largest country by area?",
            correctAnswerAVRRMIEM300404K44F: "Russia",
            hint1AVRRMIEM300404K44F: "It spans two continents",
            hint2AVRRMIEM300404K44F: "It's in both Europe and Asia"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the normal body temperature in Celsius?",
            correctAnswerAVRRMIEM300404K44F: "37°C",
            hint1AVRRMIEM300404K44F: "It's close to 100°F",
            hint2AVRRMIEM300404K44F: "It's slightly above 36.5°C"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the hardest natural substance?",
            correctAnswerAVRRMIEM300404K44F: "Diamond",
            hint1AVRRMIEM300404K44F: "It's made of carbon",
            hint2AVRRMIEM300404K44F: "It's used in jewelry"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the speed of sound?",
            correctAnswerAVRRMIEM300404K44F: "343 m/s",
            hint1AVRRMIEM300404K44F: "It's approximately 1,235 km/h",
            hint2AVRRMIEM300404K44F: "It's slower than light"
        ),
        QuizQuestionWithHintsAVRRMIEM300404K44F(
            textAVRRMIEM300404K44F: "What is the largest mammal?",
            correctAnswerAVRRMIEM300404K44F: "Blue whale",
            hint1AVRRMIEM300404K44F: "It lives in the ocean",
            hint2AVRRMIEM300404K44F: "It's much larger than an elephant"
        )
    ]
    
    func getRandomHintsQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: Int) -> [QuizQuestionWithHintsAVRRMIEM300404K44F] {
        let shuffled = hintsQuizDatabaseAVRRMIEM300404K44F.shuffled()
        return Array(shuffled.prefix(countAVRRMIEM300404K44F))
    }
    
    var totalQuestionsAVRRMIEM300404K44F: Int {
        hintsQuizDatabaseAVRRMIEM300404K44F.count
    }
}

