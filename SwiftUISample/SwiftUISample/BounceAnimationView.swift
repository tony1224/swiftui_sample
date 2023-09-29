//
//  BounceAnimationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/08/31.
//

import SwiftUI

struct BounceAnimationView: View {
    @Binding var newScore: String
    @State var offsetYBounce: CGFloat
    @State var opacity: CGFloat = 1
    private let defaultYBounce: CGFloat

    init(text: Binding<String>, height: CGFloat) {
        _newScore = text
        offsetYBounce = height
        defaultYBounce = height
    }
    
    var body: some View {
        Text(newScore)
            .font(.largeTitle)
            .fontWeight(.regular)
            .offset(x: 0, y: offsetYBounce)
            .opacity(opacity)
            .animation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1), value: offsetYBounce)
            .onAppear{
                updateText()
            }
            .onChange(of: newScore) { score in
                updateText()
            }
    }

    private func updateText() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            offsetYBounce = -defaultYBounce
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            offsetYBounce = defaultYBounce*2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            opacity = 1
            offsetYBounce = 0
        }
    }
}


struct BounceAnimationView_Previews: PreviewProvider {
    @State static var score: String = "44.4M"
    
    static var previews: some View {
        VStack {
            BounceAnimationView(text: $score, height: 24)
            Button("add item") {
                score = String(Int.random(in: 100...200))
            }
        }
    }
}
