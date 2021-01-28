//
//  SearchResultRow.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct SearchResultRow: View {
    var pc: PostalCodeTable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(pc.k_prefecture) \(pc.k_city_town) \(pc.k_street)")
            Text("〒\(pc.postal_code)")
                .font(.caption)
        }
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(pc:
                            PostalCodeTable(
                                postal_code: "",
                                h_prefecture: "",
                                h_city_town: "",
                                h_street: "",
                                k_prefecture: "",
                                k_city_town: "",
                                k_street: ""
                            )
        )
    }
}
