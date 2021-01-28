//
//  InfoRow.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct InfoRow: View {
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

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoRow(title: "郵便番号データ", text: "2020年12月28日")
            InfoRow(title: "アプリバージョン", text: "1.0")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
