//
//  SelectCountryVC.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import UIKit

class SelectCountryVC: UIViewController {
    
    @IBOutlet weak var countryList : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    
    var manager = CountryVisitedDataModal()
   
    private var countryViewModal = SelectCountryViewModel()
    
    var dataSource : [GetCountrydata]?
    var filteredData: [GetCountrydata] = []
    var searchActive : Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Country List"
        countryList.delegate = self
        countryList.dataSource = self
        searchBar.delegate = self
        
        countryViewModal.getCountryList() { (countryList) in
            print(countryList ?? [])
            self.dataSource = countryList?.map({ (data) in
                return GetCountrydata(Country: data.Country, Slug: data.Slug, ISo2: data.ISO2, _partition: "Country")
            })
            self.countryList.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
