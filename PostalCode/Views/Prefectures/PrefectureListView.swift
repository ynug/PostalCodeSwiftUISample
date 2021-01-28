//
//  PrefectureList.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct PrefectureListView: View {
    
    let regions: KeyValuePairs = [
        "北海道": ["北海道"],
        "東北": [
            "青森県", "岩手県", "秋田県",
            "宮城県", "山形県", "福島県"
        ],
        "関東": [
            "茨城県", "栃木県", "群馬県",
            "埼玉県", "千葉県", "東京都",
            "神奈川県"
        ],
        "中部": [
            "新潟県", "富山県", "石川県",
            "福井県", "山梨県", "長野県",
            "岐阜県", "静岡県", "愛知県"
        ],
        "近畿": [
            "三重県", "滋賀県", "奈良県",
            "和歌山県", "京都府", "大阪府",
            "兵庫県"
        ],
        "中国": [
            "岡山県", "広島県", "鳥取県",
            "島根県", "山口県"
        ],
        "四国": [
            "香川県", "徳島県", "愛媛県",
            "高知県"
        ],
        "九州": [
            "福岡県", "佐賀県", "長崎県",
            "大分県", "熊本県", "宮崎県",
            "鹿児島県", "沖縄県"
        ]
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollViewReader { scrollProxy in
                HStack {
                    List {
                        ForEach(regions, id: \.self.key) { region in
                            Section(header: Text(region.key).id(region.key)) {
                                ForEach(region.value, id: \.self) { prefecture in
                                    NavigationLink(destination: CityTownListView(prefecture: prefecture)) {
                                        Text(prefecture)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    VStack {
                        ForEach(regions, id: \.self.key) { region in
                            Button(action: {
                                withAnimation {
                                    scrollProxy.scrollTo(region.key, anchor: .top)
                                }
                            }, label: {
                                Text(region.key)
                                    .font(.system(size: 12))
                                    .padding(.trailing, 7)
                            })
                        }
                    }
                }
            }
            .navigationTitle("都道府県")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PrefectureListView_Previews: PreviewProvider {
    static var previews: some View {
        PrefectureListView()
    }
}
