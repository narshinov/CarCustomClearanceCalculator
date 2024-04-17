//
//  View+Extension.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }

    func isHidden(_ isHidden: Bool) -> some View {
        ModifiedContent(
            content: self,
            modifier: HideViewModifier(isHidden: isHidden)
        )
    }
}
