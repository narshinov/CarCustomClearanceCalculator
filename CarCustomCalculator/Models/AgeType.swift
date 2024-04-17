//
//  AgeType.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import Foundation

enum AgeType: CaseIterable {
    case toThree
    case fromThreeToFive
    case moreFive
    
    var title: String {
        switch self {
        case .toThree:
            "До 3-х лет"
            
        case .fromThreeToFive:
            "От 3-х до 5 лет"
            
        case .moreFive:
            "Более 5 лет"
        }
    }
}
