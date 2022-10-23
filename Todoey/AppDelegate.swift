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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = Realm.Configuration(schemaVersion: 1, migrationBlock: {migration, oldSchema in if oldSchema < 1{}})
        Realm.Configuration.defaultConfiguration = config
        
           //     print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
            
        } catch {
            print("Error initialising new realm \(error)")
        }
        return true
    }
    
}
