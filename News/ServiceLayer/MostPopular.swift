//
//  MostPopular.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

enum DaysFeed: String {
    case oneday = "1"
    case sevenday = "7"
    case thirtyday = "30"
}
protocol MostPopularServiceProtocol {
    func fetchMostPopular(days: DaysFeed, completion: @escaping (Result<FeedResponse, CustomError>) -> Void)
    func parsedata(_ data: Data?) throws -> FeedResponse
}

/// Class for calling mostpoupar feeds

struct MostPopularService: MostPopularServiceProtocol {

    /// Function for getiing all most popular feed from new york times data base
    /// - Parameters:
    ///   - days: number of days lenght feed required(old feed with number of days)
    ///   - completion: return `Result` which have success and failure data with `FeedResponse` response model

    func fetchMostPopular(days: DaysFeed = .oneday, completion: @escaping (Result<FeedResponse, CustomError>) -> Void) {
        let path = NewsApiConstants.mostViewedurl+(days.rawValue)+NewsApiConstants.ext
        WebserviceManager().requestGetApi(urlString: path) { (data, error) in
            if error != nil {
                completion(.failure(.apiFailedError(error?.localizedDescription ?? ErrorConstants.apiFailed+path)))
            } else {
                do {
                    let response = try self.parsedata(data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parserError(error.localizedDescription)))
                }
            }
        }
    }

    /// Method to parse the parse the data of most poular api
    /// - Parameter data: response data which we got from api `Mostpoular`
    /// - Throws: Throws any exception raised based on missing key or variable datatype
    /// - Returns: `FeedResponse` model

    func parsedata(_ data: Data?) throws -> FeedResponse {
        guard let data = data else {
            throw CustomError.customError(ErrorConstants.nilResponse)
        }
        return try JSONDecoder().decode(FeedResponse.self, from: data )
    }
}
