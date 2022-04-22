//
//  DetailCardViewController.swift
//  Countries
//
//  Created by Sedat Dalkıran on 19.04.2022.
//

import UIKit
import SDWebImage

class DetailCardViewController: UIViewController {
    
    private var countryDetails = [CountryDetailDataModel]()
    
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var furtherInformation: UIButton!
    
    var country: CountryDetailDataModel?
    
    var viewModel: DetailCardViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getCountryDetail()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        
    }
    @IBAction func furtherInformation(_ sender: Any) {
        if let url = URL(string: "https://www.wikidata.org/wiki/\(country?.wikiDataID)") {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
}
extension DetailCardViewController: DetailCardViewModelDelegate {
    func updateCountryDetail(countryDetail: CountryDetailDataModel?) {
        let transformer = SDImageResizingTransformer(size: CGSize(width: 414, height: 323), scaleMode: .fill)
        
        countryFlag.sd_setImage(with: URL(string: (country?.flagImageURI)!), placeholderImage: UIImage(named: "customImage"),context: [.imageTransformer: transformer])
        self.countryCode.text = country?.code
        print("***JSON***")
        print(country)
        print("***JSON***")

    }
    
    }
    
/* some : CountryDetailDataModel
 - name : "Vatican City"
 - code : "VA"
 - flagImageURI : "http://commons.wikimedia.org/wiki/Special:FilePath/Flag%20of%20the%20Vatican%20City.svg"
 - wikiDataID : "Q237"*/
