//
//  ContentView.swift
//  CarCustomCalculator
//
//  Created by Nikita Arshinov on 17.04.24.
//

import SwiftUI

struct CalculatorView: View {
    @State private var selectedPerson: PersonType = .individual
    @State private var selectedAge: AgeType = .fromThreeToFive
    @State private var price: String = ""
    @State private var selectedEngine: EngineType = .petrol
    @State private var capacity: String = ""
    @State private var benifit: Bool = false
    @State private var isHidden = true

    var body: some View {
        NavigationView {
            Form {
                Section("Кто растамаживает") {
                    Picker("", selection: $selectedPerson) {
                        ForEach(PersonType.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Picker("Возраст автомобиля", selection: $selectedAge) {
                        ForEach(AgeType.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                }

                Section("Стоимость, EUR") {
                    TextField("в евро", text: $price)
                        .keyboardType(.numberPad)
                        
                }

                Section {
                    Picker("Тип двигателя", selection: $selectedEngine) {
                        ForEach(EngineType.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                }
                
                Section("Объём двигателя, см³") {
                    TextField("напр. 2000", text: $capacity)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Toggle("Таможенная льгота 50% (Указ №140)", isOn: $benifit)
                }
                
                Section {
                    Button("Рассчитать стоимость") {
                        isHidden = false
                    }
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .listRowBackground(Color.green)
                
                Section("Таможенная пошлина") {
                    Text("6 000 EUR")
                }.isHidden(isHidden)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Далее") {
                        hideKeyboard()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: FAQView()) {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
        }

    }
}

private extension CalculatorView {

}

#Preview {
    CalculatorView()
}
