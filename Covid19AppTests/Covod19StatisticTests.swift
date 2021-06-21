//
//  Covod19StatisticTests.swift
//  Covid19AppTests
//
//  Created by Vibhash Kumar on 18/06/21.
//

import XCTest
@testable import Covid19App

class Covod19StatisticTests: XCTestCase {

    func test_Covod19Statistic_countryName_isEmpty_validationFailure(){
        
        let validation = ConfirmedCaseValidation()
        let statisticRequest = ConfirmedCaseRequest(countryName: "")
        
       let result = validation.selectedCountryNameValidate(request: statisticRequest)
   
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, "Country name is empty")
        XCTAssertEqual(result.success, false)
        
        
    }
   
    func test_Covod19Statistic_countryName_isEmpty_validationSuccess(){
        
        let validation = ConfirmedCaseValidation()
        let statisticRequest = ConfirmedCaseRequest(countryName: "Afghanistan")
        
       let result = validation.selectedCountryNameValidate(request: statisticRequest)
   
        XCTAssertTrue(result.success)
        XCTAssertNil(result.error)
        XCTAssertEqual(result.success, true)
        XCTAssertEqual(result.error, nil)
        
        
    }
    
    func test_Covod19Statistic_countryNameUrl_isNotNil(){
        
        let validation = ConfirmedCaseValidation()
        let statisticRequest = ConfirmedCaseRequest(countryName: "Afghanistan")
       
       let result = validation.selectedCountryNameValidate(request: statisticRequest)
   
        XCTAssertTrue(result.success)
        XCTAssertNil(result.error)
        XCTAssertEqual(result.success, true)
        
        
    }
    
    
    func test_dateConversionTest_yyyy_MM_ddTHHmmssZ_to_MMM_dd_yyyy_Empty(){
        let vc = Covid19StatisticViewController()
        let date =  vc.convertDateFormat("")
        
       
        XCTAssertEqual(date, nil)
        
    }
    
    func test_dateConversionTest_yyyy_MM_ddTHHmmssZ_to_MMM_dd_yyyy_withValue(){
        let vc = Covid19StatisticViewController()
        let date =  vc.convertDateFormat("2021-01-14T00:00:00Z")
        
        
        XCTAssertEqual(date, "Jan 14 2021")
    }
    
    
    
    func test_dataSourceValue_viewController_countryName(){
       
        let countryName =  "Afghanistan"
        let viewModal = Covid19StatisticViewModal()
        let request = ConfirmedCaseRequest(countryName: countryName)
        
        let expectation = self.expectation(description: "test_dataSourceValue_viewController_countryName")
        
        viewModal.Covid19Statistic(request: request) { (countryList) in
          
            XCTAssertNotNil(countryList?.count != nil)
            XCTAssertTrue(countryList!.count>0)
            expectation.fulfill()
         }
        waitForExpectations(timeout: 10, handler: nil)
       
    }

}
