//
//  PostalCodeTable.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import Foundation

struct PostalCodeTable: Identifiable {
    let id: UUID
    let postal_code: String
    let h_prefecture: String
    let h_city_town: String
    let h_street: String
    let k_prefecture: String
    let k_city_town: String
    let k_street: String
    
    init(
        postal_code: String,
        h_prefecture: String,
        h_city_town: String,
        h_street: String,
        k_prefecture: String,
        k_city_town: String,
        k_street: String
    ) {
        self.id = UUID()
        self.postal_code = postal_code
        self.h_prefecture = h_prefecture
        self.h_city_town = h_city_town
        self.h_street = h_street
        self.k_prefecture = k_prefecture
        self.k_city_town = k_city_town
        self.k_street = k_street
    }
}
