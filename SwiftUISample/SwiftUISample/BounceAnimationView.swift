//
//  BounceAnimationView.swift
//  SwiftUISample
//
//  Created by Jun Morita on 2023/08/31.
//

import SwiftUI

struct OldRollingText: View {
    @Binding var entity: RollingTextEntity
    @State var offsetY: CGFloat
    @State var opacity: CGFloat = 1
    @State var score: String
    private let textHeight: CGFloat

    init(entity: Binding<RollingTextEntity>, textHeight: CGFloat, initialScore: String? = nil) {
        _entity = entity
        if let score = initialScore {
            self.score = score
        } else {
            score = ""
        }
        offsetY = textHeight
        self.textHeight = textHeight
    }
    
    var body: some View {
        Text(score)
            .font(.largeTitle)
            .fontWeight(.regular)
            .offset(x: 0, y: offsetY)
            .opacity(opacity)
            .animation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1), value: offsetY)
            .onAppear{
                updateText()
            }
            .onChange(of: entity) { entity in
                updateText(entity: entity)
            }
    }

    private func updateText(entity: RollingTextEntity? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            opacity = 0
            offsetY = -textHeight
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetY = textHeight*2
            if let entity = entity, entity.updated {
                score = entity.score
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            opacity = 1
            offsetY = 0
        }
    }
}

struct RollingTextEntity: Equatable {
    let score: String
    let updated: Bool
}

struct BounceAnimationView_Previews: PreviewProvider {
    @State static var entity: RollingTextEntity = RollingTextEntity(score: "44.4M", updated: false)
    
    static var previews: some View {
        VStack {
            OldRollingText(entity: $entity, textHeight: 24, initialScore: entity.score)
            Button("add item") {
                entity = RollingTextEntity(score: String(Int.random(in: 100...200)), updated: true)
            }
        }
    }
}
