//
//  ChartViewVC.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import UIKit
import Charts
class ChartViewVC: UIViewController {

    @IBOutlet weak var lineChartView : LineChartView!
    
    var chartViewData : [ConfirmedCovidCaseData]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpChartView()
    }

    func setUpChartView(){
        self.lineChartView = ChartUtility().SetUpLineChart(self.lineChartView, covid19Casees: chartViewData ?? [])
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
