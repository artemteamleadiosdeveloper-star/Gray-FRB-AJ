
    import SwiftUI

struct LoadingViewREF: View {

    @StateObject private var loadingManagerREF = LoadingManager.shared
    @Binding var showView: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.blue)
        }
        .onAppear {
            // Ініціалізуємо WebView при запуску для отримання userAgent
            WebViewManager.shared.initializeWebView { _ in
                loadingManagerREF.performInitialRequest()
            }
        }
        .onChange(of: loadingManagerREF.urlString) { newValue in
            handleUrlStringChange(newValue)
        }
        .onChange(of: loadingManagerREF.shouldHideLoading) { shouldHide in
            if shouldHide {
                showView = false
            }
        }
        .overlay {
            if loadingManagerREF.shouldShowWebView {
                webViewREF(urlREF: loadingManagerREF.urlString)
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

func webViewREF(urlREF: String) -> some View {
    WebViewCont(urlString: urlREF)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .padding(.top, 7)
        .padding(.bottom,  1)
        .background(Color.black)
}



#Preview {
    LoadingViewREF(showView: .constant(true))
}

