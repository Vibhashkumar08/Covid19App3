//
//  RecentlyViewedViewController.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import UIKit

class RecentlyViewedViewController: UIViewController {

    @IBOutlet weak var recentlyVisitedCountryList : UITableView!
    @IBOutlet weak var recentlyVisitedListsearchBar : UISearchBar!
    
    
    var recentlyVisitedCountryViewModal = RecentlyViewedViewModal()
    
    var dataSource : [GetCountrydata]? = nil
    var filteredData: [GetCountrydata] = []
    var searchActive : Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recently Viewed"
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getCDresponse()
    }
    
    func getCDresponse(){
        recentlyVisitedCountryViewModal.getCountryList { (countryList) in
            self.dataSource = countryList
            self.recentlyVisitedCountryList.reloadData()
        }
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
