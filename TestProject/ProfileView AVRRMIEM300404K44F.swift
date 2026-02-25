//
//  ProfileView.swift


import SwiftUI
import PhotosUI
import UIKit
import AVFoundation

struct ProfileViewAVRRMIEM300404K44F: View {
    @EnvironmentObject var themeManagerAVRRMIEM300404K44F: ThemeManagerAVRRMIEM300404K44F
    @AppStorage("userName") private var userName = "User"
    @AppStorage("profileImageData") private var profileImageData: Data?
    @AppStorage("totalQuizzes") private var totalQuizzes = 0
    @AppStorage("totalCorrectAnswers") private var totalCorrectAnswers = 0
    @AppStorage("totalScore") private var totalScore = 0
    @State private var isEditing = false
    @State private var editedUserName = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var showImagePicker = false
    @State private var showImageSourceActionSheet = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedUIImage: UIImage?
    
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
        ScrollView {
            VStack(spacing: 0) {
                // Hero Section with Profile Photo
                heroSection
                
                // Profile Info Section
                profileInfoSection
                
                // Statistics Grid
                statisticsGridSection
                
                Spacer(minLength: 40)
            }
        }
        .colorfulBackground(theme: themeManagerAVRRMIEM300404K44F)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadProfileImage()
            editedUserName = userName
        }
        .onChange(of: selectedPhoto, perform: { newValue in
            Task {
                guard let newValue = newValue else { return }
                if let data = try? await newValue.loadTransferable(type: Data.self) {
                    profileImageData = data
                    if let uiImage = UIImage(data: data) {
                        profileImage = Image(uiImage: uiImage)
                    }
                }
            }
        })
        .onChange(of: selectedUIImage, perform: { newValue in
            if let uiImage = newValue {
                profileImage = Image(uiImage: uiImage)
                if let imageData = uiImage.jpegData(compressionQuality: 0.8) {
                    profileImageData = imageData
                }
            }
        })
        .confirmationDialog("Select Photo", isPresented: $showImageSourceActionSheet, titleVisibility: .visible) {
            Button("Camera") {
                checkCameraPermission()
            }
            Button("Photo Library") {
                imagePickerSourceType = .photoLibrary
                showImagePicker = true
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Choose a source for your profile photo")
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerAVRRMIEM300404K44F(selectedImage: $selectedUIImage, sourceType: imagePickerSourceType)
        }
    }
    
    // MARK: - Hero Section
    private var heroSection: some View {
        ZStack(alignment: .bottom) {
            // Background gradient
            LinearGradient(
                colors: [
                    themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.3),
                    themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2),
                    Color.clear
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 280)
            .ignoresSafeArea(edges: .top)
            
            VStack(spacing: 20) {
                // Profile Photo
                ZStack {
                    // Outer glow rings
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.6),
                                    ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.4),
                                    ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F.opacity(0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 4
                        )
                        .frame(width: 140, height: 140)
                    
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F.opacity(0.4),
                                    ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F.opacity(0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 3
                        )
                        .frame(width: 130, height: 130)
                    
                    // Profile Image
                    Group {
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 110))
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
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 2)
                    )
                }
                
                // Edit Photo Button
                Button {
                    showImageSourceActionSheet = true
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Edit Photo")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.8),
                                        ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.6)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
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
            }
            .padding(.top, 60)
            .padding(.bottom, 30)
        }
    }
    
    // MARK: - Profile Info Section
    private var profileInfoSection: some View {
        VStack(spacing: 20) {
            if isEditing {
                TextField("Username", text: $editedUserName)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.6),
                                ConstantColorsAVRRMIEM300404K44F.cardBackgroundAVRRMIEM300404K44F.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.6),
                                        themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.4)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 2.5
                            )
                    )
                    .padding(.horizontal, 40)
            } else {
                Text(userName)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.9)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            // Edit/Save Button
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    if isEditing {
                        userName = editedUserName.isEmpty ? "User" : editedUserName
                        isEditing = false
                    } else {
                        editedUserName = userName
                        isEditing = true
                    }
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil")
                        .font(.system(size: 18, weight: .semibold))
                    Text(isEditing ? "Save Changes" : "Edit Profile")
                        .font(.system(size: 17, weight: .semibold))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: isEditing
                            ? [Color.green, Color.green.opacity(0.8)]
                            : [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F
                            ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(
                    color: (isEditing ? Color.green : themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F).opacity(0.4),
                    radius: 15,
                    x: 0,
                    y: 8
                )
            }
            .padding(.horizontal, 40)
        }
        .padding(.top, 20)
        .padding(.bottom, 30)
    }
    
    // MARK: - Statistics Grid
    private var statisticsGridSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F, themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                Text("Statistics")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            }
            .padding(.horizontal, 20)
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 15),
                GridItem(.flexible(), spacing: 15)
            ], spacing: 15) {
                statCard(
                    icon: "questionmark.circle.fill",
                    value: "\(totalQuizzes)",
                    label: "Quizzes",
                    gradientColors: [
                        ConstantColorsAVRRMIEM300404K44F.accentAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F
                    ]
                )
                
                statCard(
                    icon: "checkmark.circle.fill",
                    value: "\(totalCorrectAnswers)",
                    label: "Correct",
                    gradientColors: [
                        ConstantColorsAVRRMIEM300404K44F.greenAccentAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.cyanAccentAVRRMIEM300404K44F
                    ]
                )
                
                statCard(
                    icon: "star.fill",
                    value: "\(totalScore)",
                    label: "Score",
                    gradientColors: [
                        ConstantColorsAVRRMIEM300404K44F.orangeAccentAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F
                    ]
                )
                
                statCard(
                    icon: "percent",
                    value: totalQuizzes > 0 ? "\(Int((Double(totalCorrectAnswers) / Double(totalQuizzes * 10)) * 100))" : "0",
                    label: "Accuracy",
                    gradientColors: [
                        ConstantColorsAVRRMIEM300404K44F.purpleAccentAVRRMIEM300404K44F,
                        ConstantColorsAVRRMIEM300404K44F.pinkAccentAVRRMIEM300404K44F
                    ]
                )
            }
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
    }
    
    // MARK: - Stat Card
    private func statCard(icon: String, value: String, label: String, gradientColors: [Color]) -> some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                gradientColors[0].opacity(0.4),
                                gradientColors[1].opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 35
                        )
                    )
                    .frame(width: 70, height: 70)
                    .blur(radius: 10)
                
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
                    .frame(width: 60, height: 60)
                
                Image(systemName: icon)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: gradientColors[0].opacity(0.6), radius: 6, x: 0, y: 3)
            }
            
            Text(value)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.primaryTextAVRRMIEM300404K44F)
            
            Text(label)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(ConstantColorsAVRRMIEM300404K44F.secondaryTextAVRRMIEM300404K44F)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
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
                        gradientColors[0].opacity(0.1),
                        gradientColors[1].opacity(0.05)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    LinearGradient(
                        colors: [
                            gradientColors[0].opacity(0.3),
                            gradientColors[1].opacity(0.15),
                            Color.clear
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: gradientColors[0].opacity(0.2), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Helper Functions
    private func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            imagePickerSourceType = .camera
            showImagePicker = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        imagePickerSourceType = .camera
                        showImagePicker = true
                    }
                }
            }
        case .denied, .restricted:
            break
        @unknown default:
            break
        }
    }
    
    private func loadProfileImage() {
        if let data = profileImageData, let uiImage = UIImage(data: data) {
            profileImage = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileViewAVRRMIEM300404K44F()
            .environmentObject(ThemeManagerAVRRMIEM300404K44F())
    }
}
