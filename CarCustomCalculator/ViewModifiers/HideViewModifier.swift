//
//  HideViewModifier.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import SwiftUI

struct HideViewModifier: ViewModifier {
    let isHidden: Bool
    @ViewBuilder
    func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}
