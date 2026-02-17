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
import AdSupport
import AdjustSdk

class DeviceDataCollector {
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
    
    // Отримує Device ID (Adjust ADID - унікальний ID з Adjust SDK)
    func getDeviceID(completion: @escaping (String) -> Void) {
        Adjust.adid { adid in
            completion(adid ?? "unknown")
        }
    }
    
    // Отримує adId (IDFV - Identifier for Vendor)
    func getAdId() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
    }
    
    // Отримує OneLink (Deeplink/Universal Link з Adjust або з UserDefaults)
    func getOneLink() -> String {
        // Спочатку перевіряємо, чи є збережений deeplink
        if let savedOneLink = UserDefaults.standard.string(forKey: "oneLink"), !savedOneLink.isEmpty {
            return savedOneLink
        }
        // Якщо немає збереженого, повертаємо порожній рядок
        return ""
    }
    
    // Отримує Naming (Attribution JSON від Adjust)
    func getNaming(completion: @escaping (String) -> Void) {
        // Перевіряємо, чи є збережений naming (заповнюється через attribution callback, якщо він налаштований)
        if let savedNaming = UserDefaults.standard.string(forKey: "naming"), !savedNaming.isEmpty {
            completion(savedNaming)
        } else {
            // Якщо немає збереженого naming, повертаємо порожній рядок
            // naming буде заповнений автоматично, коли Adjust SDK отримає attribution дані
            // та збереже їх через callback (якщо він буде налаштований в майбутньому)
            completion("")
        }
    }
    
    // Збирає всі дані одночасно (спочатку чекає на push token, deviceID та naming)
    func collectAllData(completion: @escaping (String, String, String, String, String, String, String) -> Void) {
        let appId = getAppId()
        let adId = getAdId() // IDFV
        let oneLink = getOneLink() // Deeplink/Universal Link
        
        // Отримуємо deviceID (Adjust ADID)
        getDeviceID { deviceID in
            // Отримуємо naming (Attribution JSON)
            self.getNaming { naming in
                // Спочатку чекаємо на push token
                self.getPushToken { pushToken in
                    // Потім отримуємо user agent
                    self.getUserAgent { userAgent in
                        completion(appId, deviceID, adId, pushToken, oneLink, naming, userAgent)
                    }
                }
            }
        }
    }
}

