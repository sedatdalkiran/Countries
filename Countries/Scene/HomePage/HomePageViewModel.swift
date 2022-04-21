//
//  CountryViewModel.swift
//  Countries
//
//  Created by Sedat Dalkıran on 19.04.2022.
//

import Foundation

//MARK: Get info From View Controller

protocol CountryViewModelProtocol {
    
    var delegate: CountryViewModelDelegate? { get set }
    
    func getCountryList()
    
    
}

//MARK: Send info to ViewController

protocol CountryViewModelDelegate {
    func updateCountry(countries: [CountryData]?)
}

final class CountryViewModel: CountryViewModelProtocol {
    var delegate: CountryViewModelDelegate?
    var service: NetworkProtocol = Network()
    
    func getCountryList() {
        service.getCountryList { response, error in
            if let response = response {
                self.delegate?.updateCountry(countries: response.data)
            }
            
        }
    }
    
    
}
