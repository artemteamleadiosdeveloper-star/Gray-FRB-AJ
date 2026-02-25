import Foundation

struct QuestionAVRRMIEM300404K44F: Identifiable, Hashable {
    let idAVRRMIEM300404K44F = UUID()
    let textAVRRMIEM300404K44F: String
    let topicAVRRMIEM300404K44F: String
    
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











}

final class QuestionServiceAVRRMIEM300404K44F {
    // Static questions database
    private let questionsDatabaseAVRRMIEM300404K44F: [String: [String]] = [
        "SwiftUI": [
            "What is the primary purpose of SwiftUI?",
            "Which property wrapper is used for state management in SwiftUI?",
            "What is the difference between @State and @Binding?",
            "How do you create a navigation view in SwiftUI?",
            "What is a ViewBuilder in SwiftUI?",
            "How do you handle user input in SwiftUI?",
            "What is the purpose of the ObservableObject protocol?",
            "How do you create custom modifiers in SwiftUI?"
        ],
        "iOS": [
            "What is the iOS architecture pattern?",
            "What is the difference between UIKit and SwiftUI?",
            "What is the App Lifecycle in iOS?",
            "How do you handle memory management in iOS?",
            "What is Auto Layout?",
            "What are the main iOS design patterns?",
            "How does delegation work in iOS?",
            "What is Core Data used for?"
        ],
        "Programming": [
            "What is object-oriented programming?",
            "What is the difference between a class and a struct?",
            "What is polymorphism?",
            "What is an algorithm?",
            "What is recursion?",
            "What is the difference between stack and heap?",
            "What is a closure?",
            "What is dependency injection?"
        ],
        "General Knowledge": [
            "What is the capital of France?",
            "Who wrote Romeo and Juliet?",
            "What is the largest planet in our solar system?",
            "What is the chemical symbol for water?",
            "Who painted the Mona Lisa?",
            "What is the speed of light?",
            "What is the smallest prime number?",
            "What year did World War II end?"
        ],
        "Technology": [
            "What does CPU stand for?",
            "What is the difference between RAM and ROM?",
            "What is cloud computing?",
            "What is machine learning?",
            "What is the purpose of a firewall?",
            "What is a database?",
            "What is the difference between HTTP and HTTPS?",
            "What is an API?"
        ]
    ]
    
    func getQuestionsAVRRMIEM300404K44F(topicAVRRMIEM300404K44F: String, countAVRRMIEM300404K44F: Int) -> [QuestionAVRRMIEM300404K44F] {
        let normalizedTopicAVRRMIEM300404K44F = topicAVRRMIEM300404K44F.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        // Try to find matching topic in database
        var matchedQuestionsAVRRMIEM300404K44F: [String] = []
        
        for (key, questions) in questionsDatabaseAVRRMIEM300404K44F {
            if key.lowercased().contains(normalizedTopicAVRRMIEM300404K44F) || normalizedTopicAVRRMIEM300404K44F.contains(key.lowercased()) {
                matchedQuestionsAVRRMIEM300404K44F = questions
                break
            }
        }
        
        // If no exact match, try partial match
        if matchedQuestionsAVRRMIEM300404K44F.isEmpty {
            for (key, questions) in questionsDatabaseAVRRMIEM300404K44F {
                let keyWords = key.lowercased().components(separatedBy: .whitespaces)
                let topicWords = normalizedTopicAVRRMIEM300404K44F.components(separatedBy: .whitespaces)
                
                if keyWords.contains(where: { topicWords.contains($0) }) ||
                   topicWords.contains(where: { keyWords.contains($0) }) {
                    matchedQuestionsAVRRMIEM300404K44F = questions
                    break
                }
            }
        }
        
        // If still no match, return General Knowledge questions
        if matchedQuestionsAVRRMIEM300404K44F.isEmpty {
            matchedQuestionsAVRRMIEM300404K44F = questionsDatabaseAVRRMIEM300404K44F["General Knowledge"] ?? []
        }
        
        // Limit and return questions
        let selectedQuestionsAVRRMIEM300404K44F = Array(matchedQuestionsAVRRMIEM300404K44F.prefix(min(countAVRRMIEM300404K44F, matchedQuestionsAVRRMIEM300404K44F.count)))
        
        return selectedQuestionsAVRRMIEM300404K44F.map { QuestionAVRRMIEM300404K44F(textAVRRMIEM300404K44F: $0, topicAVRRMIEM300404K44F: topicAVRRMIEM300404K44F) }
    }
}

