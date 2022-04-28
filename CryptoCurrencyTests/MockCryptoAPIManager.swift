//
//  MockCryptoAPIManager.swift
//  CryptoCurrencyTests
//
//  Created by Admin on 27/04/2022.
//

import XCTest

@testable import CryptoCurrency

class MockCryptoAPIManager: CryptoAPIType {
 
    let API_KEY = "B8F38214-4103-4D44-98DA-3891504727E2"
    func getCryptoData(currency: String, previewMode: Bool, _ completion: @escaping ([Rate]) -> ()) {
        
        if previewMode {
            completion(Rate.sampleRates)
            return
        }
        
        let bundle = Bundle(for: MockCryptoAPIManager.self)
        
        guard let urlString =  bundle.url(forResource: "SuccessResponce", withExtension:".json")
  
        else  {
            return
        }

        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            guard let data = data else {
                print("CryotiAPI: Could not retrieve data")
                return
            }
            
            do {
                let ratesData = try JSONDecoder().decode(Crypto.self, from: data)
                
                completion(ratesData.rates)
                

            } catch {
                print("CryotiAPI: \(error)")
                completion(Rate.sampleRates)
            }
        }
        .resume()
    }
    }
    
    

