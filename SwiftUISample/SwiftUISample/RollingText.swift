//
//  RollingText.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/09/26.
//

import SwiftUI

struct RollingText: View {
    @Binding var newScore: Int
    @State var animationRange: [Int] = []

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<animationRange.count, id: \.self) { index in
                let _ = print("index is \(index)")
                Text("8")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .opacity(0)
                    .overlay {
                        GeometryReader { proxy in
                            let size = proxy.size
                            VStack(spacing: 0) {
                                ForEach(0...9, id: \.self) { number in
                                    let _ = print("number is \(number)")
                                    let _ = print("height is \(size.height)")
                                    Text("\(number)")
                                        .font(.largeTitle)
                                        .fontWeight(.regular)
                                        .frame(width: size.width, height: size.height, alignment: .center)
                                }
                            }
                            .offset(y: -CGFloat(animationRange[index]) * size.height)
                        }
                        .clipped()
                    }
            }
        }
        .onAppear {
            animationRange = Array(repeating: 0, count: "\(newScore)".count)
            let _ = print("first range is \(animationRange)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                updateText()
            }
        }
//        .onChange(of: newScore) { newValue in
//            if hako.count > 2 {
//                hako.removeLast()
//            }
//            updateText()
//        }
    }
    
    func updateText() {
        let stringValue = String(newScore)
        print(stringValue)
        for (index, newScore) in zip(0..<stringValue.count, stringValue) {
            let _ = print("for in index: \(index), newScore is \(newScore)")
            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1, blendDuration: 1)) {
                animationRange[index] = (String(newScore) as NSString).integerValue
                let _ = print("update range is \(animationRange)")
            }
        }
    }

}

#Preview {
    RollingTextSampleView()
}
