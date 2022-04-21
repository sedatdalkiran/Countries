//
//  Network.swift
//  Countries
//
//  Created by Sedat Dalkıran on 19.04.2022.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func getCountryList(completion: @escaping (Country?, Error?) -> Void)
    func getCountryDetail(code: String, completion: @escaping (CountryDetailModel?, Error?) -> Void)
}

class Network: NetworkProtocol {
    func getCountryDetail(code: String, completion: @escaping (CountryDetailModel?, Error?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(self.baseURL)countries/\(code)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = self.getHeaders()
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
            do {
                if let data = data {
                    let countryDetail = try JSONDecoder().decode(CountryDetailModel.self, from: data)
                    completion(countryDetail, nil)
                } else {
                    print("No data")
                }
            }
            catch(let error) {
                completion(nil, error)
            }
        }).resume()
    }
    
    
    private let baseURL: String = "https://wft-geo-db.p.rapidapi.com/v1/geo/"
    
    public init() {}
    
    func getCountryList(completion: @escaping (Country?, Error?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(self.baseURL)countries?limit=10")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = self.getHeaders()
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
            do {
                if let data = data {
                    let country = try JSONDecoder().decode(Country.self, from: data)
                    completion(country, nil)
                } else {
                    print("No data")
                }
            }
            catch(let error) {
                completion(nil, error)
            }
        }).resume()
    }
    
    private func getHeaders() -> [String: String] {
        return [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "20c3e5eea7msh37f0d8fabce0e0bp184712jsn95b641fd3834"
        ]
    }
    

    
}

