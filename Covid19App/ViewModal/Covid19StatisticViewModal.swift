//
//  Covid19StatisticViewModal.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation


struct Covid19StatisticViewModal
{
   
    func  Covid19Statistic(request : ConfirmedCaseRequest, completionHandler :@escaping(_ result : [ConfirmedCovidCaseData]?)-> Void ){
        
            //user login resource to call the API
      
        let validation = ConfirmedCaseValidation().selectedCountryNameValidate(request: request)
        
        if validation.success{
        
        let covidStatistic = Covid19StatisticResource()
            
        covidStatistic.getCovid19StatisticList(covidStatisticRequest: request) { (confirmedCaseApiResponse) in
            if ((confirmedCaseApiResponse ?? []).count>0){
                DispatchQueue.main.async {
                    let sortedResult = confirmedCaseApiResponse?.sorted{ $0.Country < $1.Country }
                    _ = completionHandler(sortedResult)
                }
            }
           
        }
        }
    }
    
    
}
