//
//  SearchView.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct SearchListView: View {
    @State private var text: String = ""
    @ObservedObject var searchListVM = SearchListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("🔍 1000000, 千代田区", text: $text, onCommit: {
                    searchListVM.getList(text: text)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                List(searchListVM.postalCodeTables) { row in
                    NavigationLink(destination: PostalCodeView(pc: row)) {
                        SearchResultRow(pc: row)
                        
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("検索")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
