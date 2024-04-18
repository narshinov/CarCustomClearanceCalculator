//
//  CalculatorService.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 18.04.24.
//

import Foundation

struct InputDataModel {
    var selectedPerson: PersonType
    var selectedAge: AgeType
    var price: String
    var selectedEngine: EngineType
    var capacity: String
    var isBenifit: Bool
    
    var priceValue: Float {
        Float(price) ?? .zero
    }
    
    var capacityValue: Float {
        Float(capacity) ?? .zero
    }
}

protocol CalculatorServiceProtocol {
    func calculate(model: InputDataModel) -> String
}

final class CalculatorService: CalculatorServiceProtocol {
    func calculate(model: InputDataModel) -> String {
        guard model.selectedEngine != .electro else { return "0" }
        switch model.selectedPerson {
        case .individual:
            return "\(Int(calculateForIndividual(model: model)))"
            
        case .entity:
            return "\(Int(calculateForEntity(model: model)))"
        }
    }
    
    // MARK: - For Individual
    
    private func calculateForIndividual(model: InputDataModel) -> Float {
        switch model.selectedAge {
        case .toThree:
            return getDutyRateToThreeIndividual(price: model.priceValue, capacity: model.capacityValue, isBenifit: model.isBenifit)
            
        case .fromThreeToFive:
            return getDutyRateFromThreeToFiveIndividual(capacity: model.capacityValue, isBenifit: model.isBenifit)
            
        case .moreFive:
            return getDutyRateMoreFiveIndividual(capacity: model.capacityValue, isBenifit: model.isBenifit)
        }
    }
    
    private func getDutyRateFromThreeToFiveIndividual(capacity: Float, isBenifit: Bool) -> Float {
        let benifitFactor: Float = isBenifit ? 2.0 : 1.0
        let result = capacity/benifitFactor
        
        switch capacity {
        case 0...1000:
            return result * 1.5
            
        case 1001...1500:
            return result * 1.7
            
        case 1501...1800:
            return result * 2.5
            
        case 1801...2300:
            return result * 2.7
            
        case 2301...3000:
            return result * 3
            
        default:
            return result * 3.6
        }
    }
    
    private func getDutyRateToThreeIndividual(price: Float, capacity: Float, isBenifit: Bool) -> Float {
        let benifitFactor: Float = isBenifit ? 2.0 : 1.0
        let result = capacity/benifitFactor
        let priceToCapacityFactor: Float = price/capacity
        
        switch price {
        case 0...8500:
            let rate = price * 0.54
            guard rate > 2.5 else { return 2.5 * result}
            return rate * result
            
        case 8501...16700:
            let rate = priceToCapacityFactor * 0.48
            guard rate > 3.5 else { return 3.5 * result }
            return rate * result
            
        case 16701...42300:
            let rate = priceToCapacityFactor * 0.48
            guard rate > 5.5 else { return 5.5 * result }
            return rate * result
            
        case 42301...84500:
            let rate = priceToCapacityFactor * 0.48
            guard rate > 7.5 else { return 7.5 * result }
            return rate * result
            
        case 84501...169000:
            let rate = priceToCapacityFactor * 0.48
            guard rate > 15 else { return 15 * result }
            return rate * result
            
        default:
            let rate = priceToCapacityFactor * 0.48
            guard rate > 20 else { return 20 * result }
            return rate * result
        }
    }
    
    private func getDutyRateMoreFiveIndividual(capacity: Float, isBenifit: Bool) -> Float {
        let benifitFactor: Float = isBenifit ? 2.0 : 1.0
        let result = capacity/benifitFactor
        
        switch capacity {
        case 0...1000:
            return result * 3
            
        case 1001...1500:
            return result * 3.2
            
        case 1501...1800:
            return result * 3.5
            
        case 1801...2300:
            return result * 4.8
            
        case 2301...3000:
            return result * 5
            
        default:
            return result * 5.7
        }
    }
    
    // MARK: - For Entity
    
    private func calculateForEntity(model: InputDataModel) -> Float {
        switch model.selectedEngine {
        case .diesel, .dieselHybrid:
            return getDutyRateForDiselEntity(model: model)
            
        case .petrol, .petrolHybrid:
            return getDutyRateForPetrolEntity(model: model)
            
        case .electro:
            return .zero
        }
    }
    
    // MARK: - For Disel
    
    private func getDutyRateForDiselEntity(model: InputDataModel) -> Float {
        switch model.selectedAge {
        case .toThree:
            getDutyRateToThreeDiselEntity(model: model)
        case .fromThreeToFive:
            getDutyRateFromThreeToFiveDiselEntity(model: model)
        case .moreFive:
            getDutyRateMoreFiveDiselEntity(model: model)
        }
    }
    
