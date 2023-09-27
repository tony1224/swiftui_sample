//
//  RollingTextSampleView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/09/26.
//

import SwiftUI

struct RollingTextSampleView: View {
    @State var value = 111
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            RollingText(newScore: $value)
            
            Button("value changed") {
                value = .random(in: 0...9000)
            }
        }
    }
}

#Preview {
    RollingTextSampleView()
}
