//
//  Covid19StatisticResource.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation


struct Covid19StatisticResource {
    
    
    func getCovid19StatisticList(covidStatisticRequest:ConfirmedCaseRequest,completion : @escaping(_ result : [ConfirmedCovidCaseData]?) -> Void){
        
         guard let countryURL = URL(string: "\(ApiEndpoints.confirmedCaseApi)\(covidStatisticRequest.countryName)/status/confirmed") else { return }
        let httpUtility = HttpUtility()
        
        httpUtility.getApiData(requestUrl: countryURL, resultType: ConfirmedCovidCaseData.self) { (covid19StatisticApiResponse) in
            _ = completion(covid19StatisticApiResponse)
        }
        
    }
    
    
}
