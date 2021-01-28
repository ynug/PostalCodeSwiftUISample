//
//  StreetView.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import SwiftUI

struct StreetListView: View {
    let prefecture: String
    let cityTown: String
    @ObservedObject var streetListVM: StreetListViewModel
    
    init(prefecture: String, cityTown: String) {
        self.prefecture = prefecture
        self.cityTown = cityTown
        self.streetListVM = StreetListViewModel(prefecture: prefecture, cityTown: cityTown)
    }
    
    var body: some View {
        List(streetListVM.postalCodeTables) { row in
            NavigationLink(destination: PostalCodeView(pc: row)) {
                PrefectureRowView(name: row.k_street, hurigana: row.h_street)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("\(prefecture)\(cityTown)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            streetListVM.getList()
        }
    }
}

struct StreetListView_Previews: PreviewProvider {
    static var previews: some View {
        StreetListView(prefecture: "東京都", cityTown: "府中市")
    }
}
