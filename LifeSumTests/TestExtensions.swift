//
//  TestExtensions.swift
//  LifeSumTests
//
//  Created by Mohsen on 7/9/22.
//

import XCTest
@testable import LifeSum

class TestExtensions: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertClassNameToString() {
        XCTAssertEqual(NutritionValueQuickLookVC.className, "NutritionValueQuickLookVC")
    }

}
