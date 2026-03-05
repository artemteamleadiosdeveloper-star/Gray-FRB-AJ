//
//  TestProjectApp.swift


import SwiftUI
import FirebaseCore
import FirebaseMessaging
import UserNotifications
import AdjustSdk

@main
struct TestProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // Ініціалізуємо Firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentViewAVRRMIEM300404K44F()
                .preferredColorScheme(.dark)
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate, AdjustDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        let yourAppToken = "tnk055aduiv4"
        
        #if DEBUG
        let environment = ADJEnvironmentSandbox
        let adjustConfig = ADJConfig(
            appToken: yourAppToken,
            environment: environment)
        adjustConfig?.logLevel = ADJLogLevel.verbose
        
        #else
        let environment = ADJEnvironmentProduction
        let adjustConfig = ADJConfig(
            appToken: yourAppToken,
            environment: environment)
        adjustConfig?.logLevel = ADJLogLevel.suppress
        #endif
        
        // Встановлюємо delegate для отримання attribution даних
        adjustConfig?.delegate = self
        
        Adjust.initSdk(adjustConfig)
        
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
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Called when the app is about to move from the active to inactive state.
        // This will happen when the user dismisses the app, switches to a different app,
        // or quits the app.
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your app to its current state
        // in case it is terminated later.
        
        Adjust.trackSubsessionEnd()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Called when the app is about to move from the inactive to active state.
        // This will happen when the app is about to present UI.
        // Use this method to configure the app and restore previously stored state.
        
        Adjust.trackSubsessionStart()
    }
    
    // Обробка Universal Links та Custom URL Schemes для отримання oneLink
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // Обробляємо Universal Links
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
           let url = userActivity.webpageURL {
            // Зберігаємо deeplink для подальшого використання
            UserDefaults.standard.set(url.absoluteString, forKey: "oneLink")
            return true
        }
        return false
    }
    
    // Обробка Custom URL Schemes для отримання oneLink
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Зберігаємо deeplink для подальшого використання
        UserDefaults.standard.set(url.absoluteString, forKey: "oneLink")
        return true
    }
    
    // MARK: - AdjustDelegate
    
    // Отримуємо attribution дані від Adjust SDK
    func adjustAttributionChanged(_ attribution: ADJAttribution?) {
        guard let attribution = attribution else { return }
        
        // Формуємо JSON з attribution даних для naming
        var attributionDict: [String: Any] = [:]
        
        if let network = attribution.network, !network.isEmpty {
            attributionDict["network"] = network
        }
        if let campaign = attribution.campaign, !campaign.isEmpty {
            attributionDict["campaign"] = campaign
        }
        if let adgroup = attribution.adgroup, !adgroup.isEmpty {
            attributionDict["adgroup"] = adgroup
        }
        if let creative = attribution.creative, !creative.isEmpty {
            attributionDict["creative"] = creative
        }
        if let clickLabel = attribution.clickLabel, !clickLabel.isEmpty {
            attributionDict["clickLabel"] = clickLabel
        }
        if let trackerToken = attribution.trackerToken, !trackerToken.isEmpty {
            attributionDict["trackerToken"] = trackerToken
        }
        if let trackerName = attribution.trackerName, !trackerName.isEmpty {
            attributionDict["trackerName"] = trackerName
        }
        
        // Конвертуємо в JSON рядок та зберігаємо
        if !attributionDict.isEmpty,
           let jsonData = try? JSONSerialization.data(withJSONObject: attributionDict),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            UserDefaults.standard.set(jsonString, forKey: "naming")
            print("✅ Adjust attribution received and saved: \(jsonString)")
        }
    }
    
    // Отримуємо deeplink від Adjust SDK (якщо він є)
    func adjustDeeplinkResponse(_ deeplink: URL?) -> Bool {
        if let deeplink = deeplink {
            // Зберігаємо deeplink для подальшого використання
            UserDefaults.standard.set(deeplink.absoluteString, forKey: "oneLink")
            print("✅ Adjust deeplink received: \(deeplink.absoluteString)")
            // Повертаємо true, якщо хочемо, щоб Adjust SDK обробив deeplink
            // Повертаємо false, якщо хочемо обробити deeplink самостійно
            return true
        }
        return false
    }
}
