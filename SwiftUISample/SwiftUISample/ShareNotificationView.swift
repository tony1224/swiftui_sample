//
//  ShareNotificationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/04/11.
//

import SwiftUI

struct ShareNotificationView: View {
    @State var hoge: Hoge = Hoge(score: "44.4M", updated: false)

    var body: some View {
        VStack(spacing: 16) {
            BounceAnimationView(hoge: $hoge, height: 24, defatultValue: hoge.score)
                .frame(width: 100, height: 24)
            Button("add item") {
                hoge = Hoge(score: String(Int.random(in: 100...200)), updated: true)
            }
            HStack(spacing: 16) {
                Image(uiImage: UIImage(named: "mockImage")!)
                    .resizable()
                    .frame(width: 40, height: 70)
                    .cornerRadius(8)
                    .padding(.leading, 16)

                VStack(alignment: .leading, spacing: 4) {
                    Text("スクショを保存しました").lineLimit(2).font(.system(size: 14, weight: .bold))
                    Text("ユーザー1さんにスクショをシェアしよう！")
                        .font(.system(size: 12)).lineLimit(3)
                    Spacer()
                }
                .padding(.vertical, 16)
                
                Button(action: {
                   // TOOD: action
                }) {
                  Text("Hello!")
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 78, height: 24)
                        )
                        .padding(.trailing, 16)
                }
                .padding(.horizontal, 16)
            }
            // この並びがミソ！
            .frame(width: 414, height: 106)
            .background(Color.yellow)
            .cornerRadius(8)
            .padding()
        }
    }
}

struct ShareNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ShareNotificationView()
    }
}
