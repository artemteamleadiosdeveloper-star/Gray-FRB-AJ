//
//  PushNotificationManager.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import Foundation
import UIKit
import UserNotifications
import FirebaseMessaging
internal import Combine

class PushNotificationManager: NSObject, ObservableObject {
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

    
    static let shared = PushNotificationManager()
    
    @Published var isTokenReady: Bool = false
    @Published var pushToken: String = ""
    
    private var tokenCompletion: ((String) -> Void)?
    
    override private init() {
        super.init()
        // Налаштовуємо delegate для Firebase Messaging
        Messaging.messaging().delegate = self
    }
    
    // Запитує дозвіл на нотифікації та реєструє пристрій
    func requestNotificationPermission(completion: @escaping (Bool, String) -> Void) {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ Notification permission error: \(error.localizedDescription)")
                    completion(false, "")
                    return
                }
                
                if granted {
                    print("✅ Notification permission granted")
                    // Реєструємо для remote notifications
                    UIApplication.shared.registerForRemoteNotifications()
                    
                    // Одразу спробуємо отримати token (якщо він вже є)
                    self?.tryGetTokenImmediately { token in
                        completion(true, token)
                    }
                } else {
                    print("❌ Notification permission denied")
                    // Якщо дозвіл відхилено, одразу повертаємо порожній токен
                    completion(false, "")
                }
            }
        }
    }
    
    // Спроба отримати token одразу
    private func tryGetTokenImmediately(completion: @escaping (String) -> Void) {
        Messaging.messaging().token { [weak self] token, error in
            DispatchQueue.main.async {
                guard let self = self else { 
                    completion("")
                    return 
                }
                if let error = error {
                    print("⚠️ Token not ready yet: \(error.localizedDescription)")
                    // Якщо токен не готовий, повертаємо порожній токен
                    // waitForPushToken збереже свій completion для delegate
                    completion("")
                } else if let token = token, !token.isEmpty {
                    print("✅ FCM token received immediately: \(token)")
                    self.pushToken = token
                    self.isTokenReady = true
                    // Викликаємо переданий completion
                    completion(token)
                } else {
                    // Якщо токен порожній, повертаємо порожній токен
                    // waitForPushToken збереже свій completion для delegate
                    completion("")
                }
            }
        }
    }
    
    // Викликається після реєстрації APNS token для швидшого отримання FCM token
    func tryGetTokenAfterAPNSRegistration() {
        guard let savedCompletion = tokenCompletion else { return }
        
        // Мінімальна затримка, щоб Firebase встиг обробити APNS token
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self = self else { return }
            // Якщо є збережений completion, спробуємо отримати токен
            if let savedCompletion = self.tokenCompletion {
                self.tryGetTokenImmediately { token in
                    // Якщо токен отримано, викликаємо збережений completion
                    if !token.isEmpty {
                        savedCompletion(token)
                        self.tokenCompletion = nil
                    } else {
                        // Якщо токен не отримано одразу, встановлюємо короткий таймаут
                        // Якщо токен не прийде за 0.5 секунди, продовжуємо без нього
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                            guard let self = self else { return }
                            if !self.isTokenReady && self.tokenCompletion != nil {
                                print("⚠️ Token not received quickly after APNS registration, proceeding without token")
                                self.tokenCompletion?("")
                                self.tokenCompletion = nil
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Чекає на отримання push token (без polling, тільки через delegate)
    func waitForPushToken(completion: @escaping (String) -> Void) {
        // Якщо token вже готовий, повертаємо його одразу
        if isTokenReady && !pushToken.isEmpty {
            completion(pushToken)
            return
        }
        
        // Зберігаємо completion handler - він буде викликаний через delegate
        tokenCompletion = completion
        
        // Fallback: якщо токен не прийде через 1 секунду, продовжуємо без нього
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            // Якщо токен все ще не готовий, викликаємо completion з порожнім токеном
            if !self.isTokenReady && self.tokenCompletion != nil {
                print("⚠️ Push token not received via delegate, proceeding without token")
                self.tokenCompletion?("")
                self.tokenCompletion = nil
            }
        }
    }
    
    // Обробляє помилку отримання токену
    func handleTokenFailure() {
        // Якщо є збережений completion, викликаємо його з порожнім токеном
        if let completion = tokenCompletion {
            print("⚠️ Token registration failed, proceeding without token")
            completion("")
            tokenCompletion = nil
        }
    }
    
    // Скидає стан (для тестування)
    func reset() {
        isTokenReady = false
        pushToken = ""
        tokenCompletion = nil
    }
}

// MARK: - UNUserNotificationCenterDelegate
extension PushNotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

// MARK: - MessagingDelegate
extension PushNotificationManager: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let token = fcmToken, !token.isEmpty {
                print("✅ FCM Registration token received via delegate: \(token)")
                self.pushToken = token
                self.isTokenReady = true
                // Викликаємо completion, якщо він є
                self.tokenCompletion?(token)
                self.tokenCompletion = nil
            }
        }
    }
}

