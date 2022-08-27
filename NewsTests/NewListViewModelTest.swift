//
//  NewListViewModelTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import XCTest
@testable import News

class NewListViewModelTest: XCTestCase {

	var mockService:MostPopularServiceProtocol?
	var newsListViewModel:NewsListViewModel?
	
    override func setUpWithError() throws {
        mockService = MocMostPopularService()
			guard  let service =  mockService else {
				return
			}
			newsListViewModel = NewsListViewModel(_service: service )
    }

    override func tearDownWithError() throws {
			mockService = nil
			newsListViewModel = nil
    }

	func testfetchList()  {
		newsListViewModel?.fetchMostPopularFeed(feedays: .oneday)
		newsListViewModel?.feedList.bind({ (news) in
			XCTAssertEqual(news.count, 1, "its should equal to dummay data of count 1")
			XCTAssertEqual(news.first?.id, 100000008102256)
			XCTAssertEqual(news.first?.source, "New York Times")
		})
	}
	
	
	
	func testErrorMethod() {
		newsListViewModel?.checkForError(_error: .customError("custom error"))
		newsListViewModel?.errorMessage.bind({ (message) in
			XCTAssertEqual(message, "custom error")
		})
	}
}
