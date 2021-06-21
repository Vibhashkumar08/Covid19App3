//
//  ConfirmedCaseValidation.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation



struct ConfirmedCaseValidation
{
    
    func selectedCountryNameValidate(request : ConfirmedCaseRequest) -> ConfirmedCaseValidationResult {
        
        if ((request.countryName).isEmpty){
           return ConfirmedCaseValidationResult(success: false, error: "Country name is empty")
        }else{
            return ConfirmedCaseValidationResult(success: true, error: nil)
        }
       
    }
    
    
}
