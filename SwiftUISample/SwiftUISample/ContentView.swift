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
            List {
                shareNotificationLink
                rollingTextLink
                marqueeTextLink
                partlyCornerView
                tabbarView
                segmentPickerView
            }
            .navigationTitle("SwiftUI Sample")
            .navigationBarTitleDisplayMode(.large)
        }
   }

    private var shareNotificationLink: some View {
        NavigationLink {
            ShareNotificationView()
        } label: {
            Text("Share Notification")
        }
    }

    private var rollingTextLink: some View {
        NavigationLink {
            RollingText(currentText: "100", nextText: "1000", textHeight: 24, minWidth: 30, font: .systemFont(ofSize: 16))
        } label: {
            Text("RollingText")
        }
    }

    private var marqueeTextLink: some View {
        NavigationLink {
            MarqueeText(text: "scrolling animation.", font: .systemFont(ofSize: 16))
        } label: {
            Text("MarqueeText")
        }
    }

    private var partlyCornerView: some View {
        NavigationLink {
            PartlyCornerView()
        } label: {
            Text("PartlyCornerView")
        }
    }

    private var tabbarView: some View {
        NavigationLink {
            SympleTabbarView()
        } label: {
            Text("TabbarView")
        }
    }

    private var segmentPickerView: some View {
        NavigationLink {
            SegmentedPickerView()
        } label: {
            Text("SegmentPickerView")
        }
    }
    
}

#Preview {
    ContentView()
}
