//
//  SelectCountryVC+Extension.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation
import UIKit

extension SelectCountryVC : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive == true{
            return (self.filteredData ).count
        }else{
            return (self.dataSource ?? []).count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListCell.cellIdentifier) as! CountryListCell
        cell.selectionStyle = .none
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
        
        manager.create(countryData: modal!)
       
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
   
    
  //MARK: Searchbar Delegate
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredData = self.dataSource!.filter({ (modal) -> Bool in
            let tmp:NSString = modal.Country as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if (self.filteredData.count == 0){
            searchActive = false
        }
        else{
            searchActive = true
        }
        
        countryList.reloadData()
    }
   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchActive = true
       
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchActive = false
       
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
       
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
        
    }
}
