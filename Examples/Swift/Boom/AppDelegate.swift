//
//  AppDelegate.swift
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

import UIKit
import Boomware

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Init with key
        BWBoomware.setKey("key:key:key")
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Register device token to handle remote notification
        BWBoomware.setDeviceToken(deviceToken)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Check that the users info belongs to boomware
        if BWBoomware.isBoomwarePushNotification(userInfo) {
            BWBoomware.handlePushNotification(userInfo)
        }
    }
}

