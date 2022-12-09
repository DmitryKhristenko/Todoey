//
//  AppDelegate.swift
//  Todoey
//
//  Created by Дмитрий Х on 10.10.22.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // swiftlint:disable all
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let config = Realm.Configuration(schemaVersion: 3, migrationBlock: {migration, oldSchema in if oldSchema < 3{}})
        Realm.Configuration.defaultConfiguration = config
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm \(error)")
        }
        return true
    }
}
