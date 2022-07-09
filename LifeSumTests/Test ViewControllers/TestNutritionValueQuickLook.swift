//
//  TestNutritionValueQuickLook.swift
//  LifeSumTests
//
//  Created by Mohsen on 7/9/22.
//

import XCTest
import Moya
@testable import LifeSum

class TestNutritionValueQuickLook: XCTestCase {

    var sut: NutritionValueQuickLookVC!
    
    override func setUp() {
        super.setUp()
        
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: NutritionValueQuickLookVC.className) as! NutritionValueQuickLookVC
        _ = sut.view
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataFromExchangeAnyView() {
        
        let testView = TestView()
        
        sut.presenter?.view = testView
        (sut.presenter as? NutritionValueQuickLookPresenter)?.getData(with: 3)
        class TestView: AnyView {
            
            var presenter: AnyPresenter?
            
            let resultExpection = XCTestExpectation(description: "waiting for the result")
           
            func update<T>(with result: T) where T : Decodable, T : Encodable {
                resultExpection.fulfill()
                XCTAssertNotNil(result as? Foodipedia)
                
            }
            
            func update(with error: Error) {
                print(error.localizedDescription)
                resultExpection.fulfill()
                XCTAssertTrue(error is MoyaError)
            }
        }
        
        wait(for: [testView.resultExpection], timeout: 30)
    }

}
