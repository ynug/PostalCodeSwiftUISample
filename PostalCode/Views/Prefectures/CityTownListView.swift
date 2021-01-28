//
//  PrefectureHierarchyList.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import SwiftUI

struct CityTownListView: View {
    private let prefecture: String
    @ObservedObject var cityTownListVM: CityTownListViewModel
    
    init(prefecture: String) {
        self.prefecture = prefecture
        self.cityTownListVM = CityTownListViewModel(prefecture: prefecture)
    }
    
    @State private var rows: [PostalCodeTable] = []
    
    var body: some View {
        List(cityTownListVM.postalCodeTables) { row in
            NavigationLink(destination: StreetListView(prefecture: prefecture, cityTown: row.k_city_town)) {
                PrefectureRowView(name: row.k_city_town, hurigana: row.h_city_town)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(prefecture)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            cityTownListVM.getList()
        }
    }
}

struct CityTownListView_Previews: PreviewProvider {
    static var previews: some View {
        CityTownListView(prefecture: "東京都")
    }
}
