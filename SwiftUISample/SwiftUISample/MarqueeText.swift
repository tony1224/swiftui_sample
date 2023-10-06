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
            (1...15).forEach { _ in
                text.append(" ")
            }
            // 次の文字前にアニメーションを止める
            storedSize = textSize()
            text.append(baseText)

            // 文字幅に基づいて合計秒数を計算すると
            // 各文字のアニメーション速度は0.02秒になるようにする
            let timing: Double = (0.02 * storedSize.width)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.linear(duration: timing)) {
                    offset = -storedSize.width
                }
            }
        }
    } 
    
    func textSize() -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (text as NSString).size(withAttributes: attributes)
    }
}

#Preview {
    ShareNotificationView()
}
