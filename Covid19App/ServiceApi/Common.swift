//
//  Common.swift
//  MVVMPatternApp
//
//  Created by Vibhash Kumar on 04/06/21.
//

import Foundation


struct Constants {
    static let DataSynAlert = "Data Syncronise Successfully"
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
}
struct RealmCredentials {
    static let userApiCredential = "WMEk3LnhyoaBnLPv1WHNBqyNP44bh8B8xtIOeHj0yHMw5QI2rWrmRo5AVBwpUFqM"
    static let appId = "covid19app-ghrrc"
    static let baseURL = "https://realm.mongodb.com"
    static let localAppName = "Covid19App"
    static let localAppVersion = "1"
    static let defaultRequestTimeoutMS = 30000
    

}
struct ApiEndpoints
{
    static let countriesListApi = "https://api.covid19api.com/countries"
    static let confirmedCaseApi = "https://api.covid19api.com/live/country/"
}
