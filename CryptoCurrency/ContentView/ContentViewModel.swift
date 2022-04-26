//
//  ContentViewModel.swift
//  CryptoCurrency
//
//  Created by admin on 26/04/2022.
//

import Foundation
import SwiftUI


extension ContentView {
    class ViewModel: ObservableObject {
        @Published var rates = [Rate]()
        @Published var searchText = ""
        @Published var amount: Double = 100
        var filteredRates: [Rate] {
            return searchText == "" ? rates : rates.filter {$0.asset_id_quote.contains(searchText.uppercased())}
        }
        
        func calculateRate(rate: Rate) -> Double {
            return amount * rate.rate
        }
        
        func refereshData() {
            CryptoAPI().getCryptoData(currency: "EUR", previewMode: false, { newRates in DispatchQueue.main.async {
                withAnimation {
                    self.rates = newRates
                }
                print("Successfully got new rates: \(self.rates.count)")
                
            }
            })
                                      
        }
        
       
    }
}
