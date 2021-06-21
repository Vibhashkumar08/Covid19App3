//
//  RecentViewVc+Extension.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import Foundation
import UIKit

extension RecentlyViewedViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive == true{
            return (self.filteredData).count
        }else{
            return (self.dataSource ?? []).count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.cellIdentifier) as! CountryListCell
        if searchActive == true{
            let modal = (self.filteredData[indexPath.row]) as GetCountrydata
            cell.countryNameLbl.text = modal.Country
            cell.SlugNameLbl.text = modal.Slug
            cell.ISO2nameLbl.text = modal.ISo2
        }else{
            let modal = (self.dataSource?[indexPath.row])! as GetCountrydata
            cell.countryNameLbl.text = modal.Country
            cell.SlugNameLbl.text = modal.Slug
            cell.ISO2nameLbl.text = modal.ISo2
        }
       
      
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var  modal : GetCountrydata?
        if searchActive == true{
             modal = (self.filteredData[indexPath.row]) as GetCountrydata
           
        }else{
            modal = (self.dataSource?[indexPath.row])!
        }
        
        guard  !((modal?.Country.isEmpty)!) else {
            let alert = UIAlertController(title: "Alert", message: "Data not found.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "Covid19StatisticViewController") as! Covid19StatisticViewController
        vc.countryName = modal?.Country
        self.navigationController?.pushViewController(vc, animated:     true)
        
       
    }
    
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {
                _ = (self.dataSource?[indexPath.row])!
              self.dataSource?.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .fade)
              if (self.recentlyVisitedCountryViewModal.deleteCountry(index: indexPath.row) == true)
              {
                self.getCDresponse()
              }
            }
        }
   
    
 
}
