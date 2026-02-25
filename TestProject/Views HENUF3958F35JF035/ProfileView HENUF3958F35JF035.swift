//
//  ProfileView.swift


import SwiftUI
import UserNotifications

struct ProfileViewHENUF3958F35JF035: View {
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    let isActiveHENUF3958F35JF035: Bool
    @State private var showImagePickerHENUF3958F35JF035 = false
    @State private var showImageSourcePickerHENUF3958F35JF035 = false
    @State private var inputImageHENUF3958F35JF035: UIImage?
    @State private var imageSourceHENUF3958F35JF035: UIImagePickerController.SourceType = .photoLibrary
    @State private var refreshIDHENUF3958F35JF035 = UUID()
    @State private var showSettingsHENUF3958F35JF035 = false
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    var waffleFlavor = "vanilla"
    var waffleCount = 12
    var wafflePrice = 3.5
    var waffleIsHot = true
    var waffleRating = 4.8

    func bakeWaffle() -> String {
        return "Waffle is baked"
    }

    func eatWaffle(times: Int) -> Int {
        return times * 2
    }

    func waffleLength(cm: Double) -> Double {
        return cm + 5.0
    }

    func chooseWaffleColor() -> String {
        return "golden"
    }

    func waffleEnergy(calories: Int) -> Int {
        return calories + 150
    }

    
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            HStack {
                Spacer()
                ScrollView {
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                    // Profile Photo
                    ZStack {
                        // Outer glow effect
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.3),
                                        Color.purple.opacity(0.2),
                                        Color.pink.opacity(0.1)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: isIPadHENUF3958F35JF035 ? 200 : 170, height: isIPadHENUF3958F35JF035 ? 200 : 170)
                            .blur(radius: 20)
                        
                        // Main circle with gradient border
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.1),
                                            Color.white.opacity(0.05)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: isIPadHENUF3958F35JF035 ? 180 : 150, height: isIPadHENUF3958F35JF035 ? 180 : 150)
                            
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue.opacity(0.6),
                                            Color.purple.opacity(0.6),
                                            Color.pink.opacity(0.4)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 3
                                )
                                .frame(width: isIPadHENUF3958F35JF035 ? 180 : 150, height: isIPadHENUF3958F35JF035 ? 180 : 150)
                            
                            if let photoHENUF3958F35JF035 = appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.photoHENUF3958F35JF035 {
                                Image(uiImage: photoHENUF3958F35JF035)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: isIPadHENUF3958F35JF035 ? 170 : 140, height: isIPadHENUF3958F35JF035 ? 170 : 140)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 2)
                                    )
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 120 : 100))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.blue.opacity(0.6),
                                                Color.purple.opacity(0.4)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                            
                            // Camera icon badge with animation
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.blue.opacity(0.9),
                                                        Color.purple.opacity(0.8)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: isIPadHENUF3958F35JF035 ? 45 : 40, height: isIPadHENUF3958F35JF035 ? 45 : 40)
                                            .shadow(color: Color.blue.opacity(0.5), radius: 8, x: 0, y: 4)
                                        
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18))
                                            .foregroundColor(.white)
                                    }
                                    .offset(x: 5, y: 5)
                                }
                            }
                            .frame(width: isIPadHENUF3958F35JF035 ? 180 : 150, height: isIPadHENUF3958F35JF035 ? 180 : 150)
                        }
                    }
                    .onTapGesture {
                        showImageSourcePickerHENUF3958F35JF035 = true
                    }
                    .confirmationDialog("Select Photo Source", isPresented: $showImageSourcePickerHENUF3958F35JF035, titleVisibility: .visible) {
                        Button("Camera") {
                            imageSourceHENUF3958F35JF035 = .camera
                            showImagePickerHENUF3958F35JF035 = true
                        }
                        
                        Button("Photo Library") {
                            imageSourceHENUF3958F35JF035 = .photoLibrary
                            showImagePickerHENUF3958F35JF035 = true
                        }
                        
                        Button("Cancel", role: .cancel) {}
                    }
                    
                    // Name with gradient
                    Text(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.nameHENUF3958F35JF035)
                        .font(isIPadHENUF3958F35JF035 ? .system(size: 42, weight: .bold) : .largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white,
                                    Color.blue.opacity(0.8),
                                    Color.purple.opacity(0.8)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    // Statistics
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                        // Серія перемог з прогрес-баром
                        WinStreakCardHENUF3958F35JF035(
                            winStreakHENUF3958F35JF035: appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winStreakHENUF3958F35JF035,
                            progressHENUF3958F35JF035: appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.challengeProgressHENUF3958F35JF035,
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        )
                        
                        // Grid layout for stats on iPad
                        if isIPadHENUF3958F35JF035 {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Total Games", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalGamesHENUF3958F35JF035)", iconHENUF3958F35JF035: "gamecontroller.fill", colorHENUF3958F35JF035: .blue, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Wins", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalWinsHENUF3958F35JF035)", iconHENUF3958F35JF035: "trophy.fill", colorHENUF3958F35JF035: .yellow, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Best Score", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035)", iconHENUF3958F35JF035: "star.fill", colorHENUF3958F35JF035: .orange, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Average Score", valueHENUF3958F35JF035: String(format: "%.1f", appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.averageScoreHENUF3958F35JF035), iconHENUF3958F35JF035: "chart.bar.fill", colorHENUF3958F35JF035: .green, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Words Guessed", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.wordsGuessedHENUF3958F35JF035)", iconHENUF3958F35JF035: "text.bubble.fill", colorHENUF3958F35JF035: .purple, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Win Rate", valueHENUF3958F35JF035: String(format: "%.1f%%", appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winRateHENUF3958F35JF035), iconHENUF3958F35JF035: "percent", colorHENUF3958F35JF035: .red, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                            }
                        } else {
                            VStack(spacing: 20) {
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Total Games", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalGamesHENUF3958F35JF035)", iconHENUF3958F35JF035: "gamecontroller.fill", colorHENUF3958F35JF035: .blue, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Wins", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.totalWinsHENUF3958F35JF035)", iconHENUF3958F35JF035: "trophy.fill", colorHENUF3958F35JF035: .yellow, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Best Score", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.bestScoreHENUF3958F35JF035)", iconHENUF3958F35JF035: "star.fill", colorHENUF3958F35JF035: .orange, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Average Score", valueHENUF3958F35JF035: String(format: "%.1f", appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.averageScoreHENUF3958F35JF035), iconHENUF3958F35JF035: "chart.bar.fill", colorHENUF3958F35JF035: .green, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Words Guessed", valueHENUF3958F35JF035: "\(appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.wordsGuessedHENUF3958F35JF035)", iconHENUF3958F35JF035: "text.bubble.fill", colorHENUF3958F35JF035: .purple, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                                StatCardHENUF3958F35JF035(titleHENUF3958F35JF035: "Win Rate", valueHENUF3958F35JF035: String(format: "%.1f%%", appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.winRateHENUF3958F35JF035), iconHENUF3958F35JF035: "percent", colorHENUF3958F35JF035: .red, isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                            }
                        }
                    }
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 20 : 15)
                    }
                    .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                    .padding(.vertical)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                Spacer()
            }
            
            // Settings button in top right corner - outside ScrollView
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: SettingsViewHENUF3958F35JF035(isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 24))
                            .foregroundColor(.white.opacity(0.9))
                            .padding(isIPadHENUF3958F35JF035 ? 15 : 12)
                            .background(
                                Circle()
                                    .fill(Color.white.opacity(0.15))
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                    )
                            )
                    }
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showImagePickerHENUF3958F35JF035) {
            ImagePickerHENUF3958F35JF035(imageHENUF3958F35JF035: $inputImageHENUF3958F35JF035, sourceTypeHENUF3958F35JF035: imageSourceHENUF3958F35JF035)
        }
        .onChange(of: inputImageHENUF3958F35JF035) { newImageHENUF3958F35JF035 in
            if let newImageHENUF3958F35JF035 = newImageHENUF3958F35JF035 {
                appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.photoHENUF3958F35JF035 = newImageHENUF3958F35JF035
                appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.saveHENUF3958F35JF035()
                // Оновлюємо view для показу нової картинки
                refreshIDHENUF3958F35JF035 = UUID()
            }
        }
        .onChange(of: appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.photoHENUF3958F35JF035) { _ in
            // Оновлюємо view при зміні фото
            refreshIDHENUF3958F35JF035 = UUID()
        }
        .onChange(of: isActiveHENUF3958F35JF035) { activeHENUF3958F35JF035 in
            if activeHENUF3958F35JF035 {
                // Оновлюємо статистику при активації табу
                appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
            }
        }
        .onAppear {
            // Завантажуємо при першому відкритті
            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.loadFromDefaultsHENUF3958F35JF035()
        }
        .id(refreshIDHENUF3958F35JF035)
    }
    
    var animatedBackgroundHENUF3958F35JF035: some View {
        ZStack {
            // Градієнтний фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color.black,
                    Color(red: 0.15, green: 0.1, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Статичні кола на фоні
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.08),
                                Color.purple.opacity(0.05),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: isIPadHENUF3958F35JF035 ? 250 : 180
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 500 : 360, height: isIPadHENUF3958F35JF035 ? 500 : 360)
                    .offset(
                        x: staticOffsetXHENUF3958F35JF035(for: index),
                        y: staticOffsetYHENUF3958F35JF035(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    func staticOffsetYHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    struct WinStreakCardHENUF3958F35JF035: View {
        let winStreakHENUF3958F35JF035: Int
        let progressHENUF3958F35JF035: Double
        let isIPadHENUF3958F35JF035: Bool
        let targetDaysHENUF3958F35JF035 = 7
        
        var waffleFlavor = "vanilla"
        var waffleCount = 12
        var wafflePrice = 3.5
        var waffleIsHot = true
        var waffleRating = 4.8

        func bakeWaffle() -> String {
            return "Waffle is baked"
        }

        func eatWaffle(times: Int) -> Int {
            return times * 2
        }

        func waffleLength(cm: Double) -> Double {
            return cm + 5.0
        }

        func chooseWaffleColor() -> String {
            return "golden"
        }

        func waffleEnergy(calories: Int) -> Int {
            return calories + 150
        }

        
        var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(systemName: "flame.fill")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 35 : 30))
                        .foregroundColor(.orange)
                        .frame(width: isIPadHENUF3958F35JF035 ? 50 : 45)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Win Streak")
                            .font(isIPadHENUF3958F35JF035 ? .headline : .subheadline)
                            .foregroundColor(.white.opacity(0.6))
                        Text("\(winStreakHENUF3958F35JF035) days")
                            .font(isIPadHENUF3958F35JF035 ? .system(size: 28, weight: .bold) : .title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        Text("Goal: \(targetDaysHENUF3958F35JF035) days")
                            .font(isIPadHENUF3958F35JF035 ? .subheadline : .caption)
                            .foregroundColor(.white.opacity(0.6))
                        Text("\(Int(progressHENUF3958F35JF035 * 100))%")
                            .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                }
                
                // Прогрес-бар
                GeometryReader { geometryHENUF3958F35JF035 in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: isIPadHENUF3958F35JF035 ? 16 : 12)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.orange.opacity(0.8),
                                        Color.red.opacity(0.6)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geometryHENUF3958F35JF035.size.width * CGFloat(progressHENUF3958F35JF035), height: isIPadHENUF3958F35JF035 ? 16 : 12)
                            .animation(.spring(response: 0.3), value: progressHENUF3958F35JF035)
                    }
                }
                .frame(height: isIPadHENUF3958F35JF035 ? 16 : 12)
            }
            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.orange.opacity(0.15),
                        Color.red.opacity(0.1)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.orange.opacity(0.5),
                                Color.red.opacity(0.3)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .cornerRadius(15)
        }
    }
    
    struct StatCardHENUF3958F35JF035: View {
        let titleHENUF3958F35JF035: String
        let valueHENUF3958F35JF035: String
        let iconHENUF3958F35JF035: String
        let colorHENUF3958F35JF035: Color
        let isIPadHENUF3958F35JF035: Bool
        
        var waffleFlavor = "vanilla"
        var waffleCount = 12
        var wafflePrice = 3.5
        var waffleIsHot = true
        var waffleRating = 4.8

        func bakeWaffle() -> String {
            return "Waffle is baked"
        }

        func eatWaffle(times: Int) -> Int {
            return times * 2
        }

        func waffleLength(cm: Double) -> Double {
            return cm + 5.0
        }

        func chooseWaffleColor() -> String {
            return "golden"
        }

        func waffleEnergy(calories: Int) -> Int {
            return calories + 150
        }

        
        var body: some View {
            HStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                // Icon with gradient background
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    colorHENUF3958F35JF035.opacity(0.3),
                                    colorHENUF3958F35JF035.opacity(0.15)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPadHENUF3958F35JF035 ? 60 : 50, height: isIPadHENUF3958F35JF035 ? 60 : 50)
                    
                    Image(systemName: iconHENUF3958F35JF035)
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 24, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    colorHENUF3958F35JF035,
                                    colorHENUF3958F35JF035.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(titleHENUF3958F35JF035)
                        .font(isIPadHENUF3958F35JF035 ? .body : .subheadline)
                        .foregroundColor(.white.opacity(0.6))
                    Text(valueHENUF3958F35JF035)
                        .font(isIPadHENUF3958F35JF035 ? .system(size: 32, weight: .bold) : .title)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white,
                                    colorHENUF3958F35JF035.opacity(0.8)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
                
                Spacer()
            }
            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.08),
                        Color.white.opacity(0.03)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                colorHENUF3958F35JF035.opacity(0.4),
                                colorHENUF3958F35JF035.opacity(0.1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .cornerRadius(isIPadHENUF3958F35JF035 ? 20 : 15)
            .shadow(color: colorHENUF3958F35JF035.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
    
    struct ImagePickerHENUF3958F35JF035: UIViewControllerRepresentable {
        @Binding var imageHENUF3958F35JF035: UIImage?
        @Environment(\.presentationMode) var presentationModeHENUF3958F35JF035
        let sourceTypeHENUF3958F35JF035: UIImagePickerController.SourceType
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let pickerHENUF3958F35JF035 = UIImagePickerController()
            pickerHENUF3958F35JF035.delegate = context.coordinator
            pickerHENUF3958F35JF035.sourceType = sourceTypeHENUF3958F35JF035
            pickerHENUF3958F35JF035.allowsEditing = true
            return pickerHENUF3958F35JF035
        }
        
        var waffleFlavor = "vanilla"
        var waffleCount = 12
        var wafflePrice = 3.5
        var waffleIsHot = true
        var waffleRating = 4.8

        func bakeWaffle() -> String {
            return "Waffle is baked"
        }

        func eatWaffle(times: Int) -> Int {
            return times * 2
        }

        func waffleLength(cm: Double) -> Double {
            return cm + 5.0
        }

        func chooseWaffleColor() -> String {
            return "golden"
        }

        func waffleEnergy(calories: Int) -> Int {
            return calories + 150
        }

        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
        
        func makeCoordinator() -> CoordinatorHENUF3958F35JF035 {
            CoordinatorHENUF3958F35JF035(self)
        }
        
        class CoordinatorHENUF3958F35JF035: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parentHENUF3958F35JF035: ImagePickerHENUF3958F35JF035
            
            init(_ parentHENUF3958F35JF035: ImagePickerHENUF3958F35JF035) {
                self.parentHENUF3958F35JF035 = parentHENUF3958F35JF035
            }
            
            func imagePickerController(_ pickerHENUF3958F35JF035: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let imageHENUF3958F35JF035 = info[.originalImage] as? UIImage {
                    parentHENUF3958F35JF035.imageHENUF3958F35JF035 = imageHENUF3958F35JF035
                }
                parentHENUF3958F35JF035.presentationModeHENUF3958F35JF035.wrappedValue.dismiss()
            }
        }
    }
}

