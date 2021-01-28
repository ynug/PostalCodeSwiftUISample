//
//  StreetViewModel.swift
//  PostalCode
//
//  Created by maca on 2021/01/28.
//

import Foundation

class StreetListViewModel: ObservableObject {
    let prefecture: String
    let cityTown: String
    @Published var postalCodeTables: [PostalCodeTable] = []
    
    init(prefecture: String, cityTown: String) {
        self.prefecture = prefecture
        self.cityTown = cityTown
    }
    
    func getList() {
        let streetList = DatabaseManager.shared.sqlite.getStreetList(prefecture: prefecture, cityTown: cityTown)
        postalCodeTables = streetList
    }
}
