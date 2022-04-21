//
//  DetailCardViewModel.swift
//  Countries
//
//  Created by Sedat Dalkıran on 20.04.2022.
//

import Foundation

//MARK: Get info From View Controller

protocol DetailCardViewModelProtocol {
    
    var delegate: DetailCardViewModelDelegate? { get set }
    
    func getCountryDetail()

}

protocol DetailCardViewModelDelegate {
    func updateCountryDetail(countryDetail: [CountryDetailDataModel]?)
}

final class DetailCardViewModel: DetailCardViewModelProtocol {
    var delegate: DetailCardViewModelDelegate?
    var service: NetworkProtocol = Network()
    private var code: String
    init(code: String) {
        self.code = code
    }
    func getCountryDetail() {
        service.getCountryDetail(code: self.code) { response, error in
            if let response = response {
                //self.delegate?.updateCountryDetail(countryDetail: response.data)
            }
            
            }
    }
}
