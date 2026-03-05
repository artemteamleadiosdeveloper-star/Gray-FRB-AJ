
    import SwiftUI

struct LoadingViewAVRRMIEM300404K44F: View {

    @StateObject private var loadingManagerAVRRMIEM300404K44F = LoadingManager.shared
    @Binding var showView: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.blue)
        }
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

