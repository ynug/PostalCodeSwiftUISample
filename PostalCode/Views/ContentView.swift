//
//  ContentView.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case search
        case info
    }
    
    var body: some View {
        TabView(selection: $selection) {
            
            PrefectureListView()
            .tabItem {
                Label("都道府県", systemImage: "list.bullet")
            }
            .tag(Tab.list)
            
            
            SearchListView()
                .tabItem {
                    Label("検索", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            
            InfoList()
            .tabItem {
                Label("情報", systemImage: "info.circle")
            }
            .tag(Tab.info)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
