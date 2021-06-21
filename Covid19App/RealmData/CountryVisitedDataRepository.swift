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

        guard let realm = RealmSingletonManeger.shared.connection else { return }
      
        guard let user = RealmSingletonManeger.shared.user  else { return  }
        countryData.partition = user.id
       
        let task = GetCountrydata(Country: countryData.Country, Slug: countryData.Slug!, ISo2: countryData.ISo2)
        task.partition = user.id
        try! realm.write {
            realm.add(task)
        }
        DispatchQueue.global(qos: .background).async {
            RealmSyncManger().SyncchangesBetweenDevice(user: user) { (realm) in
                DispatchQueue.main.async {
                    RealmSyncManger().showAlert()
                }
            }
        }
    }
    
    func getAll() -> [GetCountrydata]? {
        guard let realm = RealmSingletonManeger.shared.connection else { return nil}
        let countries = realm.objects(GetCountrydata.self)
        var cdCountryList : [GetCountrydata] = []
        countries.forEach({ (cdCountryVisited) in
            cdCountryList.append(GetCountrydata(Country: cdCountryVisited.Country, Slug: cdCountryVisited.Slug ?? "", ISo2: cdCountryVisited.ISo2))
        })
        return cdCountryList
    }
    
    
    
    func delete(index: Int) -> Bool {
        guard let realm = RealmSingletonManeger.shared.connection else { return false}
        
        let countries = realm.objects(GetCountrydata.self)
        let task = countries[index]
        
        if ((countries.count)>1){
            try! realm.write {
                realm.delete(task)
            }
        }else{
            try! realm.write {
                realm.deleteAll()
            }
        }
        
        
        DispatchQueue.global(qos: .background).async {
            guard let user = RealmSingletonManeger.shared.user else { return }
            RealmSyncManger().SyncchangesBetweenDevice(user: user) { (realm) in
                DispatchQueue.main.async {
                    RealmSyncManger().showAlert()
                }
            }
            
        }
        return true
    }
    
    
    
    
    
}
