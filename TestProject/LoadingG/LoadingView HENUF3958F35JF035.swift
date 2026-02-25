
    import SwiftUI

struct LoadingViewHENUF3958F35JF035: View {
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

    
    @StateObject private var loadingManagerHENUF3958F35JF035 = LoadingManager.shared
    @Binding var showViewHENUF3958F35JF035: Bool
    @State private var rotationHENUF3958F35JF035: CGFloat = 0
    @State private var scaleHENUF3958F35JF035: CGFloat = 0.8
    @State private var opacityHENUF3958F35JF035: Double = 0.0
    @State private var pulseScaleHENUF3958F35JF035: CGFloat = 1.0
    @State private var particleOffsetHENUF3958F35JF035: CGFloat = 0
    @State private var gradientRotationHENUF3958F35JF035: Double = 0
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    var animatedBackgroundQHENUF3958F35JF035: some View {
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
                        x: staticOffsetXHENUF3958F35JF035(forHENUF3958F35JF035: index),
                        y: staticOffsetYHENUF3958F35JF035(forHENUF3958F35JF035: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(forHENUF3958F35JF035 indexHENUF3958F35JF035: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        
        switch indexHENUF3958F35JF035 {
        case 0:
            return -baseOffsetHENUF3958F35JF035
        case 1:
            return baseOffsetHENUF3958F35JF035
        default:
            return 0
        }
    }
    
    func staticOffsetYHENUF3958F35JF035(forHENUF3958F35JF035 indexHENUF3958F35JF035: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        
        switch indexHENUF3958F35JF035 {
        case 0:
            return -baseOffsetHENUF3958F35JF035
        case 1:
            return baseOffsetHENUF3958F35JF035
        default:
            return 0
        }
    }
    
    var animatedLogo: some View {
        ZStack {
            // Outer pulsing ring
            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.blue.opacity(0.6),
                            Color.purple.opacity(0.6),
                            Color.pink.opacity(0.6)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 4
                )
                .frame(width: 120, height: 120)
                .scaleEffect(pulseScaleHENUF3958F35JF035)
                .opacity(0.6)
            
            // Middle ring
            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.cyan.opacity(0.4),
                            Color.blue.opacity(0.4)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 3
                )
                .frame(width: 90, height: 90)
                .rotationEffect(.degrees(rotationHENUF3958F35JF035))
            
            // Inner icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.3),
                                Color.purple.opacity(0.3)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 70, height: 70)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 35, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.cyan,
                                Color.blue,
                                Color.purple
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(scaleHENUF3958F35JF035)
            }
        }
        .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 10)
    }
    
    var loadingText: some View {
        VStack(spacing: 12) {
            Text("Loading...")
                .font(.system(size: 28, weight: .bold))
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
                .opacity(opacityHENUF3958F35JF035)
            
            // Animated dots
            HStack(spacing: 8) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.cyan,
                                    Color.blue,
                                    Color.purple
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 12, height: 12)
                        .opacity(opacityHENUF3958F35JF035)
                        .offset(y: -10 * sin(Double(index) * 2 * .pi / 3 + particleOffsetHENUF3958F35JF035))
                }
            }
        }
    }
    
    var mainContent: some View {
        VStack(spacing: 30) {
            animatedLogo
            loadingText
            
            // Progress indicator
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.2)
                .opacity(opacityHENUF3958F35JF035)
        }
        .scaleEffect(scaleHENUF3958F35JF035)
        .opacity(opacityHENUF3958F35JF035)
    }
    
    var body: some View {
        ZStack {
            animatedBackgroundQHENUF3958F35JF035
            mainContent
        }
        .onAppear {
            // Ініціалізуємо WebView при запуску для отримання userAgent
            WebViewManager.shared.initializeWebView { _ in
                // Після ініціалізації WebView запускаємо анімації та запит
                startAnimations()
                loadingManagerHENUF3958F35JF035.performInitialRequest()
            }
        }
        .onChange(of: loadingManagerHENUF3958F35JF035.urlString) { newValue in
            handleUrlStringChange(newValue)
        }
        .onChange(of: loadingManagerHENUF3958F35JF035.shouldHideLoading) { shouldHide in
            if shouldHide {
                showViewHENUF3958F35JF035 = false
            }
        }
        .overlay {
            if loadingManagerHENUF3958F35JF035.shouldShowWebView {
                webViewHENUF3958F35JF035(urlHENUF3958F35JF035: loadingManagerHENUF3958F35JF035.urlString)
            }
        }
    }
    
    private func startAnimations() {
        withAnimation(.easeOut(duration: 0.8)) {
            scaleHENUF3958F35JF035 = 1.0
            opacityHENUF3958F35JF035 = 1.0
        }
        
        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
            rotationHENUF3958F35JF035 = 360
        }
        
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            pulseScaleHENUF3958F35JF035 = 1.2
        }
        
        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            particleOffsetHENUF3958F35JF035 = 2 * .pi
        }
        
        withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
            gradientRotationHENUF3958F35JF035 = 2 * .pi
        }
    }
    
    private func handleUrlStringChange(_ newValue: String) {
        if newValue == "error" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    scaleHENUF3958F35JF035 = 0.8
                    opacityHENUF3958F35JF035 = 0.0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showViewHENUF3958F35JF035 = false
            }
        }
    }
}

func webViewHENUF3958F35JF035(urlHENUF3958F35JF035: String) -> some View {
    WebViewCont(urlString: urlHENUF3958F35JF035)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding(.top, 7)
        .padding(.bottom,  1)
        .background(Color.black)
}



#Preview {
    LoadingViewHENUF3958F35JF035(showViewHENUF3958F35JF035: .constant(true))
}

