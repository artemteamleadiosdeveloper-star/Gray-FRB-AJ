
    import SwiftUI

struct LoadingViewAVRRMIEM300404K44F: View {
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


    
    @StateObject private var loadingManagerAVRRMIEM300404K44F = LoadingManager.shared
    @Binding var showView: Bool
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var rotation: CGFloat = 0
    @StateObject private var themeManagerAVRRMIEM300404K44F = ThemeManagerAVRRMIEM300404K44F()
    
    var body: some View {
        // Beautiful colorful background
        ZStack {
            // Base gradient
            LinearGradient(
                colors: themeManagerAVRRMIEM300404K44F.backgroundGradientAVRRMIEM300404K44F,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Radial gradients for depth
            RadialGradient(
                colors: [
                    themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[0].opacity(0.3),
                    themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[1].opacity(0.2),
                    Color.clear
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 400
            )
            
            RadialGradient(
                colors: [
                    themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[2].opacity(0.25),
                    themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[0].opacity(0.15),
                    Color.clear
                ],
                center: .bottomTrailing,
                startRadius: 0,
                endRadius: 500
            )
        }
        
        // Loading content
        VStack(spacing: 30) {
            Spacer()
            
            // Rotating symbol with glow effect
            ZStack {
                // Glow circles
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.4),
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F.opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                    .blur(radius: 30)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[1].opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                    .blur(radius: 20)
                
                // Rotating symbol
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.secondaryColorAVRRMIEM300404K44F,
                                themeManagerAVRRMIEM300404K44F.accentColorsAVRRMIEM300404K44F[0]
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .rotationEffect(.degrees(rotation))
                    .shadow(color: themeManagerAVRRMIEM300404K44F.primaryColorAVRRMIEM300404K44F.opacity(0.6), radius: 15)
            }.onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                    guard showView else { timer.invalidate(); return }
                    
                    withAnimation {
                        rotation += 1
                    }
                }
            }
            
            // Loading text
            Text("Loading...")
                .withFontAVRRMIEM300404K44F(size: 28, weight: .semibold, color: .white)
                .padding(.top, 20)
            
            Spacer()
        }.backgroundAVRRMIEM300404K44F(1)
        .onAppear {
            // Ініціалізуємо WebView при запуску для отримання userAgent
            WebViewManager.shared.initializeWebView { _ in
                loadingManagerAVRRMIEM300404K44F.performInitialRequest()
            }
        }
        .onChange(of: loadingManagerAVRRMIEM300404K44F.urlString) { newValue in
            handleUrlStringChange(newValue)
        }
        .onChange(of: loadingManagerAVRRMIEM300404K44F.shouldHideLoading) { shouldHide in
            if shouldHide {
                showView = false
            }
        }
        .overlay {
            if loadingManagerAVRRMIEM300404K44F.shouldShowWebView {
                webViewAVRRMIEM300404K44F(urlAVRRMIEM300404K44F: loadingManagerAVRRMIEM300404K44F.urlString)
            }
        }
    }
    
    
    private func handleUrlStringChange(_ newValue: String) {
        if newValue == "error" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showView = false
            }
        }
    }
}

func webViewAVRRMIEM300404K44F(urlAVRRMIEM300404K44F: String) -> some View {
    WebViewCont(urlString: urlAVRRMIEM300404K44F)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding(.top, 7)
        .padding(.bottom,  1)
        .background(Color.black)
}



#Preview {
    LoadingViewAVRRMIEM300404K44F(showView: .constant(true))
}

