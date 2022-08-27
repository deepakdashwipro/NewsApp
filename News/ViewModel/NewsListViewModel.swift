//
//  NewsListViewModel.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

class NewsListViewModel {
	
	private let service:MostPopularServiceProtocol
	 var feedList:Observable<[Feed]>
	 var errorMessage:Observable<String>
	
	/// Default constructer method for initilization
	/// - Parameter _service: mostpopularservice class to get feed
	init(_service:MostPopularServiceProtocol) {
		self.service = _service
		self.feedList = Observable([Feed]())
		self.errorMessage = Observable("")
	}
	
	
	/// Function provide mostpopular news from NYT database based on days selction
	/// - Parameter feedays: `DaysFeed` type to passed based on option available `ie 1,7,30`
	func fetchMostPopularFeed(feedays:DaysFeed) {
		service.fetchMostPopular(days: .sevenday) { [weak self] (result) in
			switch result {
			case .success(let response): //print(response)
				self?.feedList.value = response.results
			case .failure(let error):
				self?.checkForError(_error: error)
			}
		}
	}
	
	
	/// Common place to handale all exception arrosen for diffrent funcanality
	/// - Parameter _error: Custom erro type which is of associative type
	func checkForError(_error:CustomError)  {
		switch _error {
		case .apiFailedError(let error): errorMessage.value = error
		case .parserError(let error):    errorMessage.value = error
		case .urlError(let error):       errorMessage.value = error
		case .customError(let error):    errorMessage.value = error
		}
  }
}
