//
//  FAQView.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("FAQ")
                Spacer()
                    Link(
                        "Политика конфиденциальности",
                        destination: .applicationDirectory
                    )
                    
                    Link(
                        "Условия использования",
                        destination: .applicationDirectory
                    )
                
            }
        }
    }
}

#Preview {
    FAQView()
}
