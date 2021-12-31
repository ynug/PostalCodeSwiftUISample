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
    @FocusState private var textIsForcused: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("🔍 1000000, 千代田区", text: $text)
                .onChange(of: text, perform: { newValue in
                    if newValue.count > 2 {
                        searchListVM.getList(text: text)
                    } else {
                        searchListVM.getList(text: "")
                    }
                    textIsForcused = true
                })
                .onSubmit {
                    searchListVM.getList(text: text)
                    textIsForcused = true
                }
                .focused($textIsForcused)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                // 再検索時のリストの更新には、相当時間がかかるため「.id(UUID())」を設定する
                // これは、reloadDataと同等で差分計算が行われないのでアニメーションの機能が失われる
                // しかし、数十秒以上のフリーズする上に、アニメーションは必要ないので、解決策としては問題ない
                //　https://www.youtube.com/watch?v=h0SgafWwoh8
                List(searchListVM.postalCodeTables) { row in
                    NavigationLink(destination: PostalCodeView(pc: row)) {
                        SearchResultRow(pc: row)
                        
                    }
                }
                .listStyle(PlainListStyle())
                .id(UUID())
            }
            .navigationTitle("検索")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            /// 0.5秒の遅延発生後TextFieldに初期フォーカスをあてる
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                textIsForcused = true
            }
        }
        
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
