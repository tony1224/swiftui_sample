//
//  ShareNotificationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/04/11.
//

import SwiftUI

struct ShareNotificationView: View {
    @State var entity: RollingTextEntity = RollingTextEntity(score: "44.4M", updated: false)
    @State private var opacity: CGFloat = .zero

    var body: some View {
        VStack(spacing: 16) {
//            RollingText(currentText: "0", nextText: "100", textHeight: 24, minWidth: 30, textColor: .blue, onAppeared: {
//                let _ = print("hoge")
//            })
//            .frame(height: 24)
           
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
        .padding()
    }
}

struct ShareNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ShareNotificationView()
    }
}
