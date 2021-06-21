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
   
    
    
   
    
    func create(countryData : GetCountrydata) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let realmConfig =  RealmSingletonManeger.shared.connection?.configuration
        
      
       // let realm = try! Realm(configuration: appDelegate.realm!.configuration)//appDelegate.realm
        let realm = appDelegate.realm!
        countryData.partition = appDelegate.user!.id
      //  print("realmConfig",realmConfig)
        let task = GetCountrydata(Country: countryData.Country, Slug: countryData.Slug!, ISo2: countryData.ISo2)
        task.partition = appDelegate.user!.id
        try! realm.write {
            realm.add(task)
        }
        DispatchQueue.global(qos: .background).async {
        RealmSyncManger().SyncchangesBetweenDevice(user: (appDelegate.user)!) { (realm) in
           
            RealmSyncManger().showAlert()
        }
        }
    }
    
    func getAll() -> [GetCountrydata]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        let realm = appDelegate.realm
       
        // Access all dogs in the realm
        let countries = realm?.objects(GetCountrydata.self)
        
        var cdCountryList : [GetCountrydata] = []

        countries?.forEach({ (cdCountryVisited) in
            cdCountryList.append(GetCountrydata(Country: cdCountryVisited.Country, Slug: cdCountryVisited.Slug ?? "", ISo2: cdCountryVisited.ISo2))
        })

        return cdCountryList
    }

    

    func delete(index: Int) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let realm = appDelegate.realm
       
        // Access all dogs in the realm
        let countries = realm?.objects(GetCountrydata.self)
        let task = countries?[index] ?? GetCountrydata()
        try! realm?.write {
            
            realm?.delete(task)
        }
        
        DispatchQueue.global(qos: .background).async {
        RealmSyncManger().SyncchangesBetweenDevice(user: (appDelegate.user)!) { (realm) in
            
            RealmSyncManger().showAlert()
        }
            
        }
        return true
    }


   

    
}