    private func getDutyRateToThreeDiselEntity(model: InputDataModel) -> Float {
        let result = model.capacityValue
        let priceToCapacityFactor: Float = model.priceValue/model.capacityValue
        
        let rate = priceToCapacityFactor * 0.3
        
        switch model.capacityValue {
        case 0...1500:
            guard rate > 1.45 else { return 1.45 * result}
            return rate * result
            
        case 1501...2500:
            guard rate > 1.9 else { return 1.9 * result}
            return rate * result
            
        default:
            guard rate > 2.8 else { return 2.8 * result}
            return rate * result
        }
    }
    
    private func getDutyRateFromThreeToFiveDiselEntity(model: InputDataModel) -> Float {
        let result = model.capacityValue
        let priceToCapacityFactor: Float = model.priceValue/model.capacityValue
        
        let rate = priceToCapacityFactor * 0.35
        
        
        switch model.capacityValue {
        case 0...1500:
            guard rate > 1.45 else { return 1.45 * result}
            return rate * result
            
        case 1501...2500:
            guard rate > 2.15 else { return 2.15 * result}
            return rate * result
            
        default:
            guard rate > 2.8 else { return 2.8 * result}
            return rate * result
        }
    }
    
    private func getDutyRateMoreFiveDiselEntity(model: InputDataModel) -> Float {
        switch model.capacityValue {
        case 0...1500:
            return model.capacityValue * 2.7
            
        case 1501...2500:
            return model.capacityValue * 4.0
            
        default:
            return model.capacityValue * 5.8
        }
    }
    
    //MARK: - For Petrol
    
    private func getDutyRateForPetrolEntity(model: InputDataModel) -> Float {
        switch model.selectedAge {
        case .toThree:
            getDutyRateToThreePetrolEntity(model: model)
            
        case .fromThreeToFive:
            getDutyRateFromThreeToFivePetrolEntity(model: model)
            
        case .moreFive:
            getDutyRateMoreFivePetrolEntity(model: model)
        }
    }
    
    private func getDutyRateToThreePetrolEntity(model: InputDataModel) -> Float {
        let result = model.capacityValue
        let priceToCapacityFactor: Float = model.priceValue/model.capacityValue
        
        let rate = priceToCapacityFactor * 0.23
        
        switch model.capacityValue {
        case 0...1000:
            guard rate > 1.2 else { return 1.2 * result}
            return rate * result
            
        case 1001...1500:
            guard rate > 1.45 else { return 1.45 * result}
            return rate * result
            
        case 1501...1800:
            guard rate > 1.5 else { return 1.5 * result}
            return rate * result
            
        case 1801...2300:
            guard rate > 2.15 else { return 2.15 * result}
            return rate * result
            
        case 2301...3000:
            guard rate > 2.15 else { return 2.15 * result}
            return rate * result
            
        default:
            guard rate > 2.8 else { return 2.8 * result}
            return rate * result
        }
    }
    
    private func getDutyRateFromThreeToFivePetrolEntity(model: InputDataModel) -> Float {
        let result = model.capacityValue
        let priceToCapacityFactor: Float = model.priceValue/model.capacityValue
        
        let rate = priceToCapacityFactor * 0.35
        
        switch model.capacityValue {
        case 0...1000:
            guard rate > 1.2 else { return 1.2 * result}
            return rate * result
            
        case 1001...1500:
            guard rate > 1.45 else { return 1.45 * result}
            return rate * result
            
        case 1501...1800:
            guard rate > 1.5 else { return 1.5 * result}
            return rate * result
            
        case 1801...2300:
            guard rate > 2.15 else { return 2.15 * result}
            return rate * result
            
        case 2301...3000:
            guard rate > 2.15 else { return 2.15 * result}
            return rate * result
            
        default:
            guard rate > 2.8 else { return 2.8 * result}
            return rate * result
        }
    }
    
    private func getDutyRateMoreFivePetrolEntity(model: InputDataModel) -> Float {
        switch model.capacityValue {
        case 0...1000:
            model.capacityValue * 2.5
            
        case 1001...1500:
            model.capacityValue * 2.7
            
        case 1501...1800:
            model.capacityValue * 2.9
            
        case 1801...2300:
            model.capacityValue * 4.0
            
        case 2301...3000:
            model.capacityValue * 4.0
            
        default:
            model.capacityValue * 5.8
        }
    }
    
}
