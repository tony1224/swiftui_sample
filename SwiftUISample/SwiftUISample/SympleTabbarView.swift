//
//  TabbarView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/11/17.
//

import SwiftUI

// TODO: より複雑性のあるTabViewはこちらを参照
// https://zenn.dev/voicy/articles/8f7ee32a407541
struct SympleTabbarView: View {
    var body: some View {
        TabView {
            Text("First Tab")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .badge(5)
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Third")
                }
                .badge("New")
            
        }
    }
}

#Preview {
    TabbarView()
}
