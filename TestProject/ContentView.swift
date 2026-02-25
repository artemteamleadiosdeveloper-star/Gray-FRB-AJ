//
//  ContentView.swift
//  AVRRMIEM300404K44F
//
//  Created by Tehnichka on 09.02.2026.
//

import SwiftUI

struct ContentViewAVRRMIEM300404K44F: View {
    
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @StateObject private var viewModelAVRRMIEM300404K44F = QuestionViewModelAVRRMIEM300404K44F()
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
            ScrollView {
                VStack(spacing: 20) {
                    inputCardAVRRMIEM300404K44F
                    actionButtonAVRRMIEM300404K44F
                    if viewModelAVRRMIEM300404K44F.isLoadingAVRRMIEM300404K44F {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tint(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
                    }
                    questionListAVRRMIEM300404K44F
                    if let errorAVRRMIEM300404K44F = viewModelAVRRMIEM300404K44F.errorMessageAVRRMIEM300404K44F {
                        errorViewAVRRMIEM300404K44F(messageAVRRMIEM300404K44F: errorAVRRMIEM300404K44F)
                    }
                }
                .padding()
            }
            .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
            .navigationTitle("Quiz Builder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { await viewModelAVRRMIEM300404K44F.generateQuestionsAVRRMIEM300404K44F() }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .disabled(viewModelAVRRMIEM300404K44F.isLoadingAVRRMIEM300404K44F)
                }
            }
        }
    }

    private var inputCardAVRRMIEM300404K44F: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quiz Topic")
                .font(.headline)
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            TextField("For example: SwiftUI", text: $viewModelAVRRMIEM300404K44F.topicAVRRMIEM300404K44F)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            VStack(alignment: .leading) {
                Text("Number of questions: \(viewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F)")
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                Stepper(value: $viewModelAVRRMIEM300404K44F.desiredCountAVRRMIEM300404K44F, in: 1 ... 10) {
                    EmptyView()
                }
            }
        }
        .padding()
        .background(ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 6)
    }

    private var actionButtonAVRRMIEM300404K44F: some View {
        Button {
            Task { await viewModelAVRRMIEM300404K44F.generateQuestionsAVRRMIEM300404K44F() }
        } label: {
            HStack {
                Image(systemName: "sparkles")
                Text(viewModelAVRRMIEM300404K44F.isLoadingAVRRMIEM300404K44F ? "Loading..." : "Get Questions")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(viewModelAVRRMIEM300404K44F.isLoadingAVRRMIEM300404K44F)
        .opacity(viewModelAVRRMIEM300404K44F.isLoadingAVRRMIEM300404K44F ? 0.7 : 1)
    }

    private var questionListAVRRMIEM300404K44F: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(viewModelAVRRMIEM300404K44F.questionsAVRRMIEM300404K44F) { questionAVRRMIEM300404K44F in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
                    Text(questionAVRRMIEM300404K44F.textAVRRMIEM300404K44F)
                        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }

    private func errorViewAVRRMIEM300404K44F(messageAVRRMIEM300404K44F: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
            Text(messageAVRRMIEM300404K44F)
                .font(.footnote)
        }
        .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
        .padding()
        .frame(maxWidth: .infinity)
        .background(ConstantColorsAVRRMIEM300404K44F.destructiveAVRRMIEM300404K44F.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    ContentViewAVRRMIEM300404K44F()
        .environmentObject(ThemeManagerAVRRMIEM300404K44F())

}