struct SettingsViewHENUF3958F35JF035: View {
    let isIPadHENUF3958F35JF035: Bool
    @ObservedObject private var appStateHENUF3958F35JF035 = AppStateHENUF3958F35JF035.shared
    @StateObject private var hapticManagerHENUF3958F35JF035 = HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035
    @State private var notificationAuthorizationStatusHENUF3958F35JF035: UNAuthorizationStatus = .notDetermined
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    var waffleFlavor = "vanilla"
    var waffleCount = 12
    var wafflePrice = 3.5
    var waffleIsHot = true
    var waffleRating = 4.8

    func bakeWaffle() -> String {
        return "Waffle is baked"
    }

    func eatWaffle(times: Int) -> Int {
        return times * 2
    }

    func waffleLength(cm: Double) -> Double {
        return cm + 5.0
    }

    func chooseWaffleColor() -> String {
        return "golden"
    }

    func waffleEnergy(calories: Int) -> Int {
        return calories + 150
    }

    
    private var animatedBackgroundHENUF3958F35JF035: some View {
        ZStack {
            // Градієнтний фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color.black,
                    Color(red: 0.15, green: 0.1, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Статичні кола на фоні
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.08),
                                Color.purple.opacity(0.05),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: isIPadHENUF3958F35JF035 ? 250 : 180
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 500 : 360, height: isIPadHENUF3958F35JF035 ? 500 : 360)
                    .offset(
                        x: staticOffsetXHENUF3958F35JF035(for: index),
                        y: staticOffsetYHENUF3958F35JF035(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    func staticOffsetYHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    var appVersionHENUF3958F35JF035: String {
        // Get version from Info.plist (CFBundleShortVersionString)
        guard let infoDictionary = Bundle.main.infoDictionary,
              let version = infoDictionary["CFBundleShortVersionString"] as? String,
              !version.isEmpty else {
            // Fallback: try to read from Info.plist file directly
            if let infoPlistPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
               let infoPlist = NSDictionary(contentsOfFile: infoPlistPath),
               let version = infoPlist["CFBundleShortVersionString"] as? String,
               !version.isEmpty {
                return version
            }
            return "Unknown"
        }
        return version
    }
    
    var buildNumberHENUF3958F35JF035: String {
        // Get build number from Info.plist (CFBundleVersion)
        guard let infoDictionary = Bundle.main.infoDictionary,
              let build = infoDictionary["CFBundleVersion"] as? String,
              !build.isEmpty else {
            // Fallback: try to read from Info.plist file directly
            if let infoPlistPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
               let infoPlist = NSDictionary(contentsOfFile: infoPlistPath),
               let build = infoPlist["CFBundleVersion"] as? String,
               !build.isEmpty {
                return build
            }
            return "Unknown"
        }
        return build
    }
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            HStack {
                Spacer()
                ScrollView {
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 25 : 20) {
                        // Header
                        VStack(spacing: 10) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 60 : 50))
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue,
                                            Color.purple,
                                            Color.pink
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                            
                            Text("Settings")
                                .font(isIPadHENUF3958F35JF035 ? .system(size: 42, weight: .bold) : .system(size: 34, weight: .bold))
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white,
                                            Color.white.opacity(0.8)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 15)
                        .padding(.bottom, isIPadHENUF3958F35JF035 ? 30 : 20)
                        
                        // Haptic Feedback Setting
                        SettingsCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "hand.tap.fill",
                            iconColorHENUF3958F35JF035: [.blue, .cyan],
                            titleHENUF3958F35JF035: "Haptic Feedback",
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        ) {
                            Picker("Haptic Intensity", selection: $hapticManagerHENUF3958F35JF035.intensityHENUF3958F35JF035) {
                                ForEach(HapticIntensityHENUF3958F35JF035.allCases, id: \.self) { intensityHENUF3958F35JF035 in
                                    Text(intensityHENUF3958F35JF035.description).tag(intensityHENUF3958F35JF035)
                                }
                            }
                            .pickerStyle(.segmented)
                            .onChange(of: hapticManagerHENUF3958F35JF035.intensityHENUF3958F35JF035) { _ in
                                hapticManagerHENUF3958F35JF035.selectionHENUF3958F35JF035()
                            }
                        }
                        
                        // Notifications Setting
                        SettingsCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "bell.fill",
                            iconColorHENUF3958F35JF035: [.orange, .red],
                            titleHENUF3958F35JF035: "Notifications",
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        ) {
                            HStack(spacing: isIPadHENUF3958F35JF035 ? 15 : 12) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Daily Challenge Reminder")
                                            .font(isIPadHENUF3958F35JF035 ? .body : .subheadline)
                                            .foregroundColor(.white.opacity(0.7))
                                        
                                        DatePicker(
                                            "Time",
                                            selection: Binding(
                                                get: {
                                                    let calendarHENUF3958F35JF035 = Calendar.current
                                                    var componentsHENUF3958F35JF035 = DateComponents()
                                                    componentsHENUF3958F35JF035.hour = appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationHourHENUF3958F35JF035
                                                    componentsHENUF3958F35JF035.minute = appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationMinuteHENUF3958F35JF035
                                                    return calendarHENUF3958F35JF035.date(from: componentsHENUF3958F35JF035) ?? Date()
                                                },
                                                set: { dateHENUF3958F35JF035 in
                                                    let calendarHENUF3958F35JF035 = Calendar.current
                                                    let componentsHENUF3958F35JF035 = calendarHENUF3958F35JF035.dateComponents([.hour, .minute], from: dateHENUF3958F35JF035)
                                                    appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationHourHENUF3958F35JF035 = componentsHENUF3958F35JF035.hour ?? 9
                                                    appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationMinuteHENUF3958F35JF035 = componentsHENUF3958F35JF035.minute ?? 0
                                                }
                                            ),
                                            displayedComponents: .hourAndMinute
                                        )
                                        .datePickerStyle(.compact)
                                        .colorScheme(.dark)
                                        .accentColor(.orange)
                                        .labelsHidden()
                                    }
                                    .padding(.top, 5)
                                
