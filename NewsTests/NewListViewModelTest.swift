//
//  NewListViewModelTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import XCTest
@testable import News

class NewListViewModelTest: XCTestCase {

	var mockService: MostPopularServiceProtocol?
	var newsListViewModel: NewsListViewModel?

    override func setUpWithError() throws {
        mockService = MocMostPopularService()
			guard  let service =  mockService else {
				return
			}
        newsListViewModel = NewsListViewModel(serviceProtocol: service )
    }

    override func tearDownWithError() throws {
			mockService = nil
			newsListViewModel = nil
    }

	func testfetchList() {
		newsListViewModel?.fetchMostPopularFeed(feedays: .oneday)
		newsListViewModel?.feedList.bind({ (news) in
			XCTAssertEqual(news.count, 0, "its should equal to dummay data of count 0")
			XCTAssertNil(news.first?.section)
			XCTAssertNil(news.first?.source)
		})
	}

	func testErrorMethod() {
        newsListViewModel?.checkForError(feedError: .customError("custom error"))
		newsListViewModel?.errorMessage.bind({ (message) in
			XCTAssertEqual(message, "custom error")
		})
	}
}
