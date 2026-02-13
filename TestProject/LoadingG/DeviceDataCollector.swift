//
//  DeviceDataCollector.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import Foundation
import UIKit
import WebKit
import FirebaseCore
import FirebaseMessaging
import DeviceKit

class DeviceDataCollector {
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

    
    static let shared = DeviceDataCollector()
    
    private init() {}
    
    // Перевіряє, чи пристрій є iPad
    fileprivate func isDEvicePad() -> Bool {
        if let diagnosticsEnabled = ProcessInfo.processInfo.environment["CFNETWORK_DIAGNOSTICS"] {
            return true
        }
        
        let device = Device.current.description
        print("Device is: \(device)")
        return device.lowercased().contains("ipad") || device.contains("SE")
    }
    
    // Публічний метод для перевірки iPad
    func isDeviceiPad() -> Bool {
        return isDEvicePad()
    }
    
    // Отримує Bundle Identifier
    func getAppId() -> String {
        return Bundle.main.bundleIdentifier ?? "unknown"
    }
    
    // Отримує User Agent з WebViewManager (customUserAgent з Safari/604.1)
    func getUserAgent(completion: @escaping (String) -> Void) {
        WebViewManager.shared.initializeWebView { userAgent in
            completion(userAgent)
        }
    }
    
    // Отримує Firebase Push Token через PushNotificationManager
    func getPushToken(completion: @escaping (String) -> Void) {
        PushNotificationManager.shared.waitForPushToken { token in
            completion(token)
        }
    }
    
    // Збирає всі дані одночасно (спочатку чекає на push token)
    func collectAllData(completion: @escaping (String, String, String) -> Void) {
        let appId = getAppId()
        
        // Спочатку чекаємо на push token
        getPushToken { pushToken in
            // Потім отримуємо user agent
            self.getUserAgent { userAgent in
                completion(appId, pushToken, userAgent)
            }
        }
    }
}

