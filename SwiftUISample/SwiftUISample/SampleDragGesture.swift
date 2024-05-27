//
//  SampleDragGesture.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2024/05/15.
//

import SwiftUI

struct SampleDragGesture: View {
    @State private var location = CGPoint(x: 150, y: 150)
    @State private var diff: CGPoint?

    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                Text("location.x: \(location.x)")
                Text("location.y: \(location.y)")
            }
            .monospaced()
            
            Circle()
                .fill(.orange)
                .frame(width: 200)
                .position(location)
                .gesture(
                    DragGesture()
                        .onChanged { drag in
                            diff = diff ?? CGPoint(
                                x: location.x - drag.location.x,
                                y: location.y - drag.location.y
                            )
                            location.x = drag.location.x + diff!.x
                            location.y = drag.location.y + diff!.y
                        }
                        .onEnded { _ in
                            diff = nil
                        }
                )
        }
    }
}

#Preview {
    SampleDragGesture()
}
