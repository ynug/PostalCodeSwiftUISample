//
//  PrefectureHierarchyRow.swift
//  PostalCode
//
//  Created by maca on 2021/01/27.
//

import SwiftUI

struct PrefectureRowView: View {
    var name: String
    var hurigana: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
            Text(hurigana)
                .font(.caption)
        }
    }
}

struct PrefectureRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrefectureRowView(name: "東京都調布市", hurigana: "とうきょうとちょうふし")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
