//
//  DetailViewController.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    var detailViewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()
        self.setobserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.detailViewModel?.loadwebView()
    }

    func setDelegate() {
        webview.navigationDelegate = self
    }

    func setobserver() {
        self.detailViewModel?.loadWebView?.bind({ [weak self](request) in
            DispatchQueue.main.async() {
                self?.webview.load(request)
            }
        })
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust  else {
            completionHandler(.useCredential, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
    }
}
