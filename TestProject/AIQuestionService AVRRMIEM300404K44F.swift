import Foundation

struct AIQuestionAVRRMIEM300404K44F: Identifiable, Hashable {
    let idAVRRMIEM300404K44F = UUID()
    let textAVRRMIEM300404K44F: String

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

enum SecretsAVRRMIEM300404K44F {
    static var apiKeyAVRRMIEM300404K44F: String {
        Bundle.main.object(forInfoDictionaryKey: "OPENAI_API_KEY") as? String ?? ""
    }
}

enum AIQuestionServiceErrorAVRRMIEM300404K44F: Error, LocalizedError {
    case missingAPIKeyAVRRMIEM300404K44F
    case invalidResponseAVRRMIEM300404K44F

    var errorDescription: String? {
        switch self {
        case .missingAPIKeyAVRRMIEM300404K44F:
            return "Відсутній API ключ OpenAI. Додайте OPENAI_API_KEY до Info.plist."
        case .invalidResponseAVRRMIEM300404K44F:
            return "Не вдалося обробити відповідь моделі."
        }
    }
}

struct OpenAIChatRequestAVRRMIEM300404K44F: Encodable {
    let modelAVRRMIEM300404K44F: String
    let messagesAVRRMIEM300404K44F: [OpenAIChatMessageAVRRMIEM300404K44F]
    let nAVRRMIEM300404K44F: Int
    let temperatureAVRRMIEM300404K44F: Double
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








enum CodingKeys: String, CodingKey {
        case modelAVRRMIEM300404K44F = "model"
        case messagesAVRRMIEM300404K44F = "messages"
        case nAVRRMIEM300404K44F = "n"
        case temperatureAVRRMIEM300404K44F = "temperature"
    }
}

struct OpenAIChatMessageAVRRMIEM300404K44F: Encodable {
    let roleAVRRMIEM300404K44F: String
    let contentAVRRMIEM300404K44F: String
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








enum CodingKeys: String, CodingKey {
        case roleAVRRMIEM300404K44F = "role"
        case contentAVRRMIEM300404K44F = "content"
    }
}

struct OpenAIChatResponseAVRRMIEM300404K44F: Decodable {
    let choicesAVRRMIEM300404K44F: [OpenAIChatChoiceAVRRMIEM300404K44F]
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








    enum CodingKeys: String, CodingKey {
        case choicesAVRRMIEM300404K44F = "choices"
    }
}

struct OpenAIChatChoiceAVRRMIEM300404K44F: Decodable {
    struct MessageAVRRMIEM300404K44F: Decodable {
        let contentAVRRMIEM300404K44F: String
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






    
        enum CodingKeys: String, CodingKey {
            case contentAVRRMIEM300404K44F = "content"
        }
    }

    let messageAVRRMIEM300404K44F: MessageAVRRMIEM300404K44F

    enum CodingKeys: String, CodingKey {
        case messageAVRRMIEM300404K44F = "message"
    }
}

final class AIQuestionServiceAVRRMIEM300404K44F {
    private let apiKeyAVRRMIEM300404K44F: String
    private let urlAVRRMIEM300404K44F = URL(string: "https://api.openai.com/v1/chat/completions")!

    init(apiKeyAVRRMIEM300404K44F: String = SecretsAVRRMIEM300404K44F.apiKeyAVRRMIEM300404K44F) {
        self.apiKeyAVRRMIEM300404K44F = apiKeyAVRRMIEM300404K44F
    }

    func generateQuestionsAVRRMIEM300404K44F(topicAVRRMIEM300404K44F: String, countAVRRMIEM300404K44F: Int) async throws -> [AIQuestionAVRRMIEM300404K44F] {
        guard !apiKeyAVRRMIEM300404K44F.isEmpty else {
            throw AIQuestionServiceErrorAVRRMIEM300404K44F.missingAPIKeyAVRRMIEM300404K44F
        }

        let systemPromptAVRRMIEM300404K44F = "You are a creative quiz master. Generate concise quiz questions."
        let userPromptAVRRMIEM300404K44F = """
        Create \(countAVRRMIEM300404K44F) unique question prompts about "\(topicAVRRMIEM300404K44F)". Respond with numbered questions only.
        """

        let payloadAVRRMIEM300404K44F = OpenAIChatRequestAVRRMIEM300404K44F(
            modelAVRRMIEM300404K44F: "gpt-4o-mini",
            messagesAVRRMIEM300404K44F: [
                OpenAIChatMessageAVRRMIEM300404K44F(roleAVRRMIEM300404K44F: "system", contentAVRRMIEM300404K44F: systemPromptAVRRMIEM300404K44F),
                OpenAIChatMessageAVRRMIEM300404K44F(roleAVRRMIEM300404K44F: "user", contentAVRRMIEM300404K44F: userPromptAVRRMIEM300404K44F)
            ],
            nAVRRMIEM300404K44F: 1,
            temperatureAVRRMIEM300404K44F: 0.7
        )

        let jsonDataAVRRMIEM300404K44F = try JSONEncoder().encode(payloadAVRRMIEM300404K44F)

        var requestAVRRMIEM300404K44F = URLRequest(url: urlAVRRMIEM300404K44F)
        requestAVRRMIEM300404K44F.httpMethod = "POST"
        requestAVRRMIEM300404K44F.httpBody = jsonDataAVRRMIEM300404K44F
        requestAVRRMIEM300404K44F.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestAVRRMIEM300404K44F.addValue("Bearer \(apiKeyAVRRMIEM300404K44F)", forHTTPHeaderField: "Authorization")

        let (dataAVRRMIEM300404K44F, responseAVRRMIEM300404K44F) = try await URLSession.shared.data(for: requestAVRRMIEM300404K44F)

        guard
            let httpResponseAVRRMIEM300404K44F = responseAVRRMIEM300404K44F as? HTTPURLResponse,
            200 ..< 300 ~= httpResponseAVRRMIEM300404K44F.statusCode
        else {
            throw AIQuestionServiceErrorAVRRMIEM300404K44F.invalidResponseAVRRMIEM300404K44F
        }

        let decodedAVRRMIEM300404K44F = try JSONDecoder().decode(OpenAIChatResponseAVRRMIEM300404K44F.self, from: dataAVRRMIEM300404K44F)
        guard let rawContentAVRRMIEM300404K44F = decodedAVRRMIEM300404K44F.choicesAVRRMIEM300404K44F.first?.messageAVRRMIEM300404K44F.contentAVRRMIEM300404K44F else {
            throw AIQuestionServiceErrorAVRRMIEM300404K44F.invalidResponseAVRRMIEM300404K44F
        }

        let parsedAVRRMIEM300404K44F = rawContentAVRRMIEM300404K44F
            .split(separator: "\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { lineAVRRMIEM300404K44F -> String in
                if let separatorRangeAVRRMIEM300404K44F = lineAVRRMIEM300404K44F.range(of: ". ") {
                    return String(lineAVRRMIEM300404K44F[separatorRangeAVRRMIEM300404K44F.upperBound...])
                }
                return lineAVRRMIEM300404K44F
            }

        return parsedAVRRMIEM300404K44F.map { AIQuestionAVRRMIEM300404K44F(textAVRRMIEM300404K44F: $0) }
    }
}

