//
//  CountryDetail.swift
//  Countries
//
//  Created by Sedat Dalkıran on 20.04.2022.
//

import Foundation

struct CountryDetailModel: Decodable {
  let data: CountryDetailDataModel?
  
}
struct CountryDetailDataModel: Decodable {
  let name: String
  let code: String
  let flagImageURI: String
  let wikiDataID: String
  
 /* enum CodingKeys: String, CodingKey {
    case wikiDataID = "wikiDataId"
    case flagImageURI = "flagImageUri"
    case name, code
  }*/
}
