//
//  PracticeTextView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/12/22.
//

import SwiftUI

struct PracticeTextView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color.accentColor)
            Text("Hello World!")
            TextField("ここにテキストを入力", text: $text)
                .padding(.leading, 5)
                .frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(lineWidth: 1)
                )

            HStack(spacing: .zero) {
                Spacer()
                Text("\(text.count)")
                Text("文字")
            }
        }
        .padding()
    }
}

#Preview {
    PracticeTextView()
}
