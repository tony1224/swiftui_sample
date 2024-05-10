//
//  SegmentedPickerView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2024/05/09.
//

import SwiftUI

struct Book: Hashable, Identifiable {
    var id: UUID { UUID() }
    var title: String
    var author: String
}

struct SegmentedPickerView: View {
    
    @State var books: [Book] = [
        Book(title: "マンスリー", author: "James Clear"),
        Book(title: "トップスター", author: "Simon Sinek"),
        Book(title: "6月", author: "Jay Shetty"),
        Book(title: "7月", author: "Jim Kwik"),
        Book(title: "8月", author: "Jim Kwik")
    ]
    @State var selectionBook: Book?
    
    var body: some View {
        VStack {
            SegmentedPicker(selection: $selectionBook, items: $books, selectionColor: .cyan) { book in
                Text(book.title)
                // NOTE: ここで画像を差し込むことも可
            }
            if let selectionBook {
                HStack {
                    Text("\(selectionBook.title) by ")
                    +
                    Text("\(selectionBook.author)").bold()
                }.padding()
            }
        }
    }
}

#Preview {
    SegmentedPickerView()
}
