//
//  ShimmerViewModifier.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/23/24.
//

import SwiftUI

struct ShimmerViewModifier: ViewModifier {
    private let animation = Animation.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false)
    private let shimerGradient = Gradient(
        colors: [
            .black.opacity(0.3),
            .black,
            .black.opacity(0.3)
        ]
    )
    
    private var startPoint: UnitPoint {
        isInitialState ? UnitPoint(x: -0.3, y: -0.3) : UnitPoint(x: 1, y: 1)
    }

    private var endPoint: UnitPoint {
        isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: 1.3, y: 1.3)
    }

    @State private var isInitialState = true

    @ViewBuilder
    func body(content: Content) -> some View {
        let gradient = LinearGradient(gradient: shimerGradient, startPoint: startPoint, endPoint: endPoint)

        content
            .overlay(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
            .mask(gradient)
            .animation(animation, value: isInitialState)
            .onAppear {
                // Delay the animation until the initial layout is established
                // to prevent animating the appearance of the view
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isInitialState = false
                }
            }

    }
}
