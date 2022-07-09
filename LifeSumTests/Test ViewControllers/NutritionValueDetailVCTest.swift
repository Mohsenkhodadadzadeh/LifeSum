//
//  NutritionValueDetailVCTest.swift
//  LifeSumTests
//
//  Created by Mohsen on 7/9/22.
//

import XCTest
@testable import LifeSum

class NutritionValueDetailVCTest: XCTestCase {

    var sut: NutritionValueDetailVC!
    
    override func setUp() {
            super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: NutritionValueDetailVC.className) as! NutritionValueDetailVC
        sut.nutritionValues = Foodipedia(title: "Milk, 3.25%", calories: 61, carbs: 4.8, protein: 3.22, fat: 3.25, saturatedfat: nil, unsaturatedfat: 1.007, fiber: nil, cholesterol: 0.0, sugar: 4.5, sodium: 0.04, potassium: 0.143, gramsperserving: 240.0, pcstext: "Glass")
        _ = sut.view
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataSource_ViewDidLoad_SetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is NutritionValueTableViewHandler)
    }

    func testDataSource_ViewDidLoad_SetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is NutritionValueTableViewHandler)
    }
}
