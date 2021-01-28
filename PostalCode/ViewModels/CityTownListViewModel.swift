//
//  CityTownListViewModel.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import Foundation

class CityTownListViewModel: ObservableObject {
    let prefecture: String
    @Published var postalCodeTables: [PostalCodeTable] = []
    
    init(prefecture: String) {
        self.prefecture = prefecture
    }
    
    func getList() {
        let cityTownList = DatabaseManager.shared.sqlite.getCityTownList(prefecture: prefecture)
        postalCodeTables = cityTownList
    }
}
