//
//  BounceAnimationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/08/31.
//

import SwiftUI

struct BounceAnimationView: View {
    @State var offsetYBounce: CGFloat
    @State var opacity: CGFloat = 1
    private let defaultYBounce: CGFloat

    // onChangeでtextとupdatedを渡したい。Equatableである必要があるのでTupleは不可
    // Stateだと反応しない？さっき反応してたような気がするけど🧐
    // Bindingでinitializerに渡す必要
    // だたそうするとscoreに初期値を渡せない🧐
    @Binding var hoge: Hoge
    
    @State var score: String

    init(hoge: Binding<Hoge>, height: CGFloat, defatultValue: String? = nil) {
        _hoge = hoge
        if let value = defatultValue {
            score = value
        } else {
            score = ""
        }
        offsetYBounce = height
        defaultYBounce = height
    }
    
    var body: some View {
        Text(score)
            .font(.largeTitle)
            .fontWeight(.regular)
            .offset(x: 0, y: offsetYBounce)
            .opacity(opacity)
            .animation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1), value: offsetYBounce)
            .onAppear{
                updateText(hoge: nil)
            }
            .onChange(of: hoge) { hoge in
                updateText(hoge: hoge)
            }
    }

    private func updateText(hoge: Hoge? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            opacity = 0
            offsetYBounce = -defaultYBounce
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetYBounce = defaultYBounce*2
            if let hoge = hoge, hoge.updated {
                score = hoge.score
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            opacity = 1
            offsetYBounce = 0
        }
    }
}

struct Hoge: Equatable {
    let score: String
    let updated: Bool
}

struct BounceAnimationView_Previews: PreviewProvider {
    @State static var hoge: Hoge = Hoge(score: "44.4M", updated: false)
    
    static var previews: some View {
        VStack {
            BounceAnimationView(hoge: $hoge, height: 24, defatultValue: hoge.score)
            Button("add item") {
                hoge = Hoge(score: String(Int.random(in: 100...200)), updated: true)
            }
        }
    }
}
