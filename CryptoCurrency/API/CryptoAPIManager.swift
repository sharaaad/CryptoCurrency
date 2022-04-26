//
//  CryptoAPIManager.swift
//  CryptoCurrency
//
//  Created by admin on 26/04/2022.
//

import Foundation

class CryptoAPI {
    let API_KEY = "B8F38214-4103-4D44-98DA-3891504727E2"
    
    func getCryptoData(currency: String, previewMode: Bool, _ completion: @escaping ([Rate]) -> ()) {
        if previewMode {
            completion(Rate.sampleRates)
            return
        }
        
        let urlString = "https://rest.coinapi.io/v1/exchangerate/\(currency)?invert=false&apikey=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            print("CryptoApi: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
