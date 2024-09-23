//
//  ZoomableButtonStyle.swift
//  PublicRepositories
//
//  Created by Bui Van Thuong on 23/9/24.
//

import SwiftUI

struct ZoomableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(
                x: configuration.isPressed ? 0.8: 1.0,
                y: configuration.isPressed ? 0.8: 1.0
            )
            .contentShape(.rect(cornerRadius: 8))
            .animation(.spring, value: configuration.isPressed)
    }
}
