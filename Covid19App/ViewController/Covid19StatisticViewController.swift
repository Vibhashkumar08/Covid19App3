//
//  Covid19StatisticViewController.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import UIKit

class Covid19StatisticViewController: UIViewController {

    
    @IBOutlet weak var covid19StatisticList : UITableView!
    
    private var covid19ViewModal = Covid19StatisticViewModal()
    
    var dataSource : [ConfirmedCovidCaseData]?
    var countryName : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Covid Status"
        
        covid19ViewModal.Covid19Statistic(request: ConfirmedCaseRequest(countryName: countryName ?? "")) { (covid19statisticData) in
            self.dataSource = covid19statisticData
            self.covid19StatisticList.reloadData()
        }
        
        let rightButtonItem = UIBarButtonItem.init(title: "Graph", style: .plain, target: self, action: #selector(rightButtonAction))

        self.navigationItem.rightBarButtonItem = rightButtonItem
        // Do any additional setup after loading the view.
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChartViewVC") as! ChartViewVC
        vc.chartViewData = self.dataSource
        self.navigationController?.pushViewController(vc, animated: true)
    
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
