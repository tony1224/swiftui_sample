//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2022/11/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                ShareNotificationView()
            } label: {
                Label("Go ShareView", systemImage: "figure.walk")
                    .font(.title)
            }
            .navigationTitle("TopView")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
