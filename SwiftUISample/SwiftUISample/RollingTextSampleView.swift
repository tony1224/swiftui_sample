//
//  RollingTextSampleView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/09/26.
//

import SwiftUI

struct RollingTextSampleView: View {
    @State var value = "111.1M"
    
    var body: some View {
        VStack {
            RollingText(newScore: $value)
            
            Button("value changed") {
                value = String(Int.random(in: 0...9000))
            }
        }
    }
}

#Preview {
    RollingTextSampleView()
}
