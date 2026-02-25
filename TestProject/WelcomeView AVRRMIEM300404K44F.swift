//
//  WelcomeView.swift


import SwiftUI

struct WelcomeViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome = false
    @State private var showGameModeSelection = false
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
        NavigationStack {
            ZStack {
                VStack(spacing: 50) {
                    Spacer()
                    
                    // Logo/Icon Section with animation
                    VStack(spacing: 25) {
                        ZStack {
                            // Multiple colorful circles for glow effect
                            Circle()
                                .fill(
                                    RadialGradient(
                                        colors: [
                                            ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.4),
                                            ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.2),
                                            Color.clear
                                        ],
                                        center: .center,
                                        startRadius: 0,
                                        endRadius: 80
                                    )
                                )
                                .frame(width: 160, height: 160)
                                .blur(radius: 30)
                            
                            Circle()
                                .fill(
                                    RadialGradient(
                                        colors: [
                                            ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F.opacity(0.3),
                                            Color.clear
                                        ],
                                        center: .center,
                                        startRadius: 0,
                                        endRadius: 70
                                    )
                                )
                                .frame(width: 140, height: 140)
                                .blur(radius: 25)
                            
                            Image(systemName: "brain.head.profile")
                                .font(.system(size: 80))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F,
                                            ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F,
                                            ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.5), radius: 20)
                        }
                        
                        VStack(spacing: 12) {
                            Text("Quiz Builder")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F.opacity(0.8)],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                            
                            Text("Test your knowledge with quizzes")
                                .font(.title3)
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                    }
                    
                    Spacer()
                    
                    // Start Button with enhanced style
                    Button {
                        hasSeenWelcome = true
                        showGameModeSelection = true
                    } label: {
                        HStack(spacing: 12) {
                            Text("Get Started")
                                .font(.title3)
                                .fontWeight(.bold)
                            Image(systemName: "arrow.right")
                                .font(.title3)
                        }
                        .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $showGameModeSelection) {
                HomeViewAVRRMIEM300404K44F()
                    .environmentObject(themeManagerAVRRMIEM300404K44F)
            }
        }
    }
}

#Preview {
    WelcomeViewAVRRMIEM300404K44F()
        .environmentObject(ThemeManagerAVRRMIEM300404K44F())

}

