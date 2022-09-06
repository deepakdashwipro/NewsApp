//
//  Constants.swift
//  News
//
//  Created by Deepak Kumar Dash (Digital) on 02/09/22.
//

import Foundation
struct ImageNameConstants {
    static let placeholderImg = "cloud.sun.rain.fill"
}
struct NewsApiConstants {
    static let ext = ".json?"
    static let mostViewedurl = "mostpopular/v2/mostviewed/all-sections/"
    static let keyApi = "api-key=kUsDqOHMQAdZzbGLXZuIGzvdi6VhIetX"
    static let baseUrl = "https://api.nytimes.com/svc/"
    static let mediaMetadataKey = "media-metadata"
}
struct ErrorConstants {
    static let apiFailed = "api failed"
    static let nilResponse = "data nil in response"
    static let checkUrl = "Please check url"
    static let cellRegistarationFailed = "please check NewsTableViewCell registaration"
}
struct IdentifierNameConstants {
    static let newsTableViewCellName = "NewsTableViewCell"
    static let detailViewControllerName = "DetailViewController"
    static let nagivationTitle = "The New York Times"
}
