//
//  PartlyRoundedCornerView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/11/15.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask) -> some View {
        self.modifier(PartlyRoundedCornerModifier(cornerRadius: radius, maskedCorners: maskedCorners))
    }
}

struct PartlyRoundedCornerModifier: ViewModifier {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask

    func body(content: Content) -> some View {
        content.mask(PartlyRoundedCornerView(cornerRadius: cornerRadius, maskedCorners: maskedCorners))
    }
}

struct PartlyRoundedCornerView: UIViewRepresentable {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask

    func makeUIView(context: UIViewRepresentableContext<PartlyRoundedCornerView>) -> UIView {
        let uiView = UIView()
        uiView.layer.cornerRadius = cornerRadius
        uiView.layer.maskedCorners = maskedCorners
        uiView.backgroundColor = .white
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PartlyRoundedCornerView>) {}
}