                                Spacer()
                                Toggle("", isOn: Binding(
                                    get: { appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationsEnabledHENUF3958F35JF035 },
                                    set: { newValueHENUF3958F35JF035 in
                                        if newValueHENUF3958F35JF035 {
                                            // Request permission first
                                            NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.requestAuthorizationHENUF3958F35JF035 { grantedHENUF3958F35JF035 in
                                                if grantedHENUF3958F35JF035 {
                                                    appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationsEnabledHENUF3958F35JF035 = true
                                                    NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.scheduleDailyChallengeReminderHENUF3958F35JF035(
                                                        enabledHENUF3958F35JF035: true,
                                                        hourHENUF3958F35JF035: appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationHourHENUF3958F35JF035,
                                                        minuteHENUF3958F35JF035: appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationMinuteHENUF3958F35JF035
                                                    )
                                                } else {
                                                    appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationsEnabledHENUF3958F35JF035 = false
                                                }
                                            }
                                        } else {
                                            appStateHENUF3958F35JF035.userProfileHENUF3958F35JF035.notificationsEnabledHENUF3958F35JF035 = false
                                        }
                                    }
                                ))
                                .tint(.orange)
                            }
                        }
                        
                        // App Version
                        SettingsCardHENUF3958F35JF035(
                            iconHENUF3958F35JF035: "info.circle.fill",
                            iconColorHENUF3958F35JF035: [.purple, .pink],
                            titleHENUF3958F35JF035: "App Information",
                            isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
                        ) {
                            VStack(spacing: isIPadHENUF3958F35JF035 ? 12 : 10) {
                                HStack {
                                    Text("Version")
                                        .font(isIPadHENUF3958F35JF035 ? .body : .subheadline)
                                        .foregroundColor(.white.opacity(0.7))
                                    Spacer()
                                    Text(appVersionHENUF3958F35JF035)
                                        .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.purple,
                                                    Color.pink
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                }
                                
                                Divider()
                                    .background(Color.white.opacity(0.1))
                                
                                HStack {
                                    Text("Build")
                                        .font(isIPadHENUF3958F35JF035 ? .body : .subheadline)
                                        .foregroundColor(.white.opacity(0.7))
                                    Spacer()
                                    Text(buildNumberHENUF3958F35JF035)
                                        .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.purple,
                                                    Color.pink
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                }
                            }
                        }
                        
                        Spacer(minLength: isIPadHENUF3958F35JF035 ? 30 : 20)
                    }
                    .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 30 : 20)
                    .padding(.vertical, isIPadHENUF3958F35JF035 ? 20 : 15)
                }
                .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                Spacer()
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        .onAppear {
            NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.checkAuthorizationStatusHENUF3958F35JF035 { statusHENUF3958F35JF035 in
                notificationAuthorizationStatusHENUF3958F35JF035 = statusHENUF3958F35JF035
            }
        }
    }
}

