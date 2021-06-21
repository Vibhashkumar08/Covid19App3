//
//  countryListCell.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation
import UIKit

class CountryListCell : UITableViewCell{
    
    @IBOutlet weak var countryNameLbl : UILabel!
    @IBOutlet weak var SlugNameLbl : UILabel!
    @IBOutlet weak var ISO2nameLbl : UILabel!
    
    static let cellIdentifier = "countryCellId"
    
    
}
