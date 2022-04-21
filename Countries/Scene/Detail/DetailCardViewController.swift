//
//  DetailCardViewController.swift
//  Countries
//
//  Created by Sedat Dalkıran on 19.04.2022.
//

import UIKit

class DetailCardViewController: UIViewController {
    
    private var countryDetails = [CountryDetailDataModel]()
    
    @IBOutlet weak var countryFlag: UIStackView!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var furtherInformation: UIButton!
    
    var viewModel: DetailCardViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getCountryDetail()
        
    }
    @IBAction func furtherInformation(_ sender: Any) {
        //let urlString = "https://www.wikidata.org/wiki/\(wikiDataId)"
        //if let url = URL(string: urlString) {
          //  UIApplication.shared.open(url, completionHandler: nil)
        }
        
    }
//}
    extension DetailCardViewController: DetailCardViewModelDelegate {
        func updateCountryDetail(countryDetail: [CountryDetailDataModel]?) {
            print(countryDetail)
        }
    }
    
/* some : CountryDetailDataModel
 - name : "Vatican City"
 - code : "VA"
 - flagImageURI : "http://commons.wikimedia.org/wiki/Special:FilePath/Flag%20of%20the%20Vatican%20City.svg"
 - wikiDataID : "Q237"*/
