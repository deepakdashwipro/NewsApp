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
	var detailViewModel:DetailViewModel? = nil
	
	override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()
		    self.setobserver()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.detailViewModel?.loadwebView()
	}
	
	func setDelegate()  {
		webview.navigationDelegate = self
	}
	
	func setobserver() {
		self.detailViewModel?.loadWebView?.bind({ [weak self](request) in
			DispatchQueue.main.async {
				self?.webview.load(request)
			}
		})
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	deinit {
		print("deallocate called")
	}

}


extension DetailViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust  else {
            completionHandler(.useCredential, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
    }
}
