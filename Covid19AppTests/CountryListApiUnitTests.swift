//
//  CountryListApiUnitTests.swift
//  Covid19AppTests
//
//  Created by Vibhash Kumar on 18/06/21.
//

import XCTest
@testable import Covid19App


class CountryListApiUnitTests: XCTestCase {

    func test_CountryListApi_ValidRequest_with_CountryListresponse(){
        //Arrange
        let resource = SelectCountryResource()
        
        let expectation = self.expectation(description: "ValidRequest_with_CountryListresponse")
        //Act
        
        resource.getCountryList{ (countryListApiResponse) in
            //Asserts
            XCTAssertNotNil(countryListApiResponse)
            XCTAssertTrue(((countryListApiResponse?.first?.Country) != nil))
            XCTAssertTrue(((countryListApiResponse?.last?.Country) != nil))
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
   
    func test_dataSourceValue_viewController_countryName(){
        let vc = SelectCountryVC()
       
        let viewModal = SelectCountryViewModel()
       
        
        let expectation = self.expectation(description: "test_dataSourceValue_viewController_countryList")
        
        viewModal.getCountryList { (countryList) in
            XCTAssertNotNil(countryList?.count != nil)
            XCTAssertTrue(countryList!.count>0)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
       
    }

}
