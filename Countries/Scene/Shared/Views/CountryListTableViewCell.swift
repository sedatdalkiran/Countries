//
//  CountryListTableViewCell.swift
//  Countries
//
//  Created by Sedat Dalkıran on 20.04.2022.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    @IBOutlet weak var CountryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
