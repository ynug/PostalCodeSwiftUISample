//
//  DatabaseManager.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import Foundation
import UIKit

class DatabaseManager {
    
    static let shared = DatabaseManager()
    let databaseUrl: URL
    let sqlite: SQLite
    
    private init() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        databaseUrl = URL(fileURLWithPath: documentsPath).appendingPathComponent("dt")
        sqlite = SQLite()
    }
    
    func initialize() {
        copyDatabaseToDocument()
        sqlite.open(databaseUrl: databaseUrl)
    }
    
    private func copyDatabaseToDocument() {
        let asset = NSDataAsset(name: "dt")
        
        if let asset = asset,
           !FileManager.default.fileExists(atPath: databaseUrl.path) {
            do {
                try asset.data.write(to: databaseUrl)
            } catch let err {
                fatalError("database copy faile. \(err.localizedDescription)")
            }
        }

    }
    
}
