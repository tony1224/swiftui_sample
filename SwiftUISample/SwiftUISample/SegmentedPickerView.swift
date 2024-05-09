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
        Book(title: "Atomic Habits", author: "James Clear"),
        Book(title: "Start With Why", author: "Simon Sinek"),
        Book(title: "Think Like A Monk", author: "Jay Shetty"),
        Book(title: "Limitless", author: "Jim Kwik")
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
