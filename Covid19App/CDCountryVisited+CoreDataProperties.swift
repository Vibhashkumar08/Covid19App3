//
//  CDCountryVisited+CoreDataProperties.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//
//

import Foundation
import CoreData


extension CDCountryVisited {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCountryVisited> {
        return NSFetchRequest<CDCountryVisited>(entityName: "CDCountryVisited")
    }

    @NSManaged public var countryname: String?
    @NSManaged public var slug: String?
    @NSManaged public var iso2: String?

    
    func convertToSelectedCountry() -> SelectCountryData
    {
        return SelectCountryData(Country: self.countryname!, Slug: self.slug!, ISO2: self.iso2!)
    }

    
}

extension CDCountryVisited : Identifiable {

}
