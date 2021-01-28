//
//  PostalCodeRow.swift
//  PostalCode
//
//  Created by maca on 2021/01/28.
//

import SwiftUI

struct PostalCodeRow: View {
    var title: String
    var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(text)
                .font(.subheadline)
        }
    }
}

struct PostalCodeRow_Previews: PreviewProvider {
    static var previews: some View {
        PostalCodeRow(title: "hoge", text: "piyo")
    }
}
