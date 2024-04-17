//
//  EngineType.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import Foundation

enum EngineType: CaseIterable {
    case petrol
    case petrolHybrid
    case diesel
    case dieselHybrid
    case electro
    
    var title: String {
        switch self {
        case .petrol:
            "Бензин"
            
        case .petrolHybrid:
            "Бензин (гибрид)"
            
        case .diesel:
            "Дизель"
            
        case .dieselHybrid:
            "Дизель (гибрид)"
            
        case .electro:
            "Электро"
        }
    }
}
