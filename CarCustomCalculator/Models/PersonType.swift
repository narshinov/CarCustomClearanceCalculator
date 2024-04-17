//
//  PersonType.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import Foundation

enum PersonType: CaseIterable {
    case individual
    case entity
    
    var title: String {
        switch self {
        case .individual:
            "Физ. лицо"

        case .entity:
            "Юр. лицо"
        }
    }
}
