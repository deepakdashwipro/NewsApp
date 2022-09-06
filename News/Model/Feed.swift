//
//  Feed.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

struct Feed: Decodable {
    let uri: String
    let url: String
    let source: String
    let updated: String
    let byline: String
    let section: String
    let type: String
    let title: String
    let abstract: String
    let media: [Media]
}

struct Media: Decodable {
    let mediametadata: [Mediametadata]?
    enum Keys: String, CodingKey {
        case mediametadata = "media-metadata"
    }
    init(from decoder: Decoder) throws {
        let cont = try decoder.container(keyedBy: Keys.self)
        mediametadata = try cont.decode([Mediametadata].self, forKey: .mediametadata)
    }
}
struct Mediametadata: Decodable {
    let url: String
}
