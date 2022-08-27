//
//  MostPopularServiceTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import XCTest
@testable import News
class MostPopularServiceTest: XCTestCase {

	var service:MostPopularService? = MostPopularService()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
			service = nil
    }
	
	/// Testing service function of mostpoular feed
	func testMostPopularService() {
		let expection  = XCTestExpectation()
		
		service?.fetchMostPopular(days:.oneday) { (result) in
			switch result{
			case .success(let response) : print(response)
				XCTAssertNotNil(response)
			case.failure(let error) : print(error)
				XCTAssertNotNil(error)
			}
			expection.fulfill()
		}
		wait(for: [expection], timeout: 30)
	}

}
