//
//  AppDelegate.swift
//  Todoey
//
//  Created by Дмитрий Х on 29.01.23.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // swiftlint:disable all
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let config = Realm.Configuration(schemaVersion: 3, migrationBlock: { migration, oldSchema in if oldSchema < 3{} })
        Realm.Configuration.defaultConfiguration = config
        do {
            _ = try Realm()
        } catch {
            Logger.shared.debugPrint("Error initialising new realm \(error)")
        }
        return true
    }
}
