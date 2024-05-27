//
//  WeatherButton.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2024/05/28.
//

import SwiftUI

struct WeatherButton: View {
    @State private var text = "GET"
    
    private let url = URL(string: "https://wttr.in/?format=3")!
    
    var body: some View {
        Button(text) {
            text = "Loading ..."
            Task {
                for try await line in url.lines {
                    text = line
                }
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    WeatherButton()
}
