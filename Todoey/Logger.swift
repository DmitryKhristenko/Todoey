//
//  Logger.swift
//  Todoey
//
//  Created by Дмитрий Х on 29.01.23.
//

import Foundation

class Logger {
    static let shared = Logger()
    private init() {}
    func debugPrint(
        _ message: Any,
        extra1: String = #file,
        extra2: String = #function,
        extra3: Int = #line,
        remoteLog: Bool = false,
        plain: Bool = false
    ) {
        if plain {
            print(message)
        } else {
            let filename = (extra1 as NSString).lastPathComponent
            print(message, "[\(filename) \(extra3) line]")
        }
        // if remoteLog is true record the log in server
        if remoteLog {
            //            if let msg = message as? String {
            //                logEvent(msg, event: .error, param: nil)
            //            }
        }
    }
    /// pretty print
    func prettyPrint(_ message: Any) {
        dump(message)
    }
    func printDocumentsDirectory() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("Document Path: \(documentsPath)")
    }
    /// Track event to firebase
    func logEvent(_ name: String? = nil, event: String? = nil, param: [String: Any]? = nil) {
        // Analytics.logEvent(name, parameters: param)
    }
}
