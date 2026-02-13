//
//  UserProfile.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import Foundation
import SwiftUI
internal import Combine

class UserProfileHENUF3958F35JF035: ObservableObject {
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

    
    private let defaultsHENUF3958F35JF035 = UserDefaults.standard
    
    @Published var nameHENUF3958F35JF035: String = "Player" {
        didSet {
            defaultsHENUF3958F35JF035.set(nameHENUF3958F35JF035, forKey: "userName")
        }
    }
    
    @Published var photoHENUF3958F35JF035: UIImage? = nil {
        didSet {
            if let photoHENUF3958F35JF035 = photoHENUF3958F35JF035, let dataHENUF3958F35JF035 = photoHENUF3958F35JF035.jpegData(compressionQuality: 0.8) {
                defaultsHENUF3958F35JF035.set(dataHENUF3958F35JF035, forKey: "userPhoto")
            } else {
                defaultsHENUF3958F35JF035.removeObject(forKey: "userPhoto")
            }
        }
    }
    
    @Published var totalGamesHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(totalGamesHENUF3958F35JF035, forKey: "totalGames")
        }
    }
    
    @Published var totalWinsHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(totalWinsHENUF3958F35JF035, forKey: "totalWins")
        }
    }
    
    @Published var totalScoreHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(totalScoreHENUF3958F35JF035, forKey: "totalScore")
            updateAverageScoreHENUF3958F35JF035()
        }
    }
    
    @Published var bestScoreHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(bestScoreHENUF3958F35JF035, forKey: "bestScore")
        }
    }
    
    @Published var averageScoreHENUF3958F35JF035: Double = 0.0 {
        didSet {
            defaultsHENUF3958F35JF035.set(averageScoreHENUF3958F35JF035, forKey: "averageScore")
        }
    }
    
    @Published var wordsGuessedHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(wordsGuessedHENUF3958F35JF035, forKey: "wordsGuessed")
        }
    }
    
    @Published var winStreakHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(winStreakHENUF3958F35JF035, forKey: "winStreak")
        }
    }
    
    @Published var lastChallengeDateHENUF3958F35JF035: Date? = nil {
        didSet {
            if let dateHENUF3958F35JF035 = lastChallengeDateHENUF3958F35JF035 {
                defaultsHENUF3958F35JF035.set(dateHENUF3958F35JF035, forKey: "lastChallengeDate")
            } else {
                defaultsHENUF3958F35JF035.removeObject(forKey: "lastChallengeDate")
            }
        }
    }
    
    @Published var notificationsEnabledHENUF3958F35JF035: Bool = false {
        didSet {
            defaultsHENUF3958F35JF035.set(notificationsEnabledHENUF3958F35JF035, forKey: "notificationsEnabled")
            if notificationsEnabledHENUF3958F35JF035 {
                NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.scheduleDailyChallengeReminderHENUF3958F35JF035(enabledHENUF3958F35JF035: true, hourHENUF3958F35JF035: notificationHourHENUF3958F35JF035, minuteHENUF3958F35JF035: notificationMinuteHENUF3958F35JF035)
            } else {
                NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.scheduleDailyChallengeReminderHENUF3958F35JF035(enabledHENUF3958F35JF035: false)
            }
        }
    }
    
    @Published var notificationHourHENUF3958F35JF035: Int = 9 {
        didSet {
            defaultsHENUF3958F35JF035.set(notificationHourHENUF3958F35JF035, forKey: "notificationHour")
            if notificationsEnabledHENUF3958F35JF035 {
                NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.scheduleDailyChallengeReminderHENUF3958F35JF035(enabledHENUF3958F35JF035: true, hourHENUF3958F35JF035: notificationHourHENUF3958F35JF035, minuteHENUF3958F35JF035: notificationMinuteHENUF3958F35JF035)
            }
        }
    }
    
    @Published var notificationMinuteHENUF3958F35JF035: Int = 0 {
        didSet {
            defaultsHENUF3958F35JF035.set(notificationMinuteHENUF3958F35JF035, forKey: "notificationMinute")
            if notificationsEnabledHENUF3958F35JF035 {
                NotificationManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.scheduleDailyChallengeReminderHENUF3958F35JF035(enabledHENUF3958F35JF035: true, hourHENUF3958F35JF035: notificationHourHENUF3958F35JF035, minuteHENUF3958F35JF035: notificationMinuteHENUF3958F35JF035)
            }
        }
    }
    
    var winRateHENUF3958F35JF035: Double {
        guard totalGamesHENUF3958F35JF035 > 0 else { return 0.0 }
        return Double(totalWinsHENUF3958F35JF035) / Double(totalGamesHENUF3958F35JF035) * 100.0
    }
    
    var canPlayChallengeHENUF3958F35JF035: Bool {
        guard let lastDateHENUF3958F35JF035 = lastChallengeDateHENUF3958F35JF035 else { return true }
        let calendarHENUF3958F35JF035 = Calendar.current
        return !calendarHENUF3958F35JF035.isDateInToday(lastDateHENUF3958F35JF035)
    }
    
    var challengeProgressHENUF3958F35JF035: Double {
        return min(Double(winStreakHENUF3958F35JF035) / 7.0, 1.0)
    }
    
    init() {
        loadFromDefaultsHENUF3958F35JF035()
    }
    
    func loadFromDefaultsHENUF3958F35JF035() {
        // Завантажуємо дані з UserDefaults
        let newNameHENUF3958F35JF035 = defaultsHENUF3958F35JF035.string(forKey: "userName") ?? "Player"
        nameHENUF3958F35JF035 = newNameHENUF3958F35JF035
        
        if let photoDataHENUF3958F35JF035 = defaultsHENUF3958F35JF035.data(forKey: "userPhoto") {
            photoHENUF3958F35JF035 = UIImage(data: photoDataHENUF3958F35JF035)
        } else {
            photoHENUF3958F35JF035 = nil
        }
        
        totalGamesHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "totalGames")
        totalWinsHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "totalWins")
        totalScoreHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "totalScore")
        bestScoreHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "bestScore")
        wordsGuessedHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "wordsGuessed")
        winStreakHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "winStreak")
        
        if let dateDataHENUF3958F35JF035 = defaultsHENUF3958F35JF035.object(forKey: "lastChallengeDate") as? Date {
            lastChallengeDateHENUF3958F35JF035 = dateDataHENUF3958F35JF035
        } else {
            lastChallengeDateHENUF3958F35JF035 = nil
        }
        
        notificationsEnabledHENUF3958F35JF035 = defaultsHENUF3958F35JF035.bool(forKey: "notificationsEnabled")
        notificationHourHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "notificationHour")
        if notificationHourHENUF3958F35JF035 == 0 {
            notificationHourHENUF3958F35JF035 = 9 // Default to 9 AM
        }
        notificationMinuteHENUF3958F35JF035 = defaultsHENUF3958F35JF035.integer(forKey: "notificationMinute")
        
        // Перевіряємо, чи не скинути серію перемог (якщо минув день)
        checkAndResetStreakHENUF3958F35JF035()
        
        // Перераховуємо averageScore
        updateAverageScoreHENUF3958F35JF035()
    }
    
    func checkAndResetStreakHENUF3958F35JF035() {
        guard let lastDateHENUF3958F35JF035 = lastChallengeDateHENUF3958F35JF035 else { return }
        let calendarHENUF3958F35JF035 = Calendar.current
        
        // Якщо останній челендж був не вчора і не сьогодні, скидаємо серію
        if !calendarHENUF3958F35JF035.isDateInToday(lastDateHENUF3958F35JF035) && !calendarHENUF3958F35JF035.isDateInYesterday(lastDateHENUF3958F35JF035) {
            winStreakHENUF3958F35JF035 = 0
        }
    }
    
    func completeChallengeHENUF3958F35JF035() {
        let calendarHENUF3958F35JF035 = Calendar.current
        let todayHENUF3958F35JF035 = Date()
        
        if let lastDateHENUF3958F35JF035 = lastChallengeDateHENUF3958F35JF035 {
            if calendarHENUF3958F35JF035.isDateInToday(lastDateHENUF3958F35JF035) {
                // Вже пройдено сьогодні - не додаємо до серії
                return
            } else if calendarHENUF3958F35JF035.isDateInYesterday(lastDateHENUF3958F35JF035) {
                // Продовжуємо серію (вчора пройшли, сьогодні теж)
                winStreakHENUF3958F35JF035 += 1
            } else {
                // Пропустили день - скидаємо серію
                winStreakHENUF3958F35JF035 = 1
            }
        } else {
            // Перший челендж
            winStreakHENUF3958F35JF035 = 1
        }
        
        lastChallengeDateHENUF3958F35JF035 = todayHENUF3958F35JF035
        saveHENUF3958F35JF035()
    }
    
    private func updateAverageScoreHENUF3958F35JF035() {
        if totalGamesHENUF3958F35JF035 > 0 {
            averageScoreHENUF3958F35JF035 = Double(totalScoreHENUF3958F35JF035) / Double(totalGamesHENUF3958F35JF035)
        } else {
            averageScoreHENUF3958F35JF035 = 0.0
        }
    }
    
    func saveHENUF3958F35JF035() {
        defaultsHENUF3958F35JF035.synchronize()
    }
}

