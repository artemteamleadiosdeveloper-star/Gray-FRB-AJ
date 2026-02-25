//
//  WebViewManager.swift


import Foundation
import WebKit
import UIKit

class WebViewManager: NSObject {
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


    
    static let shared = WebViewManager()
    
    private var webView: WKWebView?
    private var userAgentCompletion: ((String) -> Void)?
    private var isInitialized = false
    
    private override init() {
        super.init()
    }
    
    // Ініціалізує WebView та отримує customUserAgent
    func initializeWebView(completion: @escaping (String) -> Void) {
        // Якщо вже ініціалізовано, повертаємо збережений userAgent
        if isInitialized, let webView = webView, let userAgent = webView.customUserAgent {
            completion(userAgent)
            return
        }
        
        userAgentCompletion = completion
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        let newWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        newWebView.allowsBackForwardNavigationGestures = false
        
        // Отримуємо userAgent та встановлюємо customUserAgent
        newWebView.evaluateJavaScript("navigator.userAgent") { [weak self] (result, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let currentUserAgent = result as? String {
                    let customUserAgent = currentUserAgent + " Safari/604.1"
                    newWebView.customUserAgent = customUserAgent
                    self.webView = newWebView
                    self.isInitialized = true
                    print("✅ WebView initialized with customUserAgent: \(customUserAgent)")
                    self.userAgentCompletion?(customUserAgent)
                    self.userAgentCompletion = nil
                } else {
                    // Fallback
                    let defaultUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/604.1"
                    newWebView.customUserAgent = defaultUserAgent
                    self.webView = newWebView
                    self.isInitialized = true
                    print("⚠️ Using default userAgent: \(defaultUserAgent)")
                    self.userAgentCompletion?(defaultUserAgent)
                    self.userAgentCompletion = nil
                }
            }
        }
    }
    
    // Отримує поточний WebView (якщо він ініціалізований)
    func getWebView() -> WKWebView? {
        return webView
    }
    
    // Деініціалізує WebView
    func deinitializeWebView() {
        webView = nil
        isInitialized = false
        userAgentCompletion = nil
        print("🗑️ WebView deinitialized")
    }
}

