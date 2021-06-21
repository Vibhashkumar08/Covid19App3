//
//  RecentlyViewedViewModal.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import Foundation


struct RecentlyViewedViewModal
{
   
    
    private let manager = CountryVisitedDataModal()
   
   
    
    func getCountryList(completionHandler :@escaping(_ result : [GetCountrydata]?)-> Void ){
        
        guard let countryList =  manager.getAll() else {
            _=completionHandler(nil)
            return
        }
      
        _=completionHandler(countryList)
        
    }
    
    func deleteCountry(index:Int)-> Bool{
        
        if (manager.delete(index: index)){
           return true
        }
        return false
    }
    
}
