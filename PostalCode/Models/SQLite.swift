//
//  SQLite.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import Foundation
import SQLite3

/**
 TODO:
 データ量も多くないので全てメインスレッドアクセスを想定
 開いたスレッド異なるスレッドからアクセスするとクラッシュする
 FMDBは本当よく出来ている。。。
 */
class SQLite {
    var op: OpaquePointer?
    var state: OpaquePointer?
    var databaseUrl: URL?
    
    init() {
        self.op = nil
        self.state = nil
        self.databaseUrl = nil
    }
    
    func open(databaseUrl: URL) {
        sqlite3_shutdown()
        sqlite3_initialize()
//        print("isThreadsafe: \(sqlite3_threadsafe())")
        
        self.databaseUrl = databaseUrl
        
        if sqlite3_open_v2(databaseUrl.path, &op, SQLITE_OPEN_READONLY, nil) != SQLITE_OK {
            assertionFailure("Unable to connect database file (\(databaseUrl)).")
        }
    }
    
    func close() {
        if sqlite3_close_v2(op) != SQLITE_OK {
            assertionFailure("Unable to close database file (\(String(describing: databaseUrl))).")
        }
        
        self.op = nil
        self.state = nil
        self.databaseUrl = nil
    }
    
    func getCityTownList(prefecture: String) -> [PostalCodeTable] {
        prepare(sql: "select distinct h_city_town, k_city_town from pc where k_prefecture = ?;")
        bind_text(order: 1, value: prefecture)
        
        var result: [PostalCodeTable] = []
        
        var step = sqlite3_step(state)
        while(step == SQLITE_ROW) {
            result.append(
                PostalCodeTable(
                    postal_code: "",
                    h_prefecture: "",
                    h_city_town: String(cString: sqlite3_column_text(state, 0)),
                    h_street: "",
                    k_prefecture: prefecture,
                    k_city_town: String(cString: sqlite3_column_text(state, 1)),
                    k_street: ""
                )
            )
            step = sqlite3_step(state)
        }
        
        if (step != SQLITE_DONE) {
            sqlite3_finalize(state)
            
            let msg = String(cString: sqlite3_errmsg(op)!)
            assertionFailure("\(msg)")
        }
        
        sqlite3_finalize(state)
        
        return result
    }
    
    func getStreetList(prefecture: String, cityTown: String) -> [PostalCodeTable] {
        prepare(sql: "select * from pc where k_prefecture = ? and k_city_town = ?;")
        bind_text(order: 1, value: prefecture)
        bind_text(order: 2, value: cityTown)
        
        var result: [PostalCodeTable] = []
        
        var step = sqlite3_step(state)
        while(step == SQLITE_ROW) {
            result.append(
                PostalCodeTable(
                    postal_code: String(cString: sqlite3_column_text(state, 0)),
                    h_prefecture: String(cString: sqlite3_column_text(state, 1)),
                    h_city_town: String(cString: sqlite3_column_text(state, 2)),
                    h_street: String(cString: sqlite3_column_text(state, 3)),
                    k_prefecture: String(cString: sqlite3_column_text(state, 4)),
                    k_city_town: String(cString: sqlite3_column_text(state, 5)),
                    k_street: String(cString: sqlite3_column_text(state, 6))
                )
            )
            step = sqlite3_step(state)
        }
        
        if (step != SQLITE_DONE) {
            sqlite3_finalize(state)
            
            let msg = String(cString: sqlite3_errmsg(op)!)
            assertionFailure("\(msg)")
        }
        
        sqlite3_finalize(state)
        
        return result
    }
    
    func getSearchList(text: String) -> [PostalCodeTable] {
        prepare(sql: """
            select * from pc where
                postal_code like ?
                or h_street like ?
                or h_city_town like ?
                or h_street like ?
                or k_prefecture like ?
                or k_city_town like ?
                or k_street like ?;
        """)
        bind_text(order: 1, value: "%\(text)%")
        bind_text(order: 2, value: "%\(text)%")
        bind_text(order: 3, value: "%\(text)%")
        bind_text(order: 4, value: "%\(text)%")
        bind_text(order: 5, value: "%\(text)%")
        bind_text(order: 6, value: "%\(text)%")
        bind_text(order: 7, value: "%\(text)%")
        
        var result: [PostalCodeTable] = []
        
        var step = sqlite3_step(state)
        while(step == SQLITE_ROW) {
            result.append(
                PostalCodeTable(
                    postal_code: String(cString: sqlite3_column_text(state, 0)),
                    h_prefecture: String(cString: sqlite3_column_text(state, 1)),
                    h_city_town: String(cString: sqlite3_column_text(state, 2)),
                    h_street: String(cString: sqlite3_column_text(state, 3)),
                    k_prefecture: String(cString: sqlite3_column_text(state, 4)),
                    k_city_town: String(cString: sqlite3_column_text(state, 5)),
                    k_street: String(cString: sqlite3_column_text(state, 6))
                )
            )
            step = sqlite3_step(state)
        }
        
        if (step != SQLITE_DONE) {
            sqlite3_finalize(state)
            
            let msg = String(cString: sqlite3_errmsg(op)!)
            assertionFailure("\(msg)")
        }
        
        sqlite3_finalize(state)
        
        return result
    }
    
    private func prepare(sql: String) {
        if sqlite3_prepare_v2(op, sql, -1, &state, nil) != SQLITE_OK {
            let msg = String(cString: sqlite3_errmsg(op)!)
            assertionFailure("Unable preparing to sql in \(sql)/ \(msg)")
        }
    }
    
    private func bind_text(order: Int32, value: String) {
        let bindValue: NSString = value as NSString
        if sqlite3_bind_text(state, order, bindValue.utf8String, -1, nil) != SQLITE_OK {
            let msg = String(cString: sqlite3_errmsg(op)!)
            assertionFailure("Unable binding text \(msg)")
        }
    }
    
}
