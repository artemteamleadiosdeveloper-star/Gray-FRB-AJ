//
//  SettingsView.swift


import SwiftUI
import UserNotifications
import UIKit

struct SettingsViewAVRRMIEM300404K44F: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("hapticFeedbackEnabled") private var hapticFeedbackEnabled = true
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @StateObject private var notificationManager = NotificationManagerAVRRMIEM300404K44F()
    @State private var showPermissionAlert = false
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
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
                        Text("Settings")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F.opacity(0.9)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .padding(.top, max(geometry.safeAreaInsets.top + 20, 60))
                    }
                    .padding(.bottom, 10)
                
                // App Settings
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [ConstantColorsAVRRMIEM300404K44F.gradientStartAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.gradientEndAVRRMIEM300404K44F],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        Text("App Settings")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    }
                    
                    VStack(spacing: 18) {
                        settingsRow(
                            icon: "bell.fill",
                            title: "Notifications",
                            toggle: $notificationsEnabled,
                            color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F
                        )
                        .onChange(of: notificationsEnabled, perform: { newValue in
                            if newValue {
                                Task {
                                    await requestNotificationPermission()
                                }
                            }
                        })
                        
                        settingsRow(
                            icon: "hand.tap.fill",
                            title: "Haptic Feedback",
                            toggle: $hapticFeedbackEnabled,
                            color: themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                        )
                    }
                }
                .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                .padding(.horizontal, 20)
                
                // Theme Selection
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "paintpalette.fill")
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        Text("App Theme")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    }
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 15) {
                        ForEach(AppThemeAVRRMIEM300404K44F.allCases, id: \.self) { theme in
                            themeButton(theme: theme)
                        }
                    }
                }
                .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                .padding(.horizontal, 20)
                
                // About Section
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [ConstantColorsAVRRMIEM300404K44F.gradientStartAVRRMIEM300404K44F, ConstantColorsAVRRMIEM300404K44F.gradientEndAVRRMIEM300404K44F],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        Text("About")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    }
                    
                    HStack(spacing: 12) {
                        Image(systemName: "app.badge.fill")
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F)
                        Text("Version 1.0.0")
                            .font(.body)
                            .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
                    }
                }
                .cardStyle(theme: themeManagerAVRRMIEM300404K44F)
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.vertical)
            }
        }
        .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            checkNotificationPermission()
        }
        .alert("Notification Permission Required", isPresented: $showPermissionAlert) {
            Button("Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            Button("Cancel", role: .cancel) {
                notificationsEnabled = false
            }
        } message: {
            Text("Please enable notifications in Settings to receive quiz reminders and updates.")
        }
    }
    
    private func checkNotificationPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .denied {
                    notificationsEnabled = false
                }
            }
        }
    }
    
    private func requestNotificationPermission() async {
        let granted = await notificationManager.requestAuthorization()
        
        if !granted {
            await MainActor.run {
                if notificationManager.authorizationStatusAVRRMIEM300404K44F == .denied {
                    showPermissionAlert = true
                } else {
                    notificationsEnabled = false
                }
            }
        }
    }
    
    private func themeButton(theme: AppThemeAVRRMIEM300404K44F) -> some View {
        Button {
            themeManagerAVRRMIEM300404K44F.currentThemeAVRRMIEM300404K44F = theme
        } label: {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    theme.primaryColorAVRRMIEM300404K44F,
                                    theme.secondaryColorAVRRMIEM300404K44F
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    if themeManagerAVRRMIEM300404K44F.currentThemeAVRRMIEM300404K44F == theme {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                
                Text(theme.rawValue)
                    .font(.caption)
                    .fontWeight(themeManagerAVRRMIEM300404K44F.currentThemeAVRRMIEM300404K44F == theme ? .bold : .regular)
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                themeManagerAVRRMIEM300404K44F.currentThemeAVRRMIEM300404K44F == theme ?
                theme.primaryColorAVRRMIEM300404K44F.opacity(0.2) :
                Color.clear
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        themeManagerAVRRMIEM300404K44F.currentThemeAVRRMIEM300404K44F == theme ?
                        theme.primaryColorAVRRMIEM300404K44F : Color.clear,
                        lineWidth: 2
                    )
            )
        }
    }
    
    private func settingsRow(icon: String, title: String, toggle: Binding<Bool>, color: Color) -> some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 18))
            }
            
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            Spacer()
            
            Toggle("", isOn: toggle)
                .labelsHidden()
                .tint(color)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        SettingsViewAVRRMIEM300404K44F()
            .environmentObject(ThemeManagerAVRRMIEM300404K44F())

    }
}

