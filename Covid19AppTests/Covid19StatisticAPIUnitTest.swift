//
//  Covid19StatisticAPIUnitTest.swift
//  Covid19AppTests
//
//  Created by Vibhash Kumar on 19/06/21.
//

import XCTest
@testable import Covid19App


class Covid19StatisticAPIUnitTest: XCTestCase {

   
    func test_CountryListApi_ValidRequest_with_CountryListresponse_success_withoutCountryname(){
        //Arrange
        let resource = Covid19StatisticResource()
       
        let statisticRequest = ConfirmedCaseRequest(countryName: "")
        
       
   
        let expectation = self.expectation(description: "ValidRequest_with_CountryDetailListResponse")
        //Act
        resource.getCovid19StatisticList(covidStatisticRequest: statisticRequest) { (confirmedCaseApiList) in
            XCTAssertNotNil(confirmedCaseApiList)
            XCTAssertTrue(((confirmedCaseApiList?.first?.Country) != nil))
            XCTAssertTrue(((confirmedCaseApiList?.last?.Country) != nil))
            
            expectation.fulfill()
        }
       
        waitForExpectations(timeout: 40, handler: nil)
        
    }
    
    func test_CountryListApi_ValidRequest_with_CountryListresponse_Success(){
        //Arrange
        let resource = Covid19StatisticResource()
       
        let statisticRequest = ConfirmedCaseRequest(countryName: "Afghanistan")
        
       
   
        let expectation = self.expectation(description: "ValidRequest_with_CountryDetailListResponse")
        //Act
        resource.getCovid19StatisticList(covidStatisticRequest: statisticRequest) { (confirmedCaseApiList) in
            XCTAssertNotNil(confirmedCaseApiList)
            XCTAssertTrue(((confirmedCaseApiList?.first?.Country) != nil))
            XCTAssertTrue(((confirmedCaseApiList?.last?.Country) != nil))
            
            expectation.fulfill()
        }
       
        waitForExpectations(timeout: 40, handler: nil)
        
    }

}