struct SettingsCardHENUF3958F35JF035<Content: View>: View {
    let iconHENUF3958F35JF035: String
    let iconColorHENUF3958F35JF035: [Color]
    let titleHENUF3958F35JF035: String
    let isIPadHENUF3958F35JF035: Bool
    let contentHENUF3958F35JF035: Content
    
    init(iconHENUF3958F35JF035: String, iconColorHENUF3958F35JF035: [Color], titleHENUF3958F35JF035: String, isIPadHENUF3958F35JF035: Bool, @ViewBuilder content: () -> Content) {
        self.iconHENUF3958F35JF035 = iconHENUF3958F35JF035
        self.iconColorHENUF3958F35JF035 = iconColorHENUF3958F35JF035
        self.titleHENUF3958F35JF035 = titleHENUF3958F35JF035
        self.isIPadHENUF3958F35JF035 = isIPadHENUF3958F35JF035
        self.contentHENUF3958F35JF035 = content()
    }
    
    var waffleFlavor = "vanilla"
    var waffleCount = 12
    var wafflePrice = 3.5
    var waffleIsHot = true
    var waffleRating = 4.8

    func bakeWaffle() -> String {
        return "Waffle is baked"
    }

    func eatWaffle(times: Int) -> Int {
        return times * 2
    }

