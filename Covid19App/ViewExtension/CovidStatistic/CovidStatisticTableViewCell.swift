//
//  CovidStatisticTableViewCell.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import UIKit

class CovidStatisticTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLbl : UILabel!
    @IBOutlet weak var CountryCodeLbl : UILabel!
    @IBOutlet weak var casesLbl : UILabel!
    @IBOutlet weak var StatusLbl : UILabel!
    @IBOutlet weak var deathStatusLbl : UILabel!
    @IBOutlet weak var activeStatusLbl : UILabel!
    @IBOutlet weak var recoveredStatusLbl : UILabel!
    @IBOutlet weak var DateLbl : UILabel!
    
    static let identifier = "CovidStatisticTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
        // Configure the view for the selected state
    }

}
