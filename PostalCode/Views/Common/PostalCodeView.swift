//
//  PostalCodeView.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct PostalCodeView: View {
    var pc: PostalCodeTable
    
    var body: some View {
        List {
            Section() {
                InfoRow(title: "郵便番号", text: pc.postal_code)
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            UIPasteboard.general.string = pc.postal_code
                        }) {
                            Text("コピー")
                        }
                    }))
                InfoRow(title: "住所", text: "\(pc.k_prefecture) \(pc.k_city_town) \(pc.k_street)")
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            UIPasteboard.general.string = "\(pc.k_prefecture) \(pc.k_city_town) \(pc.k_street)"
                        }) {
                            Text("コピー")
                        }
                    }))
                InfoRow(title: "読み", text: "\(pc.h_prefecture) \(pc.h_city_town) \(pc.h_street)")
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            UIPasteboard.general.string = "\(pc.h_prefecture) \(pc.h_city_town) \(pc.h_street)"
                        }) {
                            Text("コピー")
                        }
                    }))
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("住所情報")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct PostalCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PostalCodeView(
            pc:
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
