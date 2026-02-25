//
//  OnboardingView.swift


import SwiftUI

struct OnboardingViewHENUF3958F35JF035: View {
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

    
    @State private var currentPageHENUF3958F35JF035 = 0
    @State private var showNotificationRequestHENUF3958F35JF035 = false
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    let pagesHENUF3958F35JF035: [OnboardingPageHENUF3958F35JF035] = [
        OnboardingPageHENUF3958F35JF035(
            iconHENUF3958F35JF035: "brain.head.profile",
            titleHENUF3958F35JF035: "Welcome to Test Quiz!",
            descriptionHENUF3958F35JF035: "Challenge your knowledge with various quiz modes, word guessing games, and interesting facts.",
            gradientColorsHENUF3958F35JF035: [.blue, .purple]
        ),
        OnboardingPageHENUF3958F35JF035(
            iconHENUF3958F35JF035: "gamecontroller.fill",
            titleHENUF3958F35JF035: "Multiple Game Modes",
            descriptionHENUF3958F35JF035: "Play solo, compete with friends, challenge AI, or test your speed with Time Attack mode.",
            gradientColorsHENUF3958F35JF035: [.green, .cyan]
        ),
        OnboardingPageHENUF3958F35JF035(
            iconHENUF3958F35JF035: "flame.fill",
            titleHENUF3958F35JF035: "Daily Challenges",
            descriptionHENUF3958F35JF035: "Complete daily challenges to maintain your win streak and unlock achievements.",
            gradientColorsHENUF3958F35JF035: [.orange, .red]
        ),
        OnboardingPageHENUF3958F35JF035(
            iconHENUF3958F35JF035: "lightbulb.fill",
            titleHENUF3958F35JF035: "Learn & Explore",
            descriptionHENUF3958F35JF035: "Discover interesting facts, expand your vocabulary, and improve your knowledge every day.",
            gradientColorsHENUF3958F35JF035: [.purple, .pink]
        )
    ]
    
    var body: some View {
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            VStack(spacing: 0) {
                // Page indicator
                HStack(spacing: 8) {
                    ForEach(0..<pagesHENUF3958F35JF035.count, id: \.self) { indexHENUF3958F35JF035 in
                        Circle()
                            .fill(indexHENUF3958F35JF035 == currentPageHENUF3958F35JF035 ? Color.white : Color.white.opacity(0.3))
                            .frame(width: indexHENUF3958F35JF035 == currentPageHENUF3958F35JF035 ? 12 : 8, height: indexHENUF3958F35JF035 == currentPageHENUF3958F35JF035 ? 12 : 8)
                            .animation(.spring(response: 0.3), value: currentPageHENUF3958F35JF035)
                    }
                }
                .padding(.top, isIPadHENUF3958F35JF035 ? 50 : 40)
                .padding(.bottom, isIPadHENUF3958F35JF035 ? 30 : 20)
                
                // Page content
                TabView(selection: $currentPageHENUF3958F35JF035) {
                    ForEach(0..<pagesHENUF3958F35JF035.count, id: \.self) { indexHENUF3958F35JF035 in
                        OnboardingPageViewHENUF3958F35JF035(pageHENUF3958F35JF035: pagesHENUF3958F35JF035[indexHENUF3958F35JF035], isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
                            .tag(indexHENUF3958F35JF035)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                
                // Navigation buttons
                HStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    if currentPageHENUF3958F35JF035 > 0 {
                        Button(action: {
                            withAnimation {
                                currentPageHENUF3958F35JF035 -= 1
                            }
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Previous")
                            }
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(isIPadHENUF3958F35JF035 ? 18 : 15)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    
                    Button(action: {
                        if currentPageHENUF3958F35JF035 < pagesHENUF3958F35JF035.count - 1 {
                            withAnimation {
                                currentPageHENUF3958F35JF035 += 1
                            }
                        } else {
                            // Last page - request notifications
                            showNotificationRequestHENUF3958F35JF035 = true
                        }
                    }) {
                        HStack {
                            Text(currentPageHENUF3958F35JF035 < pagesHENUF3958F35JF035.count - 1 ? "Next" : "Get Started")
                            if currentPageHENUF3958F35JF035 < pagesHENUF3958F35JF035.count - 1 {
                                Image(systemName: "chevron.right")
                            }
                        }
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(isIPadHENUF3958F35JF035 ? 18 : 15)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue,
                                            Color.purple
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                        )
                    }
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 30)
                .padding(.bottom, isIPadHENUF3958F35JF035 ? 50 : 40)
            }
        }
        .sheet(isPresented: $showNotificationRequestHENUF3958F35JF035) {
            NotificationPermissionViewHENUF3958F35JF035(isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035)
        }
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
}

struct OnboardingPageHENUF3958F35JF035 {
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

    
    let iconHENUF3958F35JF035: String
    let titleHENUF3958F35JF035: String
    let descriptionHENUF3958F35JF035: String
    let gradientColorsHENUF3958F35JF035: [Color]
}

struct OnboardingPageViewHENUF3958F35JF035: View {
    let pageHENUF3958F35JF035: OnboardingPageHENUF3958F35JF035
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
        VStack(spacing: isIPadHENUF3958F35JF035 ? 50 : 40) {
            Spacer()
            
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: pageHENUF3958F35JF035.gradientColorsHENUF3958F35JF035.map { $0.opacity(0.2) }),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 200 : 150, height: isIPadHENUF3958F35JF035 ? 200 : 150)
                    .blur(radius: 30)
                
                Image(systemName: pageHENUF3958F35JF035.iconHENUF3958F35JF035)
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 100 : 80, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: pageHENUF3958F35JF035.gradientColorsHENUF3958F35JF035),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: pageHENUF3958F35JF035.gradientColorsHENUF3958F35JF035.first?.opacity(0.5) ?? .clear, radius: 20, x: 0, y: 10)
            }
            
            // Title
            Text(pageHENUF3958F35JF035.titleHENUF3958F35JF035)
                .font(.system(size: isIPadHENUF3958F35JF035 ? 42 : 32, weight: .bold))
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
                .multilineTextAlignment(.center)
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 30)
            
            // Description
            Text(pageHENUF3958F35JF035.descriptionHENUF3958F35JF035)
                .font(.system(size: isIPadHENUF3958F35JF035 ? 22 : 18))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 50 : 40)
            
            Spacer()
        }
        .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
        .padding()
    }
}

