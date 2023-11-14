//
//  PartlyCornerView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/11/15.
//

import SwiftUI

struct PartlyCornerView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 200, height: 100)
            .background(Color.red)
            .clipRadius(6, corners: [.topLeft, .topRight])
    }
}

#Preview {
    PartlyCornerView()
}
