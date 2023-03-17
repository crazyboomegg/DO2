//
//  AppDelegate.swift
//  DO2
//
//  Created by 江柏毅 on 2023/3/14.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(AppConfiguration.googleMapAPI)
        return true
    }
}

