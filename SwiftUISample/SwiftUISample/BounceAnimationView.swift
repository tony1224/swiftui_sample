//
//  BounceAnimationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/08/31.
//

import SwiftUI

struct BounceAnimationView: View {
    let characters: Array<String.Element>
    
    @State var offsetYForBounce: CGFloat
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double, textHeight: CGFloat) {
        self.characters = Array(text)
        self.baseTime = startTime
        self.offsetYForBounce = textHeight
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.custom("HiraMinProN-W3", fixedSize: 24))
                    .offset(x: 0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.05).delay( Double(num) * 0.05 ), value: offsetYForBounce)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
        }
    }
}