    func waffleLength(cm: Double) -> Double {
        return cm + 5.0
    }

    func chooseWaffleColor() -> String {
        return "golden"
    }

    func waffleEnergy(calories: Int) -> Int {
        return calories + 150
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: isIPadHENUF3958F35JF035 ? 18 : 15) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: iconColorHENUF3958F35JF035.map { $0.opacity(0.2) }),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPadHENUF3958F35JF035 ? 50 : 42, height: isIPadHENUF3958F35JF035 ? 50 : 42)
                    
                    Image(systemName: iconHENUF3958F35JF035)
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 22 : 18, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: iconColorHENUF3958F35JF035),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                .shadow(color: iconColorHENUF3958F35JF035.first?.opacity(0.3) ?? .clear, radius: 8, x: 0, y: 4)
                
                Text(titleHENUF3958F35JF035)
                    .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white,
                                Color.white.opacity(0.9)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            
            contentHENUF3958F35JF035
        }
        .padding(isIPadHENUF3958F35JF035 ? 25 : 20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.03)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.15),
                                    Color.white.opacity(0.05)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                )
                .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 8)
                .shadow(color: iconColorHENUF3958F35JF035.first?.opacity(0.1) ?? .clear, radius: 20, x: 0, y: 10)
        )
    }
}

#Preview {
    ProfileViewHENUF3958F35JF035(isActiveHENUF3958F35JF035: true)
}



