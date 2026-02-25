import Foundation

final class QuizServiceAVRRMIEM300404K44F {
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







    // Full quiz database with questions, answers, and correct answers
    private let quizDatabaseAVRRMIEM300404K44F: [String: [QuizQuestionDataAVRRMIEM300404K44F]] = [
        "SwiftUI": [
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the primary purpose of SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Build user interfaces for Apple platforms",
                    "Manage database operations",
                    "Handle network requests",
                    "Process images"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Which property wrapper is used for state management in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "@State",
                    "@Published",
                    "@Binding",
                    "@Environment"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between @State and @Binding?",
                answersAVRRMIEM300404K44F: [
                    "@State owns the data, @Binding RSKRerences it",
                    "@Binding owns the data, @State RSKRerences it",
                    "They are identical",
                    "@State is for structs, @Binding is for classes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How do you create a navigation view in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "NavigationStack",
                    "NavigationView",
                    "UINavigationController",
                    "NavigationController"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a ViewBuilder in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "A function builder for composing views",
                    "A view container",
                    "A layout manager",
                    "A data model"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does @Published do in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Makes properties observable in Combine",
                    "Manages view state",
                    "Handles navigation",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @ObservedObject used for?",
                answersAVRRMIEM300404K44F: [
                    "Observing external objects",
                    "Managing local state",
                    "Handling gestures",
                    "Creating layouts"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How do you add padding to a view in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    ".padding() modifier",
                    ".spacing() modifier",
                    ".margin() modifier",
                    ".offset() modifier"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a List in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "A container for displaying rows of data",
                    "A navigation container",
                    "A button style",
                    "A text view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @Environment used for?",
                answersAVRRMIEM300404K44F: [
                    "Accessing shared values from environment",
                    "Managing local state",
                    "Handling user input",
                    "Creating animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a VStack in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Vertical stack of views",
                    "Horizontal stack of views",
                    "A navigation stack",
                    "A scrollable view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a HStack in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Horizontal stack of views",
                    "Vertical stack of views",
                    "A navigation stack",
                    "A scrollable view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is ZStack used for?",
                answersAVRRMIEM300404K44F: [
                    "Overlaying views on top of each other",
                    "Creating horizontal layouts",
                    "Creating vertical layouts",
                    "Managing navigation"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a ScrollView in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "A scrollable container for content",
                    "A navigation view",
                    "A button",
                    "A text field"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @StateObject?",
                answersAVRRMIEM300404K44F: [
                    "Owns and manages an observable object",
                    "Observes an external object",
                    "Manages local state",
                    "Handles user input"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Button in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "A tappable control",
                    "A text view",
                    "An image view",
                    "A navigation link"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is TextField used for?",
                answersAVRRMIEM300404K44F: [
                    "User text input",
                    "Displaying text",
                    "Showing images",
                    "Handling gestures"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Image in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Displays images",
                    "Displays text",
                    "Creates buttons",
                    "Handles input"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Spacer in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Flexible space between views",
                    "A fixed width view",
                    "A button",
                    "A text view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @EnvironmentObject?",
                answersAVRRMIEM300404K44F: [
                    "Observes objects from environment",
                    "Manages local state",
                    "Creates new objects",
                    "Handles animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Form in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Container for grouping controls",
                    "A text view",
                    "An image view",
                    "A button style"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Toggle in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Switch between two states",
                    "A button",
                    "A text field",
                    "A slider"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Stepper in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Increment/decrement numeric value",
                    "Navigate between views",
                    "Switch states",
                    "Display text"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Picker in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Select from multiple options",
                    "Display text",
                    "Handle gestures",
                    "Create animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Slider in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Select a value from a range",
                    "Display text",
                    "Navigate views",
                    "Switch states"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a ProgressView?",
                answersAVRRMIEM300404K44F: [
                    "Shows task progress",
                    "Displays text",
                    "Handles input",
                    "Creates buttons"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .onAppear modifier?",
                answersAVRRMIEM300404K44F: [
                    "Runs code when view appears",
                    "Runs code when view disappears",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .onDisappear modifier?",
                answersAVRRMIEM300404K44F: [
                    "Runs code when view disappears",
                    "Runs code when view appears",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a NavigationLink?",
                answersAVRRMIEM300404K44F: [
                    "Links to another view",
                    "Displays text",
                    "Shows images",
                    "Handles input"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Sheet modifier?",
                answersAVRRMIEM300404K44F: [
                    "Presents a modal view",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .fullScreenCover?",
                answersAVRRMIEM300404K44F: [
                    "Presents full-screen modal",
                    "Displays half-screen modal",
                    "Handles gestures",
                    "Creates transitions"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Divider?",
                answersAVRRMIEM300404K44F: [
                    "Visual separator line",
                    "A button",
                    "A text view",
                    "An image"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @FocusState?",
                answersAVRRMIEM300404K44F: [
                    "Manages focus state",
                    "Manages view state",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Group in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Groups multiple views",
                    "A single view",
                    "A button",
                    "A text field"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .toolbar modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds toolbar items",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a TabView?",
                answersAVRRMIEM300404K44F: [
                    "Container for tab-based navigation",
                    "A single view",
                    "A button",
                    "A text field"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .searchable modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds search functionality",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a LazyVStack?",
                answersAVRRMIEM300404K44F: [
                    "Lazy vertical stack",
                    "A regular vertical stack",
                    "A button",
                    "A text view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a LazyHStack?",
                answersAVRRMIEM300404K44F: [
                    "Lazy horizontal stack",
                    "A regular horizontal stack",
                    "A button",
                    "A text view"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .RSKRreshable modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds pull-to-RSKRresh",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a GeometryReader?",
                answersAVRRMIEM300404K44F: [
                    "Reads view geometry",
                    "Displays text",
                    "Handles input",
                    "Creates buttons"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @AppStorage?",
                answersAVRRMIEM300404K44F: [
                    "Stores values in UserDefaults",
                    "Manages view state",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a DisclosureGroup?",
                answersAVRRMIEM300404K44F: [
                    "Expandable/collapsible content",
                    "A button",
                    "A text view",
                    "An image"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .alert modifier?",
                answersAVRRMIEM300404K44F: [
                    "Presents alert dialog",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .confirmationDialog?",
                answersAVRRMIEM300404K44F: [
                    "Presents confirmation dialog",
                    "Displays alert",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Menu in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Dropdown menu of actions",
                    "A button",
                    "A text view",
                    "A navigation link"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .contextMenu modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds long-press menu",
                    "Displays text",
                    "Handles tap",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Section in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Groups related content",
                    "A single view",
                    "A button",
                    "A text field"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .navigationTitle?",
                answersAVRRMIEM300404K44F: [
                    "Sets navigation title",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .badge modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds badge to view",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Label?",
                answersAVRRMIEM300404K44F: [
                    "Icon and text together",
                    "Only text",
                    "Only icon",
                    "A button"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .onChange modifier?",
                answersAVRRMIEM300404K44F: [
                    "Observes value changes",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a ForEach in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Loops through collection",
                    "A single view",
                    "A button",
                    "A text field"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .sheet modifier?",
                answersAVRRMIEM300404K44F: [
                    "Presents modal sheet",
                    "Displays full screen",
                    "Handles gestures",
                    "Creates transitions"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .popover modifier?",
                answersAVRRMIEM300404K44F: [
                    "Presents popover",
                    "Displays sheet",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Color in SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "Represents a color",
                    "A text view",
                    "A button",
                    "An image"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .foregroundColor?",
                answersAVRRMIEM300404K44F: [
                    "Sets text/foreground color",
                    "Sets background color",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .background modifier?",
                answersAVRRMIEM300404K44F: [
                    "Sets background",
                    "Sets foreground",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .overlay modifier?",
                answersAVRRMIEM300404K44F: [
                    "Overlays view on top",
                    "Sets background",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .clipShape modifier?",
                answersAVRRMIEM300404K44F: [
                    "Clips view to shape",
                    "Displays text",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .cornerRadius modifier?",
                answersAVRRMIEM300404K44F: [
                    "Rounds corners",
                    "Adds shadow",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .shadow modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds shadow effect",
                    "Rounds corners",
                    "Handles gestures",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .blur modifier?",
                answersAVRRMIEM300404K44F: [
                    "Applies blur effect",
                    "Adds shadow",
                    "Rounds corners",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .opacity modifier?",
                answersAVRRMIEM300404K44F: [
                    "Sets view opacity",
                    "Adds shadow",
                    "Rounds corners",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .scaleEffect modifier?",
                answersAVRRMIEM300404K44F: [
                    "Scales view size",
                    "Adds shadow",
                    "Rounds corners",
                    "Changes color"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .rotationEffect modifier?",
                answersAVRRMIEM300404K44F: [
                    "Rotates view",
                    "Scales view",
                    "Adds shadow",
                    "Changes color"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .animation modifier?",
                answersAVRRMIEM300404K44F: [
                    "Animates changes",
                    "Displays text",
                    "Handles gestures",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .transition modifier?",
                answersAVRRMIEM300404K44F: [
                    "Defines view transition",
                    "Displays text",
                    "Handles gestures",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .gesture modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds gesture recognizer",
                    "Displays text",
                    "Manages state",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a DragGesture?",
                answersAVRRMIEM300404K44F: [
                    "Detects drag gestures",
                    "Detects tap",
                    "Displays text",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a TapGesture?",
                answersAVRRMIEM300404K44F: [
                    "Detects tap gestures",
                    "Detects drag",
                    "Displays text",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .onTapGesture?",
                answersAVRRMIEM300404K44F: [
                    "Handles tap gesture",
                    "Handles drag",
                    "Displays text",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .onLongPressGesture?",
                answersAVRRMIEM300404K44F: [
                    "Handles long press",
                    "Handles tap",
                    "Displays text",
                    "Manages state"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is .swipeActions modifier?",
                answersAVRRMIEM300404K44F: [
                    "Adds swipe actions",
                    "Displays text",
                    "Handles tap",
                    "Creates animations"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            )
        ],
        "iOS": [
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the iOS architecture pattern?",
                answersAVRRMIEM300404K44F: [
                    "MVC, MVVM, VIPER",
                    "REST API",
                    "Singleton",
                    "Observer"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between UIKit and SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "SwiftUI is declarative, UIKit is imperative",
                    "UIKit is declarative, SwiftUI is imperative",
                    "They are the same",
                    "SwiftUI only works on iOS"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the App Lifecycle in iOS?",
                answersAVRRMIEM300404K44F: [
                    "The sequence of app states from launch to termination",
                    "The app update process",
                    "The app review process",
                    "The app deployment process"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How do you handle memory management in iOS?",
                answersAVRRMIEM300404K44F: [
                    "ARC (Automatic RSKRerence Counting)",
                    "Manual memory management",
                    "Garbage collection",
                    "Memory pools"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Core Data used for?",
                answersAVRRMIEM300404K44F: [
                    "Persistence and data modeling",
                    "Network requests",
                    "UI rendering",
                    "Authentication"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the minimum iOS version for SwiftUI?",
                answersAVRRMIEM300404K44F: [
                    "iOS 13",
                    "iOS 12",
                    "iOS 14",
                    "iOS 15"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Auto Layout?",
                answersAVRRMIEM300404K44F: [
                    "Constraint-based layout system",
                    "Manual frame calculation",
                    "Absolute positioning",
                    "CSS-like styling"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a ViewController?",
                answersAVRRMIEM300404K44F: [
                    "Manages view lifecycle",
                    "Displays views",
                    "Handles data",
                    "Manages networking"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the AppDelegate?",
                answersAVRRMIEM300404K44F: [
                    "Manages app lifecycle events",
                    "Handles UI",
                    "Manages data",
                    "Handles networking"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is SceneDelegate?",
                answersAVRRMIEM300404K44F: [
                    "Manages scene lifecycle",
                    "Handles UI",
                    "Manages data",
                    "Handles networking"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is UserDefaults?",
                answersAVRRMIEM300404K44F: [
                    "Simple key-value storage",
                    "Database system",
                    "File system",
                    "Network storage"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Keychain?",
                answersAVRRMIEM300404K44F: [
                    "Secure credential storage",
                    "Database system",
                    "File system",
                    "Network storage"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is URLSession?",
                answersAVRRMIEM300404K44F: [
                    "Network request API",
                    "Database API",
                    "UI API",
                    "Animation API"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is NotificationCenter?",
                answersAVRRMIEM300404K44F: [
                    "Broadcasts notifications",
                    "Sends emails",
                    "Displays alerts",
                    "Manages data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Combine framework?",
                answersAVRRMIEM300404K44F: [
                    "Reactive programming framework",
                    "UI framework",
                    "Database framework",
                    "Animation framework"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is GCD (Grand Central Dispatch)?",
                answersAVRRMIEM300404K44F: [
                    "Concurrency framework",
                    "UI framework",
                    "Database framework",
                    "Animation framework"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a weak RSKRerence?",
                answersAVRRMIEM300404K44F: [
                    "Non-owning RSKRerence",
                    "Owning RSKRerence",
                    "Strong RSKRerence",
                    "Unretained RSKRerence"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a strong RSKRerence cycle?",
                answersAVRRMIEM300404K44F: [
                    "Memory leak from mutual RSKRerences",
                    "Fast RSKRerence",
                    "Weak RSKRerence",
                    "Temporary RSKRerence"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @escaping in Swift?",
                answersAVRRMIEM300404K44F: [
                    "Closure escapes function scope",
                    "Closure stays in scope",
                    "Closure is synchronous",
                    "Closure is private"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a protocol in Swift?",
                answersAVRRMIEM300404K44F: [
                    "Contract defining methods/properties",
                    "A class",
                    "A struct",
                    "An enum"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an extension in Swift?",
                answersAVRRMIEM300404K44F: [
                    "Adds functionality to existing types",
                    "Creates new types",
                    "Deletes functionality",
                    "Imports modules"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an enum in Swift?",
                answersAVRRMIEM300404K44F: [
                    "Defines related values",
                    "A class",
                    "A struct",
                    "A protocol"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is associated value in enum?",
                answersAVRRMIEM300404K44F: [
                    "Additional data with enum case",
                    "Enum case name",
                    "Enum raw value",
                    "Enum method"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a guard statement?",
                answersAVRRMIEM300404K44F: [
                    "Early exit condition check",
                    "Loop statement",
                    "Function declaration",
                    "Variable declaration"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is optional chaining?",
                answersAVRRMIEM300404K44F: [
                    "Safely accessing optionals",
                    "Chaining functions",
                    "Looping optionals",
                    "Deleting optionals"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is nil-coalescing operator?",
                answersAVRRMIEM300404K44F: [
                    "?? provides default value",
                    "? optional",
                    "! force unwrap",
                    "& RSKRerence"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a computed property?",
                answersAVRRMIEM300404K44F: [
                    "Property calculated on access",
                    "Stored property",
                    "Lazy property",
                    "Static property"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a lazy property?",
                answersAVRRMIEM300404K44F: [
                    "Initialized when first accessed",
                    "Initialized immediately",
                    "Never initialized",
                    "Always nil"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @available attribute?",
                answersAVRRMIEM300404K44F: [
                    "Specifies API availability",
                    "Marks deprecated code",
                    "Creates new API",
                    "Deletes API"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @discardableResult?",
                answersAVRRMIEM300404K44F: [
                    "Allows ignoring return value",
                    "Forces using return value",
                    "Deletes return value",
                    "Hides return value"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a singleton pattern?",
                answersAVRRMIEM300404K44F: [
                    "Single shared instance",
                    "Multiple instances",
                    "No instances",
                    "Temporary instance"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is delegation pattern?",
                answersAVRRMIEM300404K44F: [
                    "Object delegates work to another",
                    "Inheritance pattern",
                    "Composition pattern",
                    "Singleton pattern"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is KVO (Key-Value Observing)?",
                answersAVRRMIEM300404K44F: [
                    "Observes property changes",
                    "Observes method calls",
                    "Observes class creation",
                    "Observes memory"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a completion handler?",
                answersAVRRMIEM300404K44F: [
                    "Callback when task completes",
                    "Error handler",
                    "Progress handler",
                    "Cancel handler"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is async/await?",
                answersAVRRMIEM300404K44F: [
                    "Modern asynchronous syntax",
                    "Synchronous syntax",
                    "Database syntax",
                    "UI syntax"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Task in Swift concurrency?",
                answersAVRRMIEM300404K44F: [
                    "Unit of asynchronous work",
                    "Synchronous work",
                    "Database operation",
                    "UI operation"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Actor in Swift?",
                answersAVRRMIEM300404K44F: [
                    "Thread-safe RSKRerence type",
                    "Thread-unsafe type",
                    "Database type",
                    "UI type"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @MainActor?",
                answersAVRRMIEM300404K44F: [
                    "Ensures main thread execution",
                    "Background thread",
                    "Any thread",
                    "No thread"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DispatchQueue?",
                answersAVRRMIEM300404K44F: [
                    "Manages task execution queue",
                    "Manages database",
                    "Manages UI",
                    "Manages memory"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DispatchQueue.main?",
                answersAVRRMIEM300404K44F: [
                    "Main thread queue",
                    "Background queue",
                    "Global queue",
                    "Custom queue"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DispatchQueue.global?",
                answersAVRRMIEM300404K44F: [
                    "Background thread queue",
                    "Main thread queue",
                    "Custom queue",
                    "Serial queue"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a serial queue?",
                answersAVRRMIEM300404K44F: [
                    "Tasks execute one at a time",
                    "Tasks execute in parallel",
                    "Tasks never execute",
                    "Tasks execute randomly"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a concurrent queue?",
                answersAVRRMIEM300404K44F: [
                    "Tasks execute in parallel",
                    "Tasks execute sequentially",
                    "Tasks never execute",
                    "Tasks execute randomly"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DispatchGroup?",
                answersAVRRMIEM300404K44F: [
                    "Groups related tasks",
                    "Single task",
                    "No tasks",
                    "Random tasks"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DispatchSemaphore?",
                answersAVRRMIEM300404K44F: [
                    "Controls access to resource",
                    "Manages queue",
                    "Manages memory",
                    "Manages UI"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a retain cycle?",
                answersAVRRMIEM300404K44F: [
                    "Memory leak from circular references",
                    "Fast reference",
                    "Weak reference",
                    "Temporary reference"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is deinit?",
                answersAVRRMIEM300404K44F: [
                    "Deinitializer called before deallocation",
                    "Initializer",
                    "Method",
                    "Property"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Codable?",
                answersAVRRMIEM300404K44F: [
                    "Encodes/decodes to/from data",
                    "Displays data",
                    "Deletes data",
                    "Copies data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is JSONEncoder?",
                answersAVRRMIEM300404K44F: [
                    "Encodes objects to JSON",
                    "Decodes JSON",
                    "Displays JSON",
                    "Deletes JSON"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is JSONDecoder?",
                answersAVRRMIEM300404K44F: [
                    "Decodes JSON to objects",
                    "Encodes objects",
                    "Displays JSON",
                    "Deletes JSON"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is PropertyListEncoder?",
                answersAVRRMIEM300404K44F: [
                    "Encodes to property list",
                    "Decodes property list",
                    "Displays property list",
                    "Deletes property list"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is FileManager?",
                answersAVRRMIEM300404K44F: [
                    "Manages file system",
                    "Manages database",
                    "Manages UI",
                    "Manages network"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Bundle?",
                answersAVRRMIEM300404K44F: [
                    "App's resource container",
                    "Database",
                    "Network",
                    "UI component"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a plist file?",
                answersAVRRMIEM300404K44F: [
                    "Property list configuration file",
                    "Database file",
                    "Image file",
                    "Video file"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Info.plist?",
                answersAVRRMIEM300404K44F: [
                    "App configuration file",
                    "Database file",
                    "Code file",
                    "Image file"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a storyboard?",
                answersAVRRMIEM300404K44F: [
                    "Visual UI design file",
                    "Code file",
                    "Database file",
                    "Image file"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a xib file?",
                answersAVRRMIEM300404K44F: [
                    "Interface Builder file",
                    "Code file",
                    "Database file",
                    "Image file"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Interface Builder?",
                answersAVRRMIEM300404K44F: [
                    "Visual UI editor",
                    "Code editor",
                    "Database editor",
                    "Image editor"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is IBOutlet?",
                answersAVRRMIEM300404K44F: [
                    "Connection from code to UI",
                    "Connection from UI to code",
                    "Database connection",
                    "Network connection"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is IBAction?",
                answersAVRRMIEM300404K44F: [
                    "Connection from UI to code method",
                    "Connection from code to UI",
                    "Database connection",
                    "Network connection"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @IBDesignable?",
                answersAVRRMIEM300404K44F: [
                    "Live preview in Interface Builder",
                    "Runtime only",
                    "Database property",
                    "Network property"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is @IBInspectable?",
                answersAVRRMIEM300404K44F: [
                    "Editable property in Interface Builder",
                    "Read-only property",
                    "Private property",
                    "Static property"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            )
        ],
        "Programming": [
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is object-oriented programming?",
                answersAVRRMIEM300404K44F: [
                    "Programming paradigm based on objects",
                    "Programming without objects",
                    "Functional programming",
                    "Procedural programming"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between a class and a struct?",
                answersAVRRMIEM300404K44F: [
                    "Classes are reference types, structs are value types",
                    "Structs are reference types, classes are value types",
                    "They are identical",
                    "Classes don't support inheritance"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is polymorphism?",
                answersAVRRMIEM300404K44F: [
                    "Ability of objects to take multiple forms",
                    "Multiple inheritance",
                    "Type conversion",
                    "Memory allocation"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is recursion?",
                answersAVRRMIEM300404K44F: [
                    "A function calling itself",
                    "A loop construct",
                    "A data structure",
                    "An algorithm pattern"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a closure?",
                answersAVRRMIEM300404K44F: [
                    "Self-contained block of functionality",
                    "A variable",
                    "A function type",
                    "A protocol"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an algorithm?",
                answersAVRRMIEM300404K44F: [
                    "Step-by-step problem-solving procedure",
                    "A programming language",
                    "A data structure",
                    "A variable"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a variable?",
                answersAVRRMIEM300404K44F: [
                    "Storage location with a name",
                    "A function",
                    "A class",
                    "A protocol"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a function?",
                answersAVRRMIEM300404K44F: [
                    "Reusable block of code",
                    "A variable",
                    "A data type",
                    "A keyword"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a loop?",
                answersAVRRMIEM300404K44F: [
                    "Repeats code multiple times",
                    "A variable",
                    "A function",
                    "A class"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a condition?",
                answersAVRRMIEM300404K44F: [
                    "Boolean expression for decision making",
                    "A loop",
                    "A variable",
                    "A function"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an array?",
                answersAVRRMIEM300404K44F: [
                    "Ordered collection of elements",
                    "A single value",
                    "A function",
                    "A class"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a dictionary?",
                answersAVRRMIEM300404K44F: [
                    "Key-value pair collection",
                    "An array",
                    "A string",
                    "A number"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a set?",
                answersAVRRMIEM300404K44F: [
                    "Unordered unique elements collection",
                    "An array",
                    "A dictionary",
                    "A string"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a string?",
                answersAVRRMIEM300404K44F: [
                    "Sequence of characters",
                    "A number",
                    "A boolean",
                    "An array"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an integer?",
                answersAVRRMIEM300404K44F: [
                    "Whole number",
                    "Decimal number",
                    "Text",
                    "Boolean"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a float?",
                answersAVRRMIEM300404K44F: [
                    "Decimal number",
                    "Whole number",
                    "Text",
                    "Boolean"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a boolean?",
                answersAVRRMIEM300404K44F: [
                    "True or false value",
                    "A number",
                    "Text",
                    "An array"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is inheritance?",
                answersAVRRMIEM300404K44F: [
                    "Deriving new class from existing",
                    "Creating new class",
                    "Deleting class",
                    "Copying class"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is encapsulation?",
                answersAVRRMIEM300404K44F: [
                    "Hiding internal implementation",
                    "Showing everything",
                    "Deleting code",
                    "Copying code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is abstraction?",
                answersAVRRMIEM300404K44F: [
                    "Simplifying complex systems",
                    "Complicating systems",
                    "Deleting systems",
                    "Copying systems"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a constructor?",
                answersAVRRMIEM300404K44F: [
                    "Initializes new object",
                    "Deletes object",
                    "Copies object",
                    "Displays object"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a destructor?",
                answersAVRRMIEM300404K44F: [
                    "Cleans up object before deletion",
                    "Creates object",
                    "Copies object",
                    "Displays object"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is method overloading?",
                answersAVRRMIEM300404K44F: [
                    "Multiple methods with same name",
                    "Single method",
                    "No methods",
                    "Deleted methods"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is method overriding?",
                answersAVRRMIEM300404K44F: [
                    "Replacing parent method in child",
                    "Creating new method",
                    "Deleting method",
                    "Copying method"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a pointer?",
                answersAVRRMIEM300404K44F: [
                    "Reference to memory address",
                    "A value",
                    "A function",
                    "A class"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a reference?",
                answersAVRRMIEM300404K44F: [
                    "Alias to existing variable",
                    "New variable",
                    "Deleted variable",
                    "Copied variable"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is garbage collection?",
                answersAVRRMIEM300404K44F: [
                    "Automatic memory management",
                    "Manual memory management",
                    "No memory management",
                    "Memory leak"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a stack?",
                answersAVRRMIEM300404K44F: [
                    "LIFO data structure",
                    "FIFO data structure",
                    "Random access structure",
                    "Tree structure"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a queue?",
                answersAVRRMIEM300404K44F: [
                    "FIFO data structure",
                    "LIFO data structure",
                    "Random access structure",
                    "Tree structure"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a linked list?",
                answersAVRRMIEM300404K44F: [
                    "Nodes connected by pointers",
                    "Array structure",
                    "Tree structure",
                    "Hash structure"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a binary tree?",
                answersAVRRMIEM300404K44F: [
                    "Tree with max 2 children per node",
                    "Tree with 1 child",
                    "Tree with 3 children",
                    "Linear structure"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a hash table?",
                answersAVRRMIEM300404K44F: [
                    "Key-value mapping structure",
                    "Array structure",
                    "Tree structure",
                    "List structure"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Big O notation?",
                answersAVRRMIEM300404K44F: [
                    "Algorithm complexity measure",
                    "Algorithm speed",
                    "Algorithm name",
                    "Algorithm type"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is O(1) complexity?",
                answersAVRRMIEM300404K44F: [
                    "Constant time",
                    "Linear time",
                    "Quadratic time",
                    "Exponential time"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is O(n) complexity?",
                answersAVRRMIEM300404K44F: [
                    "Linear time",
                    "Constant time",
                    "Quadratic time",
                    "Exponential time"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is O(n²) complexity?",
                answersAVRRMIEM300404K44F: [
                    "Quadratic time",
                    "Constant time",
                    "Linear time",
                    "Exponential time"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is sorting?",
                answersAVRRMIEM300404K44F: [
                    "Arranging data in order",
                    "Deleting data",
                    "Copying data",
                    "Displaying data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is searching?",
                answersAVRRMIEM300404K44F: [
                    "Finding element in collection",
                    "Deleting element",
                    "Adding element",
                    "Sorting elements"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is binary search?",
                answersAVRRMIEM300404K44F: [
                    "Search in sorted array by dividing",
                    "Linear search",
                    "Random search",
                    "Hash search"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is linear search?",
                answersAVRRMIEM300404K44F: [
                    "Check each element sequentially",
                    "Divide and conquer",
                    "Hash lookup",
                    "Tree traversal"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a merge sort?",
                answersAVRRMIEM300404K44F: [
                    "Divide and conquer sorting",
                    "Bubble sort",
                    "Quick sort",
                    "Insertion sort"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is quick sort?",
                answersAVRRMIEM300404K44F: [
                    "Partition-based sorting",
                    "Bubble sort",
                    "Merge sort",
                    "Selection sort"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is bubble sort?",
                answersAVRRMIEM300404K44F: [
                    "Compare and swap adjacent elements",
                    "Divide and conquer",
                    "Partition based",
                    "Heap based"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is iteration?",
                answersAVRRMIEM300404K44F: [
                    "Repeating process",
                    "One-time process",
                    "No process",
                    "Random process"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a while loop?",
                answersAVRRMIEM300404K44F: [
                    "Repeats while condition is true",
                    "Repeats fixed times",
                    "Never repeats",
                    "Repeats randomly"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a for loop?",
                answersAVRRMIEM300404K44F: [
                    "Repeats for each item",
                    "Repeats forever",
                    "Never repeats",
                    "Repeats randomly"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a do-while loop?",
                answersAVRRMIEM300404K44F: [
                    "Executes at least once",
                    "May not execute",
                    "Never executes",
                    "Executes randomly"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an if statement?",
                answersAVRRMIEM300404K44F: [
                    "Conditional execution",
                    "Loop statement",
                    "Function declaration",
                    "Variable declaration"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an else statement?",
                answersAVRRMIEM300404K44F: [
                    "Alternative when if is false",
                    "Same as if",
                    "Opposite of if",
                    "Unrelated to if"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a switch statement?",
                answersAVRRMIEM300404K44F: [
                    "Multi-way branching",
                    "Loop statement",
                    "Function",
                    "Variable"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a try-catch block?",
                answersAVRRMIEM300404K44F: [
                    "Error handling mechanism",
                    "Loop mechanism",
                    "Function mechanism",
                    "Variable mechanism"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an exception?",
                answersAVRRMIEM300404K44F: [
                    "Runtime error event",
                    "Normal event",
                    "Success event",
                    "Warning event"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is debugging?",
                answersAVRRMIEM300404K44F: [
                    "Finding and fixing errors",
                    "Creating errors",
                    "Ignoring errors",
                    "Deleting code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a breakpoint?",
                answersAVRRMIEM300404K44F: [
                    "Pause execution for debugging",
                    "Continue execution",
                    "Stop program",
                    "Skip code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a compiler?",
                answersAVRRMIEM300404K44F: [
                    "Translates code to machine language",
                    "Executes code",
                    "Displays code",
                    "Deletes code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an interpreter?",
                answersAVRRMIEM300404K44F: [
                    "Executes code line by line",
                    "Compiles code",
                    "Displays code",
                    "Deletes code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is syntax?",
                answersAVRRMIEM300404K44F: [
                    "Rules of code structure",
                    "Code meaning",
                    "Code execution",
                    "Code deletion"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is semantics?",
                answersAVRRMIEM300404K44F: [
                    "Meaning of code",
                    "Structure of code",
                    "Speed of code",
                    "Size of code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a library?",
                answersAVRRMIEM300404K44F: [
                    "Collection of reusable code",
                    "Single function",
                    "One variable",
                    "Empty file"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an API?",
                answersAVRRMIEM300404K44F: [
                    "Application Programming Interface",
                    "Application Program Interface",
                    "Automated Program Interface",
                    "Advanced Program Interface"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a framework?",
                answersAVRRMIEM300404K44F: [
                    "Pre-built code structure",
                    "Single function",
                    "Empty file",
                    "One variable"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is version control?",
                answersAVRRMIEM300404K44F: [
                    "Track code changes",
                    "Delete code",
                    "Copy code",
                    "Display code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Git?",
                answersAVRRMIEM300404K44F: [
                    "Distributed version control",
                    "Programming language",
                    "Database",
                    "Operating system"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a commit?",
                answersAVRRMIEM300404K44F: [
                    "Save changes to repository",
                    "Delete changes",
                    "Copy changes",
                    "Ignore changes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a branch?",
                answersAVRRMIEM300404K44F: [
                    "Divergent line of development",
                    "Single file",
                    "One commit",
                    "Deleted code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a merge?",
                answersAVRRMIEM300404K44F: [
                    "Combine branches",
                    "Delete branches",
                    "Copy branches",
                    "Ignore branches"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is dependency injection?",
                answersAVRRMIEM300404K44F: [
                    "Provide dependencies from outside",
                    "Create inside class",
                    "Delete dependencies",
                    "Ignore dependencies"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is test-driven development?",
                answersAVRRMIEM300404K44F: [
                    "Write tests before code",
                    "Write code before tests",
                    "No tests",
                    "Tests after deployment"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is unit testing?",
                answersAVRRMIEM300404K44F: [
                    "Test individual components",
                    "Test entire system",
                    "No testing",
                    "Manual testing only"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is integration testing?",
                answersAVRRMIEM300404K44F: [
                    "Test component interaction",
                    "Test single component",
                    "No testing",
                    "Test after deployment"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is RSKRactoring?",
                answersAVRRMIEM300404K44F: [
                    "Improve code without changing behavior",
                    "Add features",
                    "Delete code",
                    "Change behavior"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            )
        ],
        "General Knowledge": [
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of France?",
                answersAVRRMIEM300404K44F: [
                    "Paris",
                    "London",
                    "Berlin",
                    "Madrid"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who wrote Romeo and Juliet?",
                answersAVRRMIEM300404K44F: [
                    "William Shakespeare",
                    "Charles Dickens",
                    "Jane Austen",
                    "Mark Twain"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the largest planet in our solar system?",
                answersAVRRMIEM300404K44F: [
                    "Jupiter",
                    "Saturn",
                    "Neptune",
                    "Earth"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for water?",
                answersAVRRMIEM300404K44F: [
                    "H2O",
                    "CO2",
                    "O2",
                    "NaCl"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who painted the Mona Lisa?",
                answersAVRRMIEM300404K44F: [
                    "Leonardo da Vinci",
                    "Pablo Picasso",
                    "Vincent van Gogh",
                    "Michelangelo"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Spain?",
                answersAVRRMIEM300404K44F: [
                    "Madrid",
                    "Barcelona",
                    "Valencia",
                    "Seville"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Italy?",
                answersAVRRMIEM300404K44F: [
                    "Rome",
                    "Milan",
                    "Naples",
                    "Turin"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Germany?",
                answersAVRRMIEM300404K44F: [
                    "Berlin",
                    "Munich",
                    "Hamburg",
                    "Frankfurt"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of England?",
                answersAVRRMIEM300404K44F: [
                    "London",
                    "Manchester",
                    "Liverpool",
                    "Birmingham"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Japan?",
                answersAVRRMIEM300404K44F: [
                    "Tokyo",
                    "Osaka",
                    "Kyoto",
                    "Yokohama"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of China?",
                answersAVRRMIEM300404K44F: [
                    "Beijing",
                    "Shanghai",
                    "Guangzhou",
                    "Shenzhen"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Russia?",
                answersAVRRMIEM300404K44F: [
                    "Moscow",
                    "Saint Petersburg",
                    "Novosibirsk",
                    "Yekaterinburg"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Brazil?",
                answersAVRRMIEM300404K44F: [
                    "Brasilia",
                    "Rio de Janeiro",
                    "São Paulo",
                    "Salvador"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Australia?",
                answersAVRRMIEM300404K44F: [
                    "Canberra",
                    "Sydney",
                    "Melbourne",
                    "Brisbane"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Canada?",
                answersAVRRMIEM300404K44F: [
                    "Ottawa",
                    "Toronto",
                    "Vancouver",
                    "Montreal"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Mexico?",
                answersAVRRMIEM300404K44F: [
                    "Mexico City",
                    "Guadalajara",
                    "Monterrey",
                    "Puebla"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of Egypt?",
                answersAVRRMIEM300404K44F: [
                    "Cairo",
                    "Alexandria",
                    "Giza",
                    "Luxor"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the capital of India?",
                answersAVRRMIEM300404K44F: [
                    "New Delhi",
                    "Mumbai",
                    "Bangalore",
                    "Kolkata"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the smallest country in the world?",
                answersAVRRMIEM300404K44F: [
                    "Vatican City",
                    "Monaco",
                    "San Marino",
                    "Liechtenstein"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the largest country by area?",
                answersAVRRMIEM300404K44F: [
                    "Russia",
                    "Canada",
                    "China",
                    "United States"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the longest river in the world?",
                answersAVRRMIEM300404K44F: [
                    "Nile",
                    "Amazon",
                    "Yangtze",
                    "Mississippi"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the highest mountain in the world?",
                answersAVRRMIEM300404K44F: [
                    "Mount Everest",
                    "K2",
                    "Kangchenjunga",
                    "Lhotse"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the deepest ocean?",
                answersAVRRMIEM300404K44F: [
                    "Pacific Ocean",
                    "Atlantic Ocean",
                    "Indian Ocean",
                    "Arctic Ocean"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the largest ocean?",
                answersAVRRMIEM300404K44F: [
                    "Pacific Ocean",
                    "Atlantic Ocean",
                    "Indian Ocean",
                    "Arctic Ocean"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many continents are there?",
                answersAVRRMIEM300404K44F: [
                    "7",
                    "6",
                    "5",
                    "8"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the smallest planet in our solar system?",
                answersAVRRMIEM300404K44F: [
                    "Mercury",
                    "Mars",
                    "Venus",
                    "Pluto"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the closest planet to the Sun?",
                answersAVRRMIEM300404K44F: [
                    "Mercury",
                    "Venus",
                    "Earth",
                    "Mars"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the speed of light?",
                answersAVRRMIEM300404K44F: [
                    "299,792,458 m/s",
                    "300,000,000 m/s",
                    "250,000,000 m/s",
                    "350,000,000 m/s"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the smallest prime number?",
                answersAVRRMIEM300404K44F: [
                    "2",
                    "1",
                    "3",
                    "5"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What year did World War II end?",
                answersAVRRMIEM300404K44F: [
                    "1945",
                    "1944",
                    "1946",
                    "1943"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What year did World War I start?",
                answersAVRRMIEM300404K44F: [
                    "1914",
                    "1913",
                    "1915",
                    "1916"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who wrote Hamlet?",
                answersAVRRMIEM300404K44F: [
                    "William Shakespeare",
                    "Charles Dickens",
                    "Jane Austen",
                    "Mark Twain"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who wrote Pride and Prejudice?",
                answersAVRRMIEM300404K44F: [
                    "Jane Austen",
                    "William Shakespeare",
                    "Charles Dickens",
                    "Mark Twain"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who wrote The Great Gatsby?",
                answersAVRRMIEM300404K44F: [
                    "F. Scott Fitzgerald",
                    "Ernest Hemingway",
                    "Mark Twain",
                    "John Steinbeck"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who painted The Starry Night?",
                answersAVRRMIEM300404K44F: [
                    "Vincent van Gogh",
                    "Pablo Picasso",
                    "Leonardo da Vinci",
                    "Claude Monet"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who painted The Scream?",
                answersAVRRMIEM300404K44F: [
                    "Edvard Munch",
                    "Vincent van Gogh",
                    "Pablo Picasso",
                    "Salvador Dalí"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for gold?",
                answersAVRRMIEM300404K44F: [
                    "Au",
                    "Go",
                    "Gd",
                    "Ag"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for silver?",
                answersAVRRMIEM300404K44F: [
                    "Ag",
                    "Si",
                    "Sv",
                    "Au"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for iron?",
                answersAVRRMIEM300404K44F: [
                    "Fe",
                    "Ir",
                    "In",
                    "Fi"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for oxygen?",
                answersAVRRMIEM300404K44F: [
                    "O",
                    "Ox",
                    "Og",
                    "Oy"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for carbon?",
                answersAVRRMIEM300404K44F: [
                    "C",
                    "Ca",
                    "Co",
                    "Cr"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for hydrogen?",
                answersAVRRMIEM300404K44F: [
                    "H",
                    "Hy",
                    "Hg",
                    "He"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the chemical symbol for nitrogen?",
                answersAVRRMIEM300404K44F: [
                    "N",
                    "Ni",
                    "Ng",
                    "Ne"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the hardest natural substance?",
                answersAVRRMIEM300404K44F: [
                    "Diamond",
                    "Gold",
                    "Iron",
                    "Platinum"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many bones are in the adult human body?",
                answersAVRRMIEM300404K44F: [
                    "206",
                    "200",
                    "212",
                    "198"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the largest organ in the human body?",
                answersAVRRMIEM300404K44F: [
                    "Skin",
                    "Liver",
                    "Lungs",
                    "Heart"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the normal body temperature in Celsius?",
                answersAVRRMIEM300404K44F: [
                    "37°C",
                    "36°C",
                    "38°C",
                    "35°C"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many chambers does a human heart have?",
                answersAVRRMIEM300404K44F: [
                    "4",
                    "2",
                    "3",
                    "5"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What gas do plants absorb from the atmosphere?",
                answersAVRRMIEM300404K44F: [
                    "Carbon dioxide",
                    "Oxygen",
                    "Nitrogen",
                    "Hydrogen"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What gas do plants release?",
                answersAVRRMIEM300404K44F: [
                    "Oxygen",
                    "Carbon dioxide",
                    "Nitrogen",
                    "Hydrogen"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is photosynthesis?",
                answersAVRRMIEM300404K44F: [
                    "Plants converting light to energy",
                    "Animals breathing",
                    "Water evaporation",
                    "Rock formation"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many days are in a leap year?",
                answersAVRRMIEM300404K44F: [
                    "366",
                    "365",
                    "364",
                    "367"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many days are in a regular year?",
                answersAVRRMIEM300404K44F: [
                    "365",
                    "366",
                    "364",
                    "360"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the most spoken language in the world?",
                answersAVRRMIEM300404K44F: [
                    "Mandarin Chinese",
                    "English",
                    "Spanish",
                    "Hindi"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the second most spoken language?",
                answersAVRRMIEM300404K44F: [
                    "Spanish",
                    "English",
                    "Hindi",
                    "Arabic"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "In what year did humans first land on the moon?",
                answersAVRRMIEM300404K44F: [
                    "1969",
                    "1968",
                    "1970",
                    "1967"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "Who was the first person on the moon?",
                answersAVRRMIEM300404K44F: [
                    "Neil Armstrong",
                    "Buzz Aldrin",
                    "Yuri Gagarin",
                    "John Glenn"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the freezing point of water in Celsius?",
                answersAVRRMIEM300404K44F: [
                    "0°C",
                    "-1°C",
                    "1°C",
                    "-5°C"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the boiling point of water in Celsius?",
                answersAVRRMIEM300404K44F: [
                    "100°C",
                    "99°C",
                    "101°C",
                    "98°C"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many time zones are there in the world?",
                answersAVRRMIEM300404K44F: [
                    "24",
                    "23",
                    "25",
                    "22"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the smallest ocean?",
                answersAVRRMIEM300404K44F: [
                    "Arctic Ocean",
                    "Southern Ocean",
                    "Indian Ocean",
                    "Atlantic Ocean"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the longest bone in the human body?",
                answersAVRRMIEM300404K44F: [
                    "Femur",
                    "Tibia",
                    "Humerus",
                    "Radius"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many teeth does an adult human have?",
                answersAVRRMIEM300404K44F: [
                    "32",
                    "28",
                    "30",
                    "36"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the study of weather called?",
                answersAVRRMIEM300404K44F: [
                    "Meteorology",
                    "Geology",
                    "Astronomy",
                    "Biology"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the study of stars called?",
                answersAVRRMIEM300404K44F: [
                    "Astronomy",
                    "Meteorology",
                    "Geology",
                    "Biology"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the fastest land animal?",
                answersAVRRMIEM300404K44F: [
                    "Cheetah",
                    "Lion",
                    "Tiger",
                    "Leopard"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the tallest animal?",
                answersAVRRMIEM300404K44F: [
                    "Giraffe",
                    "Elephant",
                    "Rhino",
                    "Hippo"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the largest mammal?",
                answersAVRRMIEM300404K44F: [
                    "Blue whale",
                    "Elephant",
                    "Giraffe",
                    "Hippo"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "How many planets are in our solar system?",
                answersAVRRMIEM300404K44F: [
                    "8",
                    "9",
                    "7",
                    "10"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the Red Planet?",
                answersAVRRMIEM300404K44F: [
                    "Mars",
                    "Venus",
                    "Jupiter",
                    "Mercury"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the Blue Planet?",
                answersAVRRMIEM300404K44F: [
                    "Earth",
                    "Neptune",
                    "Uranus",
                    "Jupiter"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            )
        ],
        "Technology": [
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does CPU stand for?",
                answersAVRRMIEM300404K44F: [
                    "Central Processing Unit",
                    "Computer Processing Unit",
                    "Central Program Unit",
                    "Computer Program Unit"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between RAM and ROM?",
                answersAVRRMIEM300404K44F: [
                    "RAM is volatile, ROM is non-volatile",
                    "ROM is volatile, RAM is non-volatile",
                    "They are the same",
                    "RAM is slower than ROM"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is cloud computing?",
                answersAVRRMIEM300404K44F: [
                    "Delivery of computing services over the internet",
                    "Computing using physical clouds",
                    "Offline computing",
                    "Mobile computing"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is machine learning?",
                answersAVRRMIEM300404K44F: [
                    "AI system that learns from data",
                    "Manual programming",
                    "Data storage",
                    "Network protocols"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an API?",
                answersAVRRMIEM300404K44F: [
                    "Application Programming Interface",
                    "Application Program Interface",
                    "Automated Program Interface",
                    "Advanced Program Interface"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does HTTP stand for?",
                answersAVRRMIEM300404K44F: [
                    "HyperText Transfer Protocol",
                    "High Transfer Text Protocol",
                    "Hyper Transfer Text Protocol",
                    "High Text Transfer Protocol"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does HTTPS stand for?",
                answersAVRRMIEM300404K44F: [
                    "HyperText Transfer Protocol Secure",
                    "Hyper Transfer Text Protocol Secure",
                    "High Text Transfer Protocol Secure",
                    "HyperText Transfer Protocol Standard"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between HTTP and HTTPS?",
                answersAVRRMIEM300404K44F: [
                    "HTTPS is encrypted, HTTP is not",
                    "HTTP is encrypted, HTTPS is not",
                    "They are the same",
                    "HTTP is faster"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does URL stand for?",
                answersAVRRMIEM300404K44F: [
                    "Uniform Resource Locator",
                    "Universal Resource Locator",
                    "Uniform Resource Link",
                    "Universal Resource Link"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does IP stand for?",
                answersAVRRMIEM300404K44F: [
                    "Internet Protocol",
                    "Internal Protocol",
                    "Internet Program",
                    "Internal Program"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an IP address?",
                answersAVRRMIEM300404K44F: [
                    "Unique identifier for device on network",
                    "Email address",
                    "Website address",
                    "File name"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does DNS stand for?",
                answersAVRRMIEM300404K44F: [
                    "Domain Name System",
                    "Domain Name Server",
                    "Domain Network System",
                    "Domain Network Server"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is DNS used for?",
                answersAVRRMIEM300404K44F: [
                    "Translate domain names to IP addresses",
                    "Translate IP to domain names",
                    "Store websites",
                    "Create websites"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a firewall?",
                answersAVRRMIEM300404K44F: [
                    "Network security system",
                    "Network speed system",
                    "Network storage system",
                    "Network display system"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a router?",
                answersAVRRMIEM300404K44F: [
                    "Device that routes network traffic",
                    "Device that stores data",
                    "Device that displays data",
                    "Device that deletes data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a modem?",
                answersAVRRMIEM300404K44F: [
                    "Modulates and demodulates signals",
                    "Displays data",
                    "Stores data",
                    "Deletes data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is WiFi?",
                answersAVRRMIEM300404K44F: [
                    "Wireless networking technology",
                    "Wired networking technology",
                    "Cable technology",
                    "Satellite technology"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Bluetooth?",
                answersAVRRMIEM300404K44F: [
                    "Short-range wireless communication",
                    "Long-range wireless communication",
                    "Wired communication",
                    "Satellite communication"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a database?",
                answersAVRRMIEM300404K44F: [
                    "Organized collection of data",
                    "Single file",
                    "Empty folder",
                    "Network connection"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is SQL?",
                answersAVRRMIEM300404K44F: [
                    "Structured Query Language",
                    "Simple Query Language",
                    "Standard Query Language",
                    "System Query Language"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a server?",
                answersAVRRMIEM300404K44F: [
                    "Computer that provides services",
                    "Computer that uses services",
                    "Computer that displays data",
                    "Computer that deletes data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a client?",
                answersAVRRMIEM300404K44F: [
                    "Computer that requests services",
                    "Computer that provides services",
                    "Computer that stores services",
                    "Computer that deletes services"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is bandwidth?",
                answersAVRRMIEM300404K44F: [
                    "Data transfer capacity",
                    "Data storage capacity",
                    "Data display capacity",
                    "Data deletion capacity"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is latency?",
                answersAVRRMIEM300404K44F: [
                    "Delay in data transmission",
                    "Speed of data transmission",
                    "Size of data",
                    "Type of data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a cookie?",
                answersAVRRMIEM300404K44F: [
                    "Small data stored by browser",
                    "Small file on server",
                    "Large data in database",
                    "Network connection"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a cache?",
                answersAVRRMIEM300404K44F: [
                    "Temporary storage for quick access",
                    "Permanent storage",
                    "Network connection",
                    "Database"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is encryption?",
                answersAVRRMIEM300404K44F: [
                    "Converting data to secure format",
                    "Converting data to readable format",
                    "Deleting data",
                    "Copying data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is decryption?",
                answersAVRRMIEM300404K44F: [
                    "Converting encrypted data back",
                    "Converting data to encrypted",
                    "Deleting data",
                    "Copying data"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a virus?",
                answersAVRRMIEM300404K44F: [
                    "Malicious software that replicates",
                    "Antivirus software",
                    "Operating system",
                    "Application"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is malware?",
                answersAVRRMIEM300404K44F: [
                    "Malicious software",
                    "Antivirus software",
                    "Operating system",
                    "Application"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a Trojan?",
                answersAVRRMIEM300404K44F: [
                    "Malware disguised as legitimate software",
                    "Antivirus software",
                    "Operating system",
                    "Application"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a phishing attack?",
                answersAVRRMIEM300404K44F: [
                    "Fraudulent attempt to get sensitive info",
                    "Software update",
                    "Security patch",
                    "System backup"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a DDoS attack?",
                answersAVRRMIEM300404K44F: [
                    "Overwhelming server with traffic",
                    "Stealing data",
                    "Installing malware",
                    "Creating accounts"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does DDoS stand for?",
                answersAVRRMIEM300404K44F: [
                    "Distributed Denial of Service",
                    "Direct Denial of Service",
                    "Digital Denial of Service",
                    "Data Denial of Service"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a password?",
                answersAVRRMIEM300404K44F: [
                    "Secret authentication code",
                    "Public identifier",
                    "Email address",
                    "Username"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is two-factor authentication?",
                answersAVRRMIEM300404K44F: [
                    "Two-step verification process",
                    "Single step process",
                    "No verification",
                    "Triple step process"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is biometric authentication?",
                answersAVRRMIEM300404K44F: [
                    "Using physical characteristics for ID",
                    "Using passwords",
                    "Using emails",
                    "Using usernames"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a VPN?",
                answersAVRRMIEM300404K44F: [
                    "Virtual Private Network",
                    "Virtual Public Network",
                    "Variable Private Network",
                    "Variable Public Network"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a VPN used for?",
                answersAVRRMIEM300404K44F: [
                    "Secure private network connection",
                    "Faster internet",
                    "Free internet",
                    "More storage"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an operating system?",
                answersAVRRMIEM300404K44F: [
                    "Manages computer hardware and software",
                    "Manages only hardware",
                    "Manages only software",
                    "Manages network"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What are examples of operating systems?",
                answersAVRRMIEM300404K44F: [
                    "Windows, macOS, Linux, iOS",
                    "Word, Excel, PowerPoint",
                    "Chrome, FiRSKRox, Safari",
                    "Gmail, Outlook, Yahoo"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is open source software?",
                answersAVRRMIEM300404K44F: [
                    "Source code is publicly available",
                    "Source code is private",
                    "Software is free",
                    "Software is paid"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is proprietary software?",
                answersAVRRMIEM300404K44F: [
                    "Software with private source code",
                    "Software with public source code",
                    "Free software",
                    "Open source software"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a GUI?",
                answersAVRRMIEM300404K44F: [
                    "Graphical User Interface",
                    "General User Interface",
                    "Global User Interface",
                    "Graphics User Interface"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a CLI?",
                answersAVRRMIEM300404K44F: [
                    "Command Line Interface",
                    "Computer Line Interface",
                    "Code Line Interface",
                    "Control Line Interface"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is binary code?",
                answersAVRRMIEM300404K44F: [
                    "Code using only 0s and 1s",
                    "Code using letters",
                    "Code using numbers",
                    "Code using symbols"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a bit?",
                answersAVRRMIEM300404K44F: [
                    "Binary digit (0 or 1)",
                    "8 bits",
                    "1000 bytes",
                    "A character"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a byte?",
                answersAVRRMIEM300404K44F: [
                    "8 bits",
                    "1 bit",
                    "10 bits",
                    "100 bits"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a kilobyte (KB)?",
                answersAVRRMIEM300404K44F: [
                    "1024 bytes",
                    "1000 bytes",
                    "100 bytes",
                    "10 bytes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a megabyte (MB)?",
                answersAVRRMIEM300404K44F: [
                    "1024 kilobytes",
                    "1000 bytes",
                    "100 kilobytes",
                    "10 kilobytes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a gigabyte (GB)?",
                answersAVRRMIEM300404K44F: [
                    "1024 megabytes",
                    "1000 bytes",
                    "100 megabytes",
                    "10 megabytes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a terabyte (TB)?",
                answersAVRRMIEM300404K44F: [
                    "1024 gigabytes",
                    "1000 bytes",
                    "100 gigabytes",
                    "10 gigabytes"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is SSD?",
                answersAVRRMIEM300404K44F: [
                    "Solid State Drive",
                    "Solid Storage Device",
                    "Speed Storage Drive",
                    "System Storage Drive"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is HDD?",
                answersAVRRMIEM300404K44F: [
                    "Hard Disk Drive",
                    "High Disk Drive",
                    "Hard Drive Device",
                    "High Drive Device"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is the difference between SSD and HDD?",
                answersAVRRMIEM300404K44F: [
                    "SSD is faster, no moving parts",
                    "HDD is faster",
                    "SSD has moving parts",
                    "They are identical"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is GPU?",
                answersAVRRMIEM300404K44F: [
                    "Graphics Processing Unit",
                    "General Processing Unit",
                    "Graphics Program Unit",
                    "General Program Unit"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is GPU used for?",
                answersAVRRMIEM300404K44F: [
                    "Rendering graphics and parallel processing",
                    "General computing",
                    "Data storage",
                    "Network management"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is USB?",
                answersAVRRMIEM300404K44F: [
                    "Universal Serial Bus",
                    "Universal System Bus",
                    "Unified Serial Bus",
                    "Unified System Bus"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is USB used for?",
                answersAVRRMIEM300404K44F: [
                    "Connecting devices and transferring data",
                    "Only storage",
                    "Only display",
                    "Only network"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is HTML?",
                answersAVRRMIEM300404K44F: [
                    "HyperText Markup Language",
                    "HyperText Markdown Language",
                    "HighText Markup Language",
                    "HyperText Markup Library"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is CSS?",
                answersAVRRMIEM300404K44F: [
                    "Cascading Style Sheets",
                    "Computer Style Sheets",
                    "Cascading Style System",
                    "Computer Style System"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is JavaScript?",
                answersAVRRMIEM300404K44F: [
                    "Programming language for web",
                    "Markup language",
                    "Style language",
                    "Database language"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a programming language?",
                answersAVRRMIEM300404K44F: [
                    "Language to write computer programs",
                    "Human language",
                    "Machine code",
                    "Binary code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a compiler?",
                answersAVRRMIEM300404K44F: [
                    "Translates code to machine language",
                    "Executes code",
                    "Displays code",
                    "Deletes code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is an interpreter?",
                answersAVRRMIEM300404K44F: [
                    "Executes code line by line",
                    "Compiles code",
                    "Displays code",
                    "Deletes code"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is artificial intelligence?",
                answersAVRRMIEM300404K44F: [
                    "Computer systems simulating human intelligence",
                    "Human intelligence",
                    "Animal intelligence",
                    "Machine hardware"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is deep learning?",
                answersAVRRMIEM300404K44F: [
                    "AI using neural networks with multiple layers",
                    "AI using single layer",
                    "Manual programming",
                    "Database management"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a neural network?",
                answersAVRRMIEM300404K44F: [
                    "AI system inspired by brain",
                    "Computer network",
                    "Database network",
                    "Internet network"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is a blockchain?",
                answersAVRRMIEM300404K44F: [
                    "Distributed ledger technology",
                    "Centralized database",
                    "Network protocol",
                    "Programming language"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is cryptocurrency?",
                answersAVRRMIEM300404K44F: [
                    "Digital currency using cryptography",
                    "Physical currency",
                    "Bank currency",
                    "Paper currency"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is Bitcoin?",
                answersAVRRMIEM300404K44F: [
                    "First and largest cryptocurrency",
                    "Second cryptocurrency",
                    "Programming language",
                    "Operating system"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What does IoT stand for?",
                answersAVRRMIEM300404K44F: [
                    "Internet of Things",
                    "Internet of Technology",
                    "Internet of Tools",
                    "Internet of Text"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            ),
            QuizQuestionDataAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: "What is IoT?",
                answersAVRRMIEM300404K44F: [
                    "Network of connected physical devices",
                    "Network of computers only",
                    "Network of servers only",
                    "Network of websites only"
                ],
                correctAnswerIndexAVRRMIEM300404K44F: 0
            )
        ]
    ]
    
    // Get random questions from all topics
    func getRandomQuizQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: Int) -> [QuizQuestionAVRRMIEM300404K44F] {
        // Collect all questions from all topics
        var allQuestionsAVRRMIEM300404K44F: [QuizQuestionDataAVRRMIEM300404K44F] = []
        for (_, questions) in quizDatabaseAVRRMIEM300404K44F {
            allQuestionsAVRRMIEM300404K44F.append(contentsOf: questions)
        }
        
        // Ensure we have questions available
        guard !allQuestionsAVRRMIEM300404K44F.isEmpty else {
            return []
        }
        
        // Shuffle all questions and select the requested count
        let shuffledQuestionsAVRRMIEM300404K44F = allQuestionsAVRRMIEM300404K44F.shuffled()
        let selectedQuestionsAVRRMIEM300404K44F = Array(shuffledQuestionsAVRRMIEM300404K44F.prefix(min(countAVRRMIEM300404K44F, shuffledQuestionsAVRRMIEM300404K44F.count)))
        
        return selectedQuestionsAVRRMIEM300404K44F.map { data in
            let correctAnswerAVRRMIEM300404K44F = data.answersAVRRMIEM300404K44F[data.correctAnswerIndexAVRRMIEM300404K44F]
            let shuffledAnswersAVRRMIEM300404K44F = data.answersAVRRMIEM300404K44F.shuffled()
            
            // Find the correct answer index in shuffled array (should always exist)
            guard let newCorrectIndexAVRRMIEM300404K44F = shuffledAnswersAVRRMIEM300404K44F.firstIndex(of: correctAnswerAVRRMIEM300404K44F) else {
                // Fallback: return first answer if somehow correct answer is not found
                // This should never happen, but handle it gracefully
                return QuizQuestionAVRRMIEM300404K44F(
                    textAVRRMIEM300404K44F: data.textAVRRMIEM300404K44F,
                    answersAVRRMIEM300404K44F: shuffledAnswersAVRRMIEM300404K44F,
                    correctAnswerIndexAVRRMIEM300404K44F: 0,
                    topicAVRRMIEM300404K44F: "Random"
                )
            }
            
            return QuizQuestionAVRRMIEM300404K44F(
                textAVRRMIEM300404K44F: data.textAVRRMIEM300404K44F,
                answersAVRRMIEM300404K44F: shuffledAnswersAVRRMIEM300404K44F,
                correctAnswerIndexAVRRMIEM300404K44F: newCorrectIndexAVRRMIEM300404K44F,
                topicAVRRMIEM300404K44F: "Random"
            )
        }
    }
    
    // Keep old method for backward compatibility, but use random
    func getQuizQuestionsAVRRMIEM300404K44F(topicAVRRMIEM300404K44F: String, countAVRRMIEM300404K44F: Int) -> [QuizQuestionAVRRMIEM300404K44F] {
        return getRandomQuizQuestionsAVRRMIEM300404K44F(countAVRRMIEM300404K44F: countAVRRMIEM300404K44F)
    }
}

