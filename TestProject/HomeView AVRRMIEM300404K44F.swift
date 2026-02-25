//
//  HomeView.swift


import SwiftUI

struct HomeViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @State private var showGame = false
    @State private var showProfile = false
    @State private var showSettings = false
    @State private var showFacts = false
    @State private var showHintsQuiz = false
    @State var showLoading = true
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome = false
    @State private var selectedCard: String? = nil
    @State private var marqueeOffset: CGFloat = 0
    
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
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 0) {
                        // Modern Header with enhanced design
                        VStack(spacing: 16) {
                            // Marquee text with app name
                            marqueeTextView()
                                .padding(.top, 20)
                               
                            // App Icon/Logo
                            ZStack {
                                // Animated glow effect
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
                                            endRadius: 60
                                        )
                                    )
                                    .frame(width: 120, height: 120)
                                    .blur(radius: 20)
                                
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.3),
                                                ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.2)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 100, height: 100)
                                
                                Image(systemName: "square.stack.3d.up.fill")
                                    .font(.system(size: 50, weight: .bold))
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
                            }
                            .padding(.top, 30)
                            
                            VStack(spacing: 8) {
                                Text("Quiz Builder")
                                    .font(.system(size: 42, weight: .bold, design: .rounded))
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [
                                                ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F,
                                                ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.9),
                                                ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.8)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Text("Choose an option to continue")
                                    .font(.system(size: 17, weight: .medium))
                                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                        
                        // Modern Options Grid with 2 columns
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 20) {
                            homeOptionCard(
                                title: "Game",
                                description: "Select and play",
                                icon: "play.circle.fill",
                                color: ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F,
                                gradientColors: [ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F]
                            ) {
                                showGame = true
                            }
                            
                            homeOptionCard(
                                title: "Profile",
                                description: "Statistics",
                                icon: "chart.bar.fill",
                                color: ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F,
                                gradientColors: [ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F]
                            ) {
                                showProfile = true
                            }
                            
                            homeOptionCard(
                                title: "Settings",
                                description: "App settings",
                                icon: "slider.horizontal.3",
                                color: ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F,
                                gradientColors: [ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F]
                            ) {
                                showSettings = true
                            }
                            
                            homeOptionCard(
                                title: "Facts",
                                description: "Interesting facts",
                                icon: "book.fill",
                                color: ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F,
                                gradientColors: [ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F]
                            ) {
                                showFacts = true
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        
                        // Wide card for Quiz with Hints
                        homeOptionCard(
                            title: "Quiz with Hints",
                            description: "Answer questions with helpful hints",
                            icon: "lightbulb.circle.fill",
                            color: ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F,
                            gradientColors: [ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F],
                            isWide: true
                        ) {
                            showHintsQuiz = true
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                }
                .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.hidden, for: .navigationBar)
                .navigationDestination(isPresented: $showGame) {
                    GameModeSelectionViewAVRRMIEM300404K44F()
                        .environmentObject(themeManagerAVRRMIEM300404K44F)
                }
                .navigationDestination(isPresented: $showProfile) {
                    ProfileViewAVRRMIEM300404K44F()
                        .environmentObject(themeManagerAVRRMIEM300404K44F)
                }
                .navigationDestination(isPresented: $showSettings) {
                    SettingsViewAVRRMIEM300404K44F()
                        .environmentObject(themeManagerAVRRMIEM300404K44F)
                }
                .navigationDestination(isPresented: $showFacts) {
                    FactsViewAVRRMIEM300404K44F()
                        .environmentObject(themeManagerAVRRMIEM300404K44F)
                }
                .navigationDestination(isPresented: $showHintsQuiz) {
                    HintsQuizViewAVRRMIEM300404K44F()
                        .environmentObject(themeManagerAVRRMIEM300404K44F)
                }
            }
            
            if !hasSeenWelcome {
                WelcomeViewAVRRMIEM300404K44F()
                    .environmentObject(themeManagerAVRRMIEM300404K44F)
            }
            
            // Loading View
            if showLoading {
                LoadingViewAVRRMIEM300404K44F(showView: $showLoading)
                    .onChange(of: showLoading) { newValue in
                        print(newValue)
                    }
            }
        }
    }
    
    private func marqueeTextView() -> some View {
        GeometryReader { geometry in
            let displayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
                ?? Bundle.main.infoDictionary?["CFBundleName"] as? String
                ?? "Quiz Builder"
            let appName = "\(displayName) • "
            let repeatedText = String(repeating: appName, count: 10)
            let fullText = repeatedText + repeatedText
            
            ZStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text(fullText)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F,
                                    ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F,
                                    ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .fixedSize()
                        .background(Color.hexAVRRMIEM300404K44F("313131").opacity(0.6))
                }
                .offset(x: marqueeOffset)
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .onAppear {
                // Calculate approximate width: ~14 pixels per character for this font size
                let segmentWidth = CGFloat(appName.count * 14)
                withAnimation(.linear(duration: 25).repeatForever(autoreverses: false)) {
                    marqueeOffset = -segmentWidth
                }
            }
        }
    }
    
    private func homeOptionCard(
        title: String,
        description: String,
        icon: String,
        color: Color,
        gradientColors: [Color],
        isWide: Bool = false,
        action: @escaping () -> Void
    ) -> some View {
        let cardId = title
        
        return Button(action: action) {
            Group {
                if isWide {
                    // Horizontal layout for wide cards
                    HStack(spacing: 20) {
                        // Icon
                        ZStack {
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
                                .opacity(selectedCard == cardId ? 1 : 0.7)
                            
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            gradientColors[0].opacity(0.3),
                                            gradientColors[1].opacity(0.2)
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
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(title)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                            
                            Text(description)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: gradientColors,
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .opacity(0.7)
                    }
                    .padding(24)
                } else {
                    // Vertical layout for grid cards
                    VStack(spacing: 16) {
                        // Icon with modern design
                        ZStack {
                            // Animated glow effect
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
                                .opacity(selectedCard == cardId ? 1 : 0.7)
                            
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            gradientColors[0].opacity(0.3),
                                            gradientColors[1].opacity(0.2)
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
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                                .multilineTextAlignment(.center)
                            
                            Text(description)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .padding(20)
                }
            }
            .background(
                ZStack {
                    // Card background with gradient
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: [
                                    ConstantColorsAVRRMIEM300404K44F.cardGradientStartAVRRMIEM300404K44F,
                                    ConstantColorsAVRRMIEM300404K44F.cardGradientEndAVRRMIEM300404K44F
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    // Subtle color overlay
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: [
                                    gradientColors[0].opacity(0.15),
                                    gradientColors[1].opacity(0.08)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        LinearGradient(
                            colors: [
                                gradientColors[0].opacity(0.4),
                                gradientColors[1].opacity(0.2),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .shadow(color: gradientColors[0].opacity(0.3), radius: 15, x: 0, y: 8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .scaleEffect(selectedCard == cardId ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedCard)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    selectedCard = cardId
                }
                .onEnded { _ in
                    selectedCard = nil
                }
        )
    }
}


#Preview {
    HomeViewAVRRMIEM300404K44F(showLoading: false)
        .environmentObject(ThemeManagerAVRRMIEM300404K44F())
}

