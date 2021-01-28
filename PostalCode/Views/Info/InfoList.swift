//
//  InfoList.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct InfoList: View {
    let postCodeDate = "2020年12月28日"
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    InfoRow(title: "郵便番号データ", text: postCodeDate)
                }
                
                Section() {
                    InfoRow(title: "アプリバージョン", text: "1.0")
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("情報")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InfoList_Previews: PreviewProvider {
    static var previews: some View {
        InfoList()
    }
}
