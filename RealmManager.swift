//
//  RealmManager.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 20/06/21.
//

import Foundation
import RealmSwift

let appdelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate


enum TaskStatus: String {
  case Open
  case InProgress
  case Complete
    
}

class GetCountrydata: Object {
    @objc dynamic var _id: String = UUID().uuidString
    @objc dynamic var Country: String = ""
    @objc dynamic var Slug: String?
    @objc dynamic var ISo2: String = ""
   
    @objc dynamic var _partition: String = ""
    @objc dynamic var status: String = ""
   
    override static func primaryKey() -> String? {
        return "_id"
    }

    var statusEnum: TaskStatus {
        get {
            return TaskStatus(rawValue: status) ?? .Open
        }
        set {
            status = newValue.rawValue
        }
    }

    convenience init(Country: String,Slug:String,ISo2:String,_partition:String) {
        self.init()
        self.Country = Country
        self.Slug = Slug
        self.ISo2 = ISo2
        self._partition = _partition
    }
    
    func convertToObject()->SelectCountryData{

        return  SelectCountryData(Country: self.Country, Slug: self.Slug ?? "", ISO2: self.ISo2)
    }
   
}
