//
//  DetailViewControllerTest.swift
//  NewsTests
//
//  Created by Deepak Kumar Dash (Digital) on 27/08/22.
//

import XCTest
@testable import News
class DetailViewControllerTest: XCTestCase {
  //  var viewmodel = DetailViewController()
    var sessionUnderTest: URLSession!
    var controllerUnderTest: DetailViewController!

    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:
                                                    "DetailViewController") as? DetailViewController {
            controllerUnderTest = viewController
            _ = controllerUnderTest.view
        }
    }

    override func tearDown() {
        sessionUnderTest = nil
        controllerUnderTest = nil
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with
        //assertions afterwards.
    }

    func testDetailViewController() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: controllerUnderTest as Any,
                                                     requiringSecureCoding: false)
        let coder = try? NSKeyedUnarchiver(forReadingFrom: data ?? Data())
        let sut = DetailViewController(coder: coder ?? NSCoder())
                   XCTAssertNotNil(sut)
        XCTAssertNotNil(controllerUnderTest.webView(_:didReceive:completionHandler:))
    }
}
