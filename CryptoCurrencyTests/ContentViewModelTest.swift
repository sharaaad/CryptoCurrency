//
//  ContentViewModelTest.swift
//  CryptoCurrencyTests
//
//  Created by Admin on 27/04/2022.
//

import XCTest
@testable import CryptoCurrency
class ContentViewModelTest: XCTestCase {
    var mockCryptoAPIManager: MockCryptoAPIManager!
    var viewModel: ContentViewModel!
    
    override func setUpWithError() throws {
        mockCryptoAPIManager = MockCryptoAPIManager()
        viewModel = ContentViewModel()
        viewModel.networkManager = mockCryptoAPIManager
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testrefereshData()  {
     viewModel.refereshData()
      //Implement assert function to check values

    }



}
