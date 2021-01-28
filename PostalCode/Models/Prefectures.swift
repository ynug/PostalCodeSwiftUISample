//
//  Prefecture.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import Foundation

struct Prefectures {
    var prefectures: String
    var cityTown: String?
    var street: String?
    
    func getTitle() -> String {
        return "\(prefectures)\(cityTown ?? "")\(street ?? "")"
    }
}
