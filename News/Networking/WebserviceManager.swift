//
//  WebserviceManager.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

class WebserviceManager: NSObject {

    func requestGetApi(urlString: String, completion: @escaping(Data?, Error?) -> Void ) {

        guard  let url = URL(string: NewsApiConstants.baseUrl + urlString + NewsApiConstants.keyApi ) else {
            completion(nil, CustomError.urlError("Please check url "))
            return
        }
        let config = URLSessionConfiguration.default
        let delegate = BasicAuthDelegate()
        let session = Foundation.URLSession(configuration: config, delegate: delegate,
                                            delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: {requestData, _, errorData -> Void in
            if errorData == nil {
                completion(requestData, errorData)
            } else {
                completion(requestData, errorData)
            }
        })
        task.resume()
    }
}

enum CustomError: Error {
    case urlError(String)
    case apiFailedError(String)
    case parserError(String)
    case customError(String)
}
