//
//  ContentViewModel.swift
//  CryptoCurrency
//
//  Created by admin on 26/04/2022.
//

import Foundation
import SwiftUI

//U
//extension ContentView {
    class ContentViewModel: ObservableObject {
        @Published var rates = [Rate]()
        @Published var searchText = ""
        @Published var amount: Double = 100
        //U
        var networkManager: CryptoAPIType = CryptoAPI()

        var filteredRates: [Rate] {
            return searchText == "" ? rates : rates.filter {$0.asset_id_quote.contains(searchText.uppercased())}
        }
        
        func calculateRate(rate: Rate) -> Double {
            return amount * rate.rate
        }
        
        func refereshData() {
            //U
            networkManager.getCryptoData(currency: "EUR", previewMode: false, { newRates in DispatchQueue.main.async {
                withAnimation {
                    self.rates = newRates
                    print("test completed")
                }
                print("Successfully got new rates: \(self.rates.count)")
                
            }
            })
                                      
        }
        
       
    }
//}//U