struct NotificationPermissionViewHENUF3958F35JF035: View {
    let isIPadHENUF3958F35JF035: Bool
    @Environment(\.dismiss) private var dismissHENUF3958F35JF035
    @State private var isRequestingHENUF3958F35JF035 = false
    
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
            Color.black.ignoresSafeArea()
            
            VStack(spacing: isIPadHENUF3958F35JF035 ? 40 : 30) {
                Spacer()
                
                // Icon
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.orange.opacity(0.2),
                                    Color.red.opacity(0.2)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isIPadHENUF3958F35JF035 ? 180 : 140, height: isIPadHENUF3958F35JF035 ? 180 : 140)
                        .blur(radius: 30)
                    
                    Image(systemName: "bell.fill")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 90 : 70, weight: .medium))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [.orange, .red]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 10)
                }
                
                // Title
                Text("Stay Updated")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 38 : 30, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                // Description
                Text("Enable notifications to receive daily challenge reminders and never miss a chance to test your brain!")
                    .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 50 : 40)
                
                Spacer()
                
                // Buttons
                VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                    Button(action: {
                        isRequestingHENUF3958F35JF035 = true
                        NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.requestAuthorizationHENUF3958F35JF035 { grantedHENUF3958F35JF035 in
                            isRequestingHENUF3958F35JF035 = false
                            // Save onboarding completion
                            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                            NotificationCenter.default.post(name: NSNotification.Name("OnboardingCompleted"), object: nil)
                            dismissHENUF3958F35JF035()
                        }
                    }) {
                        HStack {
                            if isRequestingHENUF3958F35JF035 {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Image(systemName: "bell.fill")
                                Text("Enable Notifications")
                            }
                        }
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(isIPadHENUF3958F35JF035 ? 20 : 18)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.orange, .red]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .shadow(color: .orange.opacity(0.5), radius: 10, x: 0, y: 5)
                        )
                    }
                    .disabled(isRequestingHENUF3958F35JF035)
                    
                    Button(action: {
                        // Skip notifications, just complete onboarding
                        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                        NotificationCenter.default.post(name: NSNotification.Name("OnboardingCompleted"), object: nil)
                        dismissHENUF3958F35JF035()
                    }) {
                        Text("Maybe Later")
                            .font(.system(size: isIPadHENUF3958F35JF035 ? 18 : 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(isIPadHENUF3958F35JF035 ? 18 : 15)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 30)
                .padding(.bottom, isIPadHENUF3958F35JF035 ? 50 : 40)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingViewHENUF3958F35JF035()
}

