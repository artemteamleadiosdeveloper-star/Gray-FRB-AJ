//
//  FactsView.swift


import SwiftUI

struct FactsViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @StateObject private var factsViewModel = FactsViewModelAVRRMIEM300404K44F()
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
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 30) {
                    // Header with icon
                    VStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.yellow.opacity(0.3),
                                        Color.orange.opacity(0.2)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 120, height: 120)
                            .blur(radius: 20)
                        
                        Image(systemName: "lightbulb.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color.yellow, Color.orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    
                    Text("Interesting Facts")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F, Color.yellow.opacity(0.8)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    Text("Learn something new every day")
                        .font(.title3)
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
                .padding(.top, max(geometry.safeAreaInsets.top + 20, 60))
                .padding(.bottom, 25)
                
                // Fact Card
                if let currentFact = factsViewModel.currentFactAVRRMIEM300404K44F {
                    factCardAVRRMIEM300404K44F(fact: currentFact)
                        .padding(.horizontal, 20)
                }
                
                // Next Fact Button
                Button {
                    factsViewModel.loadNextFactAVRRMIEM300404K44F()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title3)
                        Text("Next Fact")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .primaryButtonStyle(theme: themeManagerAVRRMIEM300404K44F)
                }
                .padding(.horizontal, 20)
                
                // Fun Facts Counter
                HStack(spacing: 10) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
                    Text("Total facts available: \(factsViewModel.totalFactsAVRRMIEM300404K44F)")
                        .font(.body)
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                }
                .padding(.vertical, 8)
                
                Spacer()
            }
            }
        }
        .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if factsViewModel.currentFactAVRRMIEM300404K44F == nil {
                factsViewModel.loadNextFactAVRRMIEM300404K44F()
            }
        }
    }
    
    private func factCardAVRRMIEM300404K44F(fact: FactAVRRMIEM300404K44F) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.yellow.opacity(0.2))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "sparkles")
                        .font(.title3)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color.yellow, Color.orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                
                Text("Did You Know?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.yellow, Color.orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            VStack(alignment: .leading, spacing: 16) {
                // Short description (always visible)
                Text(fact.shortDescriptionAVRRMIEM300404K44F)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    .lineSpacing(8)
                
                // Full description (expandable)
                if factsViewModel.isExpandedAVRRMIEM300404K44F {
                    Text(fact.fullDescriptionAVRRMIEM300404K44F)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                        .lineSpacing(10)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
                
                // Expand/Collapse button
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        factsViewModel.toggleExpansion()
                    }
                } label: {
                    HStack(spacing: 6) {
                        Text(factsViewModel.isExpandedAVRRMIEM300404K44F ? "Show Less" : "Read More")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Image(systemName: factsViewModel.isExpandedAVRRMIEM300404K44F ? "chevron.up" : "chevron.down")
                            .font(.caption)
                    }
                    .foregroundStyle(
                        LinearGradient(
                            colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
    }
}

#Preview {
    NavigationStack {
        FactsViewAVRRMIEM300404K44F()
            .environmentObject(ThemeManagerAVRRMIEM300404K44F())

    }
}

