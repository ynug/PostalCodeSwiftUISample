//
//  SearchListViewModel.swift
//  PostalCode
//
//  Created by maca on 2021/01/28.
//

import Foundation

class SearchListViewModel: ObservableObject {
    @Published var postalCodeTables: [PostalCodeTable] = []
    
    func resetData() {
        postalCodeTables = []
    }
    
    func getList(text: String) {
        if text.isEmpty {
            postalCodeTables = []
            return
        }
        
        let streetList = DatabaseManager.shared.sqlite.getSearchList(text: text)
        postalCodeTables = streetList
        
//        var data: [PostalCodeTable] = []
//        for i in 0 ..< 10000 {
//            data.append(
//                PostalCodeTable(
//                    postal_code: "\(i)_\(text)",
//                    h_prefecture: "",
//                    h_city_town: "",
//                    h_street: "",
//                    k_prefecture: "\(i)_\(text)",
//                    k_city_town: "",
//                    k_street: ""
//                )
//            )
//        }
//
//        postalCodeTables = data
    }
}
