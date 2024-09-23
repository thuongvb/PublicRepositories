//
//  View+.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/23/24.
//

import SwiftUI

extension View {
    @ViewBuilder func shimmering(
        active: Binding<Bool> = .constant(true)
    ) -> some View {
        if active.wrappedValue {
            modifier(ShimmerViewModifier())
        } else {
            self
        }
    }
}
