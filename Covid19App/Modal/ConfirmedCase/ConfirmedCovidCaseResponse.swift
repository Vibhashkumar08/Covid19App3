//
//  ConfirmedCovidCaseResponse.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 18/06/21.
//

import Foundation


struct ConfirmedCovidCaseData : Decodable
{
    let ID: String
    let Country: String
    let CountryCode : String
    let Province : String
    let City : String
    let CityCode : String
    let Lat : String
    let Lon : String
    let Confirmed : Int
    let Deaths : Int
    let Recovered : Int
    let Active : Int
    let Date : String
  
}

