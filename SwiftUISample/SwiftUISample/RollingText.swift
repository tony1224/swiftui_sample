//
//  RollingText.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/09/26.
//

import SwiftUI

struct RollingText: View {
//    @Binding var newScore: Int
    @Binding var newScore: String
//    @State var animationRange: [Int] = []
    @State var scores: [String] = ["0"]

    var body: some View {
        Text("88888888")
            .font(.largeTitle)
            .fontWeight(.regular)
            .opacity(0)
            .overlay {
                GeometryReader { proxy in
                    let size = proxy.size
                    VStack(spacing: 0) {
                        ForEach(scores, id: \.self) { currentScore in
                            let _ = print("number is \(currentScore)")
                            Text("\(currentScore)")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                                .frame(width: size.width, height: size.height, alignment: .center)
                        }
                    }
                    .offset(y: -size.height)
                }
                .clipped()
            }
            .onAppear {
                let _ = print("first range is \(scores)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                    updateText()
                }
            }
            .onChange(of: newScore) { newValue in
                if scores.count > 1 {
                    scores.removeFirst()
                    print("remove last element")
                }
                updateText()
            }
        
//        HStack(spacing: 0) {
//            ForEach(0..<animationRange.count, id: \.self) { index in
//                let _ = print("index is \(index)")
//                Text("8")
//                    .font(.largeTitle)
//                    .fontWeight(.regular)
//                    .opacity(0)
//                    .overlay {
//                        GeometryReader { proxy in
//                            let size = proxy.size
//                            VStack(spacing: 0) {
//                                ForEach(0...9, id: \.self) { number in
//                                    let _ = print("number is \(number)")
//                                    let _ = print("height is \(size.height)")
//                                    Text("\(number)")
//                                        .font(.largeTitle)
//                                        .fontWeight(.regular)
//                                        .frame(width: size.width, height: size.height, alignment: .center)
//                                }
//                            }
//                            .offset(y: -CGFloat(animationRange[index]) * size.height)
//                        }
//                        .clipped()
//                    }
//            }
//        }
//        .onAppear {
//            animationRange = Array(repeating: 0, count: "\(newScore)".count)
//            let _ = print("first range is \(animationRange)")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
//                updateText()
//            }
//        }

    }
    
    func updateText() {
        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1, blendDuration: 1)) {
            scores.append(newScore)
//            let _ = print("update range is \(scores)")
        }
        
//        let stringValue = String(newScore)
//        print(stringValue)
        
//        for (index, newScore) in zip(0..<stringValue.count, stringValue) {
//            let _ = print("for in index: \(index), newScore is \(newScore)")
//            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1, blendDuration: 1)) {
//                animationRange[index] = (String(newScore) as NSString).integerValue
//                let _ = print("update range is \(animationRange)")
//            }
//        }
    }

}

#Preview {
    RollingTextSampleView()
}
