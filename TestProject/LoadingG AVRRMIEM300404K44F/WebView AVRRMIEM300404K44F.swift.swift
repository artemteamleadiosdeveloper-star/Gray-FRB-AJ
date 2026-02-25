//
//  WebView.swift


import SwiftUI
import WebKit
import AdjustWebBridge

struct WebViewCont: UIViewRepresentable {
    
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


    
    var adjustBridge: AdjustBridge = .init()
    var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        // Використовуємо WebView з WebViewManager
        guard let existingWebView = WebViewManager.shared.getWebView() else {
            // Якщо WebView не ініціалізований, створюємо новий (fallback)
            let webConfiguration = WKWebViewConfiguration()
            webConfiguration.allowsInlineMediaPlayback = true
            
            let webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.navigationDelegate = context.coordinator
            webView.uiDelegate = context.coordinator
            webView.allowsBackForwardNavigationGestures = false
            
            // Встановлюємо customUserAgent
            webView.evaluateJavaScript("navigator.userAgent") { [weak webView] (result, error) in
                if let currentUserAgent = result as? String {
                    webView?.customUserAgent = currentUserAgent + " Safari/604.1"
                }
            }
            
            adjustBridge.loadWKWebViewBridge(webView)
            
            return webView
        }
        
        // Використовуємо існуючий WebView з WebViewManager
        existingWebView.navigationDelegate = context.coordinator
        existingWebView.uiDelegate = context.coordinator
        existingWebView.allowsBackForwardNavigationGestures = false
        
        // Ініціалізуємо AdjustBridge для існуючого WebView
        adjustBridge.loadWKWebViewBridge(existingWebView)
        
        
        return existingWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: "\(urlString)") {
            DispatchQueue.main.async {
                let request = URLRequest(url: url)
                uiView.allowsBackForwardNavigationGestures = true
                uiView.load(request)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var parent: WebViewCont
        
        init(_ parent: WebViewCont) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let finalURL = webView.url {
                guard !finalURL.absoluteString.contains("file://") &&
                        UserDefaults.standard.bool(forKey: "redirection") else { return }
                
                print("🔗 Final URL: \(finalURL.absoluteString)")
                UserDefaults.standard.set(finalURL.absoluteString, forKey: "urlString")
            }
        }
        
        func webView(_ webView: WKWebView,
                     createWebViewWith configuration: WKWebViewConfiguration,
                     for navigationAction: WKNavigationAction,
                     windowFeatures: WKWindowFeatures) -> WKWebView? {
            
            // Використовуємо вже встановлений customUserAgent
            let newWebView = WKWebView(frame: webView.frame, configuration: configuration)
            newWebView.customUserAgent = webView.customUserAgent
            
            newWebView.navigationDelegate = self
            newWebView.uiDelegate = self
            newWebView.allowsBackForwardNavigationGestures = true
            
            let newWebViewController = UIViewController()
            newWebViewController.view = newWebView
            
            if let currentWindow = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .filter({ $0.isKeyWindow }).first,
               let currentViewController = currentWindow.rootViewController {
                
                currentViewController.present(newWebViewController, animated: true, completion: nil)
            }
            
            return newWebView
        }
        
        func webViewDidClose(_ webView: WKWebView) {
            webView.removeFromSuperview()
        }
    }
}


