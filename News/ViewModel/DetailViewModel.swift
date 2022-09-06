//
//  DetailViewModel.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

class DetailViewModel {

    private let feed: Feed
    var loadWebView: Observable<URLRequest>?

    init(newsFeed: Feed) {
        self.feed = newsFeed
        guard let url = URL(string: feed.url)  else { return }
        self.loadWebView = Observable(URLRequest(url: url))
    }

    func loadwebView() {
        guard let url = URL(string: feed.url)  else { return }
        let request = URLRequest(url: url)
        self.loadWebView?.value = request
    }
}
