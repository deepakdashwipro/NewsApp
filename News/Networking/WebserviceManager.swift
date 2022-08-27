//
//  WebserviceManager.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

class WebserviceManager: NSObject{
	private let key = "api-key=kUsDqOHMQAdZzbGLXZuIGzvdi6VhIetX"
	private let baseUrl = "https://api.nytimes.com/svc/"
    private var actualUrl: URL!
    func requestGetApi(urlString:String, forImages:Bool, completion: @escaping(Data?,Error?) -> Void )  {
		
        if forImages == false{
		guard  let url = URL(string: baseUrl + urlString + key ) else {
			completion(nil,CustomError.urlError("Please check url "))
			return
		}
            actualUrl = url
        } else{
            guard  let url = URL(string: urlString) else {
                completion(nil,CustomError.urlError("Please check url "))
                return
            }
                actualUrl = url
        }
        func URLSession(session: URLSession, didReceiveChallenge challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        }
        let config = URLSessionConfiguration.default
        let session = Foundation.URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: actualUrl, completionHandler: {requestData, response, errorData -> Void in
                    if errorData == nil {
                        completion(requestData , errorData)
                    }
                    else {
                        let _ = NSError(domain: "Err-1001", code: 11, userInfo:nil)
                        completion(requestData , errorData)
                    }
                });

                task.resume()
	}
}

enum CustomError:Error {
	case urlError(String)
	case apiFailedError(String)
	case parserError(String)
	case customError(String)
}
extension WebserviceManager: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
       //Trust the certificate even if not valid
       let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

       completionHandler(.useCredential, urlCredential)
    }
}
