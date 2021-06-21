//
//  SelectCountryResource.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation


struct SelectCountryResource {
    
    let countryURL = URL(string: ApiEndpoints.countriesListApi)!
    
    func getCountryList(completion : @escaping(_ result : [SelectCountryData]?) -> Void){
         let httpUtility = HttpUtility()
    
        httpUtility.getApiData(requestUrl: countryURL, resultType: SelectCountryData.self) { (countryListApiResponse) in
                _ = completion(countryListApiResponse)
            }
         
    }
    
    
}
