//
//  TestFeedResponse.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import XCTest
@testable import News
class TestFeedResponse: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testFeedRes() {
		
		guard let data = sampleRes.data(using: .utf8) else { return  }
		do {
			let feed = try JSONDecoder().decode(FeedResponse.self, from: data )
			//XCTAssertEqual(feed.status, 1)
			XCTAssertEqual(feed.results.count, 1)
		}catch let error {
			print(error)
		}
	}

}

let response = """
{
	 "status":"OK",
	 "copyright":"Copyright (c) 2021 The New York Times Company.  All Rights Reserved.",
	 "num_results":20,
	 "results":[
			{
				 "uri":"nyt://article/7ef1d2b3-1c1e-507d-b143-a0187be87377",
				 "url":"https://www.nytimes.com/2021/12/14/well/live/chin-hairs-women.html",
				 "id":100000008102256,
				 "asset_id":100000008102256,
				 "source":"New York Times",
				 "published_date":"2021-12-14",
				 "updated":"2021-12-15 01:12:27",
				 "section":"Well",
				 "subsection":"Live",
				 "nytdsection":"well",
				 "adx_keywords":"Hair;Content Type: Service;Skin;Beauty Salons;Women and Girls;Polycystic Ovary Syndrome",
				 "column":null,
				 "byline":"By Melinda Wenner Moyer",
				 "type":"Article",
				 "title":"Why Do Women Sprout Chin Hairs as They Age?",
				 "abstract":"And what’s the best way to remove them?",
				 "des_facet":[
						"Hair",
						"Content Type: Service",
						"Skin",
						"Beauty Salons",
						"Women and Girls",
						"Polycystic Ovary Syndrome"
				 ],
				 "org_facet":[
						
				 ],
				 "per_facet":[
						
				 ],
				 "geo_facet":[
						
				 ],
				 "media":[
						{
							 "type":"image",
							 "subtype":"photo",
							 "caption":"",
							 "copyright":"Aileen Son for The New York Times",
							 "approved_for_syndication":1,
							 "media-metadata":[
									{
										 "url":"https://static01.nyt.com/images/2021/12/14/well/14askwell-chin-hairs1/14askwell-chin-hairs1-thumbStandard.jpg",
										 "format":"Standard Thumbnail",
										 "height":75,
										 "width":75
									},
									{
										 "url":"https://static01.nyt.com/images/2021/12/14/well/14askwell-chin-hairs1/14askwell-chin-hairs1-mediumThreeByTwo210.jpg",
										 "format":"mediumThreeByTwo210",
										 "height":140,
										 "width":210
									},
									{
										 "url":"https://static01.nyt.com/images/2021/12/14/well/14askwell-chin-hairs1/14askwell-chin-hairs1-mediumThreeByTwo440.jpg",
										 "format":"mediumThreeByTwo440",
										 "height":293,
										 "width":440
									}
							 ]
						}
				 ],
				 "eta_id":0
			}
		 ]
}
"""
