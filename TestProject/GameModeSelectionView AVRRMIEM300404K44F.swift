//
//  GameModeSelectionView.swift


import SwiftUI

struct GameModeSelectionViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @StateObject private var quizViewModelAVRRMIEM300404K44F = QuizViewModelAVRRMIEM300404K44F()
    @State private var showQuiz = false
    @State private var showPlayerNamesAVRRMIEM300404K44F: Bool = false
    @State private var selectedMode: GameModeAVRRMIEM300404K44F? = nil
    @State private var showSettings = false
    
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
                ScrollView {
                    VStack(spacing: 0) {
                        // Compact Header
                        headerSection
                        
                        // Settings Toggle
                        settingsToggleSection
                        
                        // Game Modes Grid
                        gameModesGridSection
                        
                        // Player Names (conditional)
                        if showPlayerNamesAVRRMIEM300404K44F {
                            playerNamesSection
                                .transition(.move(edge: .top).combined(with: .opacity))
                        }
                        
                        // Start Button (conditional)
                        if selectedMode != nil && (!showPlayerNamesAVRRMIEM300404K44F || (!quizViewModelAVRRMIEM300404K44F.player1NameAVRRMIEM300404K44F.isEmpty && !quizViewModelAVRRMIEM300404K44F.player2NameAVRRMIEM300404K44F.isEmpty)) {
                            startButtonSection
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
                .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
                
                // Settings Sheet
                if showSettings {
                    settingsSheet
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $showQuiz) {
                QuizViewAVRRMIEM300404K44F(quizViewModel: quizViewModelAVRRMIEM300404K44F)
                    .environmentObject(themeManagerAVRRMIEM300404K44F)
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "play.circle.fill")
                .font(.system(size: 60, weight: .bold))
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
                .padding(.top, 30)
            
            Text("Choose Your Mode")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
        }
        .padding(.bottom, 30)
    }
    
    // MARK: - Settings Toggle
    private var settingsToggleSection: some View {
        HStack {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    showSettings.toggle()
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: showSettings ? "checkmark.circle.fill" : "slider.horizontal.3")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("Quiz Settings")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    
                    Text("(\(quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F) questions)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(
                        colors: [
                            themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.15),
                            themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.1)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.4),
                                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 1.5
                        )
                )
            }
            Spacer()
        }
        .padding(.bottom, 25)
    }
    
    // MARK: - Settings Sheet
    private var settingsSheet: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Number of Questions")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                
                Spacer()
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        showSettings = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
            }
            .padding(20)
            
            VStack(spacing: 20) {
                HStack {
                    Text("\(quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 8) {
                        Button {
                            if quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F < 30 {
                                quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F += 1
                            }
                        } label: {
                            Image(systemName: "chevron.up")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F)
                                .frame(width: 44, height: 44)
                                .background(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.15))
                                .clipShape(Circle())
                        }
                        .disabled(quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F >= 30)
                        
                        Button {
                            if quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F > 10 {
                                quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F)
                                .frame(width: 44, height: 44)
                                .background(themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.15))
                                .clipShape(Circle())
                        }
                        .disabled(quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F <= 10)
                    }
                }
                
                // Quick Select Buttons
                HStack(spacing: 12) {
                    ForEach([10, 15, 20, 25, 30], id: \.self) { count in
                        Button {
                            quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F = count
                        } label: {
                            Text("\(count)")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(
                                    quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F == count
                                        ? .white
                                        : ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(
                                    quizViewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F == count
                                        ? LinearGradient(
                                            colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        : LinearGradient(
                                            colors: [
                                                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.5),
                                                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.3)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(
            ZStack {
                LinearGradient(
                    colors: [
                        ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                LinearGradient(
                    colors: [
                        themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.1),
                        themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.05)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3), radius: 20, x: 0, y: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    LinearGradient(
                        colors: [
                            themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                            themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2),
                            Color.clear
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .padding(.bottom, 20)
        .transition(.move(edge: .top).combined(with: .opacity))
    }
    
    // MARK: - Game Modes Grid
    private var gameModesGridSection: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 15),
            GridItem(.flexible(), spacing: 15)
        ], spacing: 15) {
            gameModeCard(
                title: "Solo",
                description: "Test yourself",
                icon: "person.fill",
                gradientColors: [ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F],
                mode: .solo
            )
            
            gameModeCard(
                title: "PvP",
                description: "Two players",
                icon: "person.2.fill",
                gradientColors: [ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F],
                mode: .playerVsPlayer
            )
            
            gameModeCard(
                title: "vs AI",
                description: "Beat the computer",
                icon: "cpu.fill",
                gradientColors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F],
                mode: .playerVsComputer
            )
        }
        .padding(.bottom, 25)
    }
    
    // MARK: - Game Mode Card
    private func gameModeCard(
        title: String,
        description: String,
        icon: String,
        gradientColors: [Color],
        mode: GameModeAVRRMIEM300404K44F
    ) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                if mode == .playerVsPlayer {
                    showPlayerNamesAVRRMIEM300404K44F = true
                } else {
                    showPlayerNamesAVRRMIEM300404K44F = false
                }
                selectedMode = mode
                quizViewModelAVRRMIEM300404K44F.gameModeAVRRMIEM300404K44F = mode
            }
        } label: {
            VStack(spacing: 16) {
                ZStack {
                    // Glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    gradientColors[0].opacity(0.5),
                                    gradientColors[1].opacity(0.3),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 50
                            )
                        )
                        .frame(width: 90, height: 90)
                        .blur(radius: 15)
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    gradientColors[0].opacity(0.25),
                                    gradientColors[1].opacity(0.15)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 75, height: 75)
                    
                    Image(systemName: icon)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: gradientColors[0].opacity(0.6), radius: 8, x: 0, y: 4)
                }
                
                VStack(spacing: 6) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    
                    Text(description)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
                
                if selectedMode == mode {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            .padding(20)
            .background(
                ZStack {
                    LinearGradient(
                        colors: [
                            ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                            ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    if selectedMode == mode {
                        LinearGradient(
                            colors: [
                                gradientColors[0].opacity(0.2),
                                gradientColors[1].opacity(0.1)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        selectedMode == mode
                            ? LinearGradient(
                                colors: [
                                    gradientColors[0].opacity(0.6),
                                    gradientColors[1].opacity(0.4)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            : LinearGradient(
                                colors: [
                                    gradientColors[0].opacity(0.2),
                                    gradientColors[1].opacity(0.1),
                                    Color.clear
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                        lineWidth: selectedMode == mode ? 2.5 : 1.5
                    )
            )
            .shadow(
                color: selectedMode == mode
                    ? gradientColors[0].opacity(0.4)
                    : Color.black.opacity(0.1),
                radius: selectedMode == mode ? 15 : 8,
                x: 0,
                y: selectedMode == mode ? 8 : 4
            )
            .scaleEffect(selectedMode == mode ? 1.02 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Player Names Section
    private var playerNamesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "person.2.fill")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                Text("Enter Player Names")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            }
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("1")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    TextField("Player 1", text: $quizViewModelAVRRMIEM300404K44F.player1NameAVRRMIEM300404K44F)
                        .padding(14)
                        .background(ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.5))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                HStack(spacing: 12) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("2")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                        )
                    
                    TextField("Player 2", text: $quizViewModelAVRRMIEM300404K44F.player2NameAVRRMIEM300404K44F)
                        .padding(14)
                        .background(ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.5))
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [
                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(
                        colors: [
                            ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F.opacity(0.4),
                            ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.2)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F.opacity(0.2), radius: 15, x: 0, y: 8)
        .padding(.bottom, 20)
    }
    
    // MARK: - Start Button
    private var startButtonSection: some View {
        Button {
            showQuiz = true
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "play.fill")
                    .font(.system(size: 20, weight: .bold))
                Text("Start Quiz")
                    .font(.system(size: 20, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    GameModeSelectionViewAVRRMIEM300404K44F()
        .environmentObject(ThemeManagerAVRRMIEM300404K44F())
}
