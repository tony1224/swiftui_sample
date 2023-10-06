//
//  RollingTextSampleView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/09/26.
//

import SwiftUI

struct RollingTextSampleViewOld: View {
    @State var value = "111.1M"
    
    var body: some View {
        VStack {
//            NewRolingText(currentText: "0", nextText: "100", textHeight: 24, minWidth: 30, textColor: .blue, onAppeared: {
//                let _ = print("hoge")
//            })
//            RollingTextOld(newScore: $value, width: 80, height: 40)
            
            Button("value changed") {
                value = String(Int.random(in: 0...9000))
            }
        }
    }
}

#Preview {
    RollingTextSampleViewOld()
}
