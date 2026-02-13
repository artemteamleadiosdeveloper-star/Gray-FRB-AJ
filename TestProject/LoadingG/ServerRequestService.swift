//
//  ServerRequestService.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import Foundation

class ServerRequestService {
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

    
    static let shared = ServerRequestService()
    
    private let apiURL = "https://test.oleksandr-teamlead-unitydev.workers.dev/"
    private let requestMadeKey = "serverRequestMade"
    private let dataCollector = DeviceDataCollector.shared
    
    private init() {}
    
    // Перевіряє, чи вже був зроблений запит
    var hasRequestBeenMade: Bool {
        return UserDefaults.standard.bool(forKey: requestMadeKey)
    }
    
    // Відправляє запит на сервер
    func sendInitialRequest(completion: @escaping (String?) -> Void) {
        // Перевіряємо, чи вже був зроблений запит
        if hasRequestBeenMade {
            // Якщо запит вже був зроблений, просто повертаємо збережене значення
            let savedUrl = UserDefaults.standard.string(forKey: "urlString") ?? "error"
            completion(savedUrl == "" ? "error" : savedUrl)
            return
        }
        
        // Збираємо всі дані через DeviceDataCollector
        dataCollector.collectAllData { appId, pushToken, userAgent in
            // Формуємо JSON
            let requestBody: [String: Any] = [
                "appId": appId,
                "pushToken": pushToken,
                "userAgent": userAgent
            ]
            
            // Відправляємо запит
            self.performRequest(body: requestBody) { responseUrl in
                // Позначаємо, що запит був зроблений
                UserDefaults.standard.set(true, forKey: self.requestMadeKey)
                
                // Зберігаємо результат
                if let url = responseUrl, !url.isEmpty {
                    UserDefaults.standard.set(url, forKey: "urlString")
                    completion(url)
                } else {
                    UserDefaults.standard.set("error", forKey: "urlString")
                    completion("error")
                }
            }
        }
    }
    
    // Виконує HTTP запит
    private func performRequest(body: [String: Any], completion: @escaping (String?) -> Void) {
        guard let url = URL(string: apiURL) else {
            print("❌ Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            print("❌ Error encoding JSON: \(error)")
            completion(nil)
            return
        }
        
        print("📤 Sending request to: \(apiURL)")
        print("📦 Body: \(body)")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Request error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ Invalid response")
                completion(nil)
                return
            }
            
            print("📥 Response status: \(httpResponse.statusCode)")
            
            guard let data = data else {
                print("❌ No data in response")
                completion(nil)
                return
            }
            
            // Парсимо JSON відповідь
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                // Перевіряємо поле redirectUrlInitial
                if let redirectUrl = json["redirectUrlInitial"] as? String {
                    if !redirectUrl.isEmpty {
                        print("✅ Received redirectUrlInitial: \(redirectUrl)")
                        completion(redirectUrl)
                    } else {
                        print("⚠️ redirectUrlInitial is empty")
                        completion(nil)
                    }
                } else {
                    let jsonString = String(data: data, encoding: .utf8) ?? "unknown"
                    print("⚠️ JSON response but redirectUrlInitial field not found: \(jsonString)")
                    completion(nil)
                }
            } else {
                // Якщо відповідь не JSON
                let responseString = String(data: data, encoding: .utf8) ?? "empty"
                print("⚠️ Invalid JSON response: \(responseString)")
                completion(nil)
            }
        }.resume()
    }
    
    // Метод для скидання (для тестування)
    func reset() {
        UserDefaults.standard.removeObject(forKey: requestMadeKey)
        UserDefaults.standard.removeObject(forKey: "urlString")
    }
}

