//
//  DetailViewModelTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 19/12/21.
//

import XCTest
@testable import News
class DetailViewModelTest: XCTestCase {

	var viewmodel:DetailViewModel?
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
			guard let data = sampleRes.data(using: .utf8) else { return  }
			do {
				let feed = try JSONDecoder().decode(Feed.self, from: data )
				viewmodel = DetailViewModel(_feed: feed)
			}catch let error{
				print(error)
			}
			
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testloadwebview()  {
		viewmodel?.loadWebView?.bind({ (request) in
			XCTAssertEqual(request.url, URL(string: "https://www.nytimes.com/2021/12/14/well/live/chin-hairs-women.html"))
		})
	}
}
