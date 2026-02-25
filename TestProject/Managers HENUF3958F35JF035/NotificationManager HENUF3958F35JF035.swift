//
//  NotificationManager.swift


import Foundation
import UserNotifications

class NotificationManagerHENUF3958F35JF035 {
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

    
    static let sharedHENUF3958F35JF035 = NotificationManagerHENUF3958F35JF035()
    
    private init() {}
    
    // Request notification permission
    func requestAuthorizationHENUF3958F35JF035(completionHENUF3958F35JF035: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { grantedHENUF3958F35JF035, errorHENUF3958F35JF035 in
            DispatchQueue.main.async {
                completionHENUF3958F35JF035(grantedHENUF3958F35JF035)
            }
        }
    }
    
    // Check notification authorization status
    func checkAuthorizationStatusHENUF3958F35JF035(completionHENUF3958F35JF035: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settingsHENUF3958F35JF035 in
            DispatchQueue.main.async {
                completionHENUF3958F35JF035(settingsHENUF3958F35JF035.authorizationStatus)
            }
        }
    }
    
    // Schedule daily challenge reminder
    func scheduleDailyChallengeReminderHENUF3958F35JF035(enabledHENUF3958F35JF035: Bool, hourHENUF3958F35JF035: Int = 9, minuteHENUF3958F35JF035: Int = 0) {
        // Remove existing notifications
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyChallengeReminder"])
        
        guard enabledHENUF3958F35JF035 else { return }
        
        let contentHENUF3958F35JF035 = UNMutableNotificationContent()
        contentHENUF3958F35JF035.title = "Time to test your brain"
        contentHENUF3958F35JF035.body = "It's time to test your brain!"
        contentHENUF3958F35JF035.sound = .default
        contentHENUF3958F35JF035.badge = 1
        
        // Create date components for the notification time
        var dateComponentsHENUF3958F35JF035 = DateComponents()
        dateComponentsHENUF3958F35JF035.hour = hourHENUF3958F35JF035
        dateComponentsHENUF3958F35JF035.minute = minuteHENUF3958F35JF035
        
        // Create trigger (daily at specified time)
        let triggerHENUF3958F35JF035 = UNCalendarNotificationTrigger(dateMatching: dateComponentsHENUF3958F35JF035, repeats: true)
        
        // Create request
        let requestHENUF3958F35JF035 = UNNotificationRequest(
            identifier: "dailyChallengeReminder",
            content: contentHENUF3958F35JF035,
            trigger: triggerHENUF3958F35JF035
        )
        
        // Schedule notification
        UNUserNotificationCenter.current().add(requestHENUF3958F35JF035) { errorHENUF3958F35JF035 in
            if let errorHENUF3958F35JF035 = errorHENUF3958F35JF035 {
                print("Error scheduling notification: \(errorHENUF3958F35JF035.localizedDescription)")
            }
        }
    }
    
    // Cancel all notifications
    func cancelAllNotificationsHENUF3958F35JF035() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

