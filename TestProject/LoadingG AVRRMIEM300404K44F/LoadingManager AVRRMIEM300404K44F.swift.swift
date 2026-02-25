//
//  LoadingManager.swift


import Foundation
import SwiftUI
internal import Combine

class LoadingManager: ObservableObject {
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


    
    static let shared = LoadingManager()
    
    @Published var urlString: String = ""
    @Published var shouldHideLoading: Bool = false
    
    private let urlStringKey = "urlString"
    private var hasRequested = false
    private var cancellables = Set<AnyCancellable>()
    
    private init() {
        // Завантажуємо збережене значення при ініціалізації
        urlString = UserDefaults.standard.string(forKey: urlStringKey) ?? ""
        // Налаштовуємо спостереження за змінами
        setupObservers()
    }
    
    // Виконує запит на сервер при першому відкритті
    func performInitialRequest() {
        // Перевіряємо, чи вже був зроблений запит
        if hasRequested {
            // Якщо запит вже був зроблений, перевіряємо збережене значення
            handleSavedUrl()
            return
        }
        
        hasRequested = true
        
        // Перевіряємо, чи пристрій є iPad
        if DeviceDataCollector.shared.isDeviceiPad() {
            print("⚠️ Device is iPad, skipping server request and setting error")
            // Якщо iPad, не робимо запит і зберігаємо "error"
            saveUrl("error")
            scheduleLoadingHide()
            return
        }
        
        // Запитуємо дозвіл на нотифікації та одразу отримуємо результат
        PushNotificationManager.shared.requestNotificationPermission { [weak self] granted, pushToken in
            guard let self = self else { return }
            
            // Якщо дозвіл надано, але токен ще не готовий, чекаємо на нього через delegate
            if granted && pushToken.isEmpty {
                PushNotificationManager.shared.waitForPushToken { [weak self] finalToken in
                    guard let self = self else { return }
                    // Після отримання token (або якщо він порожній), виконуємо запит на сервер
                    DispatchQueue.main.async {
                        self.sendServerRequest()
                    }
                }
            } else {
                // Якщо дозвіл відхилено або токен вже є, одразу виконуємо запит
                DispatchQueue.main.async {
                    self.sendServerRequest()
                }
            }
        }
    }
    
    // Відправляє запит на сервер з усіма даними
    private func sendServerRequest() {
        ServerRequestService.shared.sendInitialRequest { [weak self] responseUrl in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let url = responseUrl, url != "error" && !url.isEmpty {
                    // Якщо отримали URL, зберігаємо і встановлюємо
                    self.saveUrl(url)
                } else {
                    // Якщо не отримали URL або отримали "error", деініціалізуємо WebView
                    WebViewManager.shared.deinitializeWebView()
                    // Встановлюємо error
                    self.saveUrl("error")
                    // Плануємо закриття loading через 2.5 секунди
                    self.scheduleLoadingHide()
                }
            }
        }
    }
    
    // Обробляє збережене значення URL
    private func handleSavedUrl() {
        if urlString == "error" || urlString.isEmpty {
            // Якщо збережене значення - error або порожнє, деініціалізуємо WebView
            WebViewManager.shared.deinitializeWebView()
            // Плануємо закриття loading
            scheduleLoadingHide()
        }
        // Якщо є URL, він вже встановлений і WebView буде показано
    }
    
    // Зберігає URL в UserDefaults та встановлює в published property
    private func saveUrl(_ url: String) {
        urlString = url
        UserDefaults.standard.set(url, forKey: urlStringKey)
    }
    
    // Планує закриття loading view
    private func scheduleLoadingHide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.shouldHideLoading = true
        }
    }
    
    // Перевіряє, чи потрібно показувати WebView
    var shouldShowWebView: Bool {
        return urlString != "error" && !urlString.isEmpty
    }
    
    // Ініціалізує спостереження за змінами urlString
    func setupObservers() {
        $urlString
            .sink { [weak self] newValue in
                guard let self = self else { return }
                // Якщо urlString змінився на "error", плануємо закриття
                if newValue == "error" {
                    self.scheduleLoadingHide()
                }
            }
            .store(in: &cancellables)
    }
    
    // Метод для скидання (для тестування)
    func reset() {
        hasRequested = false
        urlString = ""
        shouldHideLoading = false
        UserDefaults.standard.removeObject(forKey: urlStringKey)
        ServerRequestService.shared.reset()
    }
}

