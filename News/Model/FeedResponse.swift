//
//  FeedResponse.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import Foundation

struct FeedResponse:Decodable {
	let copyright:String
	let results:[Feed]
}
