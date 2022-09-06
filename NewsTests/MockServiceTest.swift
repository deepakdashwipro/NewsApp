//
//  MockServiceTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import XCTest
@testable import News

class MocMostPopularService: MostPopularServiceProtocol {

	func fetchMostPopular(days: DaysFeed, completion: @escaping (Result<FeedResponse, CustomError>) -> Void) {
		guard let data = response.data(using: .utf8) else { return  }
        do {
            let response = try self.parsedata(data)
            //all fine with jsonData here
            completion(.success(response))
        } catch {
            //handle error
            print(error)
        }
	}

	func parsedata(_ data: Data?) throws -> FeedResponse {
		guard let data = data else {
			 throw CustomError.customError("data nil in response")
		}
		return try JSONDecoder().decode(FeedResponse.self, from: data )
	}
}
