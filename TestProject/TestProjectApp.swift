//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@main
struct TestProjectApp: App {
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

    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) private var scenePhase
    @State var showLoading = true
    @State private var hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    
    init() {
        // Ініціалізуємо Firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if hasCompletedOnboarding {
                    MainTabViewHENUF3958F35JF035()
                        .onAppear {
                            // Clear notification badge when app opens
                            UIApplication.shared.applicationIconBadgeNumber = 0
                        }
                        .onChange(of: scenePhase) { newPhase in
                            if newPhase == .active {
                                // Clear notification badge when app becomes active
                                UIApplication.shared.applicationIconBadgeNumber = 0
                            }
                        }
                } else {
                    OnboardingViewHENUF3958F35JF035()
                        .onAppear {
                            // Listen for onboarding completion
                            NotificationCenter.default.addObserver(
                                forName: NSNotification.Name("OnboardingCompleted"),
                                object: nil,
                                queue: .main
                            ) { _ in
                                hasCompletedOnboarding = true
                            }
                        }
                }
                
                // Loading View
                if showLoading {
                    LoadingViewHENUF3958F35JF035(showViewHENUF3958F35JF035: $showLoading)
                        .onChange(of: showLoading) { newValue in
                            print(newValue)
                        }
                }
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // PushNotificationManager тепер керує всією логікою push notifications
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Передаємо APNS token в Firebase Messaging
        Messaging.messaging().apnsToken = deviceToken
        print("✅ APNS token registered")
        
        // Після встановлення APNS token, одразу спробуємо отримати FCM token
        // Це прискорить отримання token після підтвердження дозволу
        PushNotificationManager.shared.tryGetTokenAfterAPNSRegistration()
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("❌ Failed to register for remote notifications: \(error.localizedDescription)")
        // Якщо реєстрація не вдалася, одразу продовжуємо без токену
        PushNotificationManager.shared.handleTokenFailure()
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
