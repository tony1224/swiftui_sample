//
//  RollingText.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/10/06.
//

import SwiftUI

public struct RollingText: View {
    @State private var offsetY: CGFloat
    private let texts: [String]
    private let textHeight: CGFloat
    private let minWidth: CGFloat
    private let textColor: Color
    private let onAppeared: () -> Void

    public init(currentText: String, nextText: String, textHeight: CGFloat, minWidth: CGFloat, textColor: Color, onAppeared: @escaping () -> Void) {
        offsetY = textHeight / 2
        texts = [currentText, nextText]
        self.textHeight = textHeight
        self.minWidth = minWidth
        self.textColor = textColor
        self.onAppeared = onAppeared
    }

    public var body: some View {
        VStack(spacing: 8) {
            ForEach(texts, id: \.self) { text in
                Text(text)
                    .foregroundStyle(textColor)
                    .frame(minWidth: minWidth, alignment: .trailing)
                    .animation(.spring(response: 0.95, dampingFraction: 1, blendDuration: 0.95), value: offsetY)
            }
            .offset(y: offsetY)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                offsetY = -(textHeight / 2)
            }
            onAppeared()
        }
        .clipped()
    }
}

public struct RollingText_Previews: PreviewProvider {
    static public var previews: some View {
        RollingText(currentText: "990", nextText: "9,999", textHeight: 24, minWidth: 30, textColor: Color(.red), onAppeared: {}).background(Color(.black))
    }
}
