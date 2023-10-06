//
//  MarqueeText.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/10/06.
//

import SwiftUI

struct MarqueeText: View {
    @State var storedSize: CGSize = .zero
    @State var offset: CGFloat = .zero
    @State var text: String
    // TextSizeを取得するために xx のため UIFontにする
    var font: UIFont
    var animationSpeed: Double = 0.02
    var delayTime: Double = 0.5
    // 両端のgradientは特に設定不要
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(text)
                .font(Font(font))
                .offset(x: offset)
        }
        .disabled(true) // 手でスクロールはできなくする
        .onAppear {
            let baseText = text

            // もらったテキストを少し感覚を空けて追加
            // 最初のtext表示が終わった時にoffsetをzeroに設定
            // TODO: ここが文字次第では調整必要
            (1...15).forEach { _ in
                text.append(" ")
            }
            // 次の文字前にアニメーションを止める
            storedSize = textSize()
            text.append(baseText)

            // 文字幅に基づいて合計秒数を計算すると
            // 各文字のアニメーション速度は0.02秒になるようにする
            let timing: Double = (animationSpeed * storedSize.width)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.linear(duration: timing)) {
                    offset = -storedSize.width
                }
            }
        }
        // タイマーを使ってアニメーションのタイミングごとにoffsetをzeroにリセット
        // delayはeveryに対し+何秒かで指定
        .onReceive(Timer.publish(every: ((animationSpeed * storedSize.width) + delayTime), on: .main, in: .default), perform: { _ in
            offset = 0
            withAnimation(.linear(duration: (animationSpeed * storedSize.width))) {
                offset = -storedSize.width
            }
        })
        
    }
    
    func textSize() -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (text as NSString).size(withAttributes: attributes)
    }
}

#Preview {
    ShareNotificationView()
}
