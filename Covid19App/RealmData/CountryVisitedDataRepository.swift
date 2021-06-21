//
//  CountryVisitedDataRepository.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import Foundation

import RealmSwift



protocol CountryVisitedDataRepository {
    func create(countryData : GetCountrydata) -> Void
    func getAll() -> [GetCountrydata]?
    func delete(index: Int) -> Bool
}

struct CountryVisitedDataModal : CountryVisitedDataRepository
{
   
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let realmConfig =  RealmSingletonManeger.shared.connection?.configuration
    
    
    func create(countryData : GetCountrydata) {

      
        let realm = try! Realm()
       
      //  print("realmConfig",realmConfig)
        try! realm.write {
            realm.add(countryData)
        }
       
        RealmSingletonManeger.app.syncManager.errorHandler = { error, session in
            // handle error
        }
    }
    
    func getAll() -> [GetCountrydata]? {

        let realm = try! Realm()
        
        // Access all dogs in the realm
        let countries = realm.objects(GetCountrydata.self)
        
        var cdCountryList : [GetCountrydata] = []

        countries.forEach({ (cdCountryVisited) in
            cdCountryList.append(GetCountrydata(Country: cdCountryVisited.Country, Slug: cdCountryVisited.Slug ?? "", ISo2: cdCountryVisited.ISo2, _partition: "Country"))
        })

        return cdCountryList
    }

    

    func delete(index: Int) -> Bool {
        let realm = try! Realm()
        // Access all dogs in the realm
        let countries = realm.objects(GetCountrydata.self)
        let task = countries[index]

        realm.delete(task)
        return true
    }


   

    
}
