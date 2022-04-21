//
//  CountryModel.swift
//  Countries
//
//  Created by Sedat Dalkıran on 19.04.2022.
//

import Foundation

struct Country: Decodable {
    let data: [CountryData]?
}

struct CountryData: Decodable {
    let name: String?
    let code: String
}

