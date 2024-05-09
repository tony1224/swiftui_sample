//
//  SegmentedPicker.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2024/05/08.
//

import SwiftUI

struct SegmentedPicker<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    
    @Binding var selection: SelectionValue?
    @Binding var items: [SelectionValue]
    @Namespace private var pickerTransition
    private var selectionColor: Color = .blue
    private var content: (SelectionValue) -> Content
    
    init(selection: Binding<SelectionValue?>,
         items: Binding<[SelectionValue]>,
         selectionColor: Color = .blue,
         @ViewBuilder content: @escaping (SelectionValue) -> Content) {
        _selection = selection
        _items = items
        self.selectionColor = selectionColor
        self.content = content
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 6) {
                    ForEach(items, id: \.self) { item in
                        let selected = selection == item
                        
                        ZStack {
                            if selected {
                                Capsule()
                                    .foregroundStyle(selectionColor)
                                    .matchedGeometryEffect(id: "picker", in: pickerTransition)
                                
                                content(item).id(item)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .lineLimit(1)
                                    .clipShape(Capsule())
                                
                            } else {
                                Capsule()
                                    .foregroundStyle(.clear)
                                
                                content(item).id(item)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .lineLimit(1)
                                    .clipShape(Capsule())
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selection = item
                            }
                        }
                        .onSegmentedChange(selection: selection, proxy: proxy)
//                        .onChange(of: selection) { _ in // TODO: iOS17以降ではdeprecatedなので注意
//                            withAnimation(.easeInOut(duration: 0.2)) {
//                                proxy.scrollTo(selection)
//                            }
//                        }
                    }
                    .onAppear {
                        if selection == nil, let first = items.first {
                            selection = first
                        }
                    }
                    
                }
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    
    
}

extension View {
    @ViewBuilder
    func onSegmentedChange<SelectionValue>(selection: SelectionValue?, proxy: ScrollViewProxy) -> some View where SelectionValue: Hashable {
        if #available(iOS 17, *) {
            onChange(of: selection) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    proxy.scrollTo(selection)
                }
            }
        } else {
            onChange(of: selection) { _ in
                withAnimation(.easeInOut(duration: 0.2)) {
                    proxy.scrollTo(selection)
                }
            }
        }
        
    }
}
//
//#Preview {
//    SegmentedPicker()
//}
