//
//  PracticeSmallUIComponent.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/12/22.
//

import SwiftUI

struct PracticeSmallUIComponent: View {
    @State private var text = ""
    @State private var mockIson = true
    
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

            // これだと真ん中にスペースができてトグルと文字を寄せれない
//            Toggle(isOn: $mockIson) {
//                Text("Hogehoge")
//            }

            HStack {
                Text("Hogehoge")
                Toggle(isOn: $mockIson) { }
                    .labelsHidden()
            }
        }
        .padding()
    }
}

#Preview {
    PracticeSmallUIComponent()
}
