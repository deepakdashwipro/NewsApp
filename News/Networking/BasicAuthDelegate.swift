//
//  HTTPBasicAuthenticationSessionDelegate.swift
//  News
//
//  Created by Deepak Kumar Dash (Digital) on 14/09/22.
//

import Foundation

class BasicAuthDelegate: NSObject, URLSessionDelegate {

    /// The delegate method receives a URLAuthenticationChallenge instance that describes the challenge being issued.
    /// This instance contains a protectionSpace property whose authenticationMethod property
    /// indicates the kind of challenge being issued
    /// - Parameters:
    ///   - session: URLSession
    ///   - challenge: AuthenticationChallenge
    ///   - completionHandler: call back
    func URLSession(session: URLSession, didReceiveChallenge challenge: URLAuthenticationChallenge,
                    completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }

    /// method of URLSessionDelegate to handle session-wide challenges.
    /// These are challenges like Transport Layer Security (TLS) validation.
    /// Once you’ve successfully handled this kind of challenge, your action remains in effect for all
    ///  tasks created from that URLSession.
    /// - Parameters:
    ///   - session: URLSession
    ///   - challenge: AuthenticationChallenge
    ///   - completionHandler: call back
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                           completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        //Trust the certificate even if not valid
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
}
