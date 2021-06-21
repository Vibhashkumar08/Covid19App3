//
//  SelectCountryViewModal.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation




struct SelectCountryViewModel
{
    
    private let manager = CountryVisitedDataModal()
   
    
    func setCountryDetailCoreData(countryDetail: GetCountrydata ,completionHandler :@escaping(_ result : [GetCountrydata]?)-> Void ){
        
        manager.create(countryData: countryDetail)
       
        guard let countryList =  manager.getAll() else {
            _=completionHandler(nil)
            return
        }
      
        _=completionHandler(countryList)
        
    }
    
   
    func getCountryList(completionHandler :@escaping(_ result : [SelectCountryData]?)-> Void ){
        
            //user login resource to call the API
      
            let countryResource = SelectCountryResource()
        countryResource.getCountryList { (selectCountryApiList) in
            if ((selectCountryApiList ?? []).count>0){
                DispatchQueue.main.async {
                    let sortedResult = selectCountryApiList?.sorted{ $0.Country < $1.Country }
                    
                    _ = completionHandler(sortedResult)
                }
            }
           
        }
        
    }
    
    
}
