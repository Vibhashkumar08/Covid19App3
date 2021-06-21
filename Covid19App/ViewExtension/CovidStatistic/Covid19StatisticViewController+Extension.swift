//
//  Covid19StatisticViewController+Extension.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation
import UIKit

extension Covid19StatisticViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSource ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CovidStatisticTableViewCell.identifier) as! CovidStatisticTableViewCell
        
        let modal = (self.dataSource?[indexPath.row])! as ConfirmedCovidCaseData
        cell.countryNameLbl.text = modal.Country
        cell.CountryCodeLbl.text = "\(modal.CountryCode)"
        cell.casesLbl.text = "Confirmed Cases : \(modal.Confirmed)"
        cell.activeStatusLbl.text = "Active Cases : \(modal.Active)"
        cell.deathStatusLbl.text = "Deaths : \(modal.Deaths)"
        cell.recoveredStatusLbl.text = "Recovered : \(modal.Recovered)"
        cell.DateLbl.text = self.convertDateFormat("\(modal.Date)")
      
        
        return cell
    }
    
    
    
    
    func convertDateFormat(_ inputDate: String) -> String? {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: inputDate) else {
            return nil
        }
        
        let convertDateFormatter = DateFormatter()
            convertDateFormatter.dateFormat = "MMM dd yyyy"

        return convertDateFormatter.string(from: date)
        
    }

    
}


