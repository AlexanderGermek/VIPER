//
//  VIPER_SimpsonsTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 28.11.2021.
//

import XCTest
@testable import VIPER_Simpsons

class VIPER_SimpsonsTests: XCTestCase {

	var sut: URLSession!
//	let networkMonitor = NetworkMonitor.shared

	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = URLSession(configuration: .default)
	}

	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}

	func testGetQuotes() throws {
		//try XCTSkipUnless(networkMonitor.isReachable, "network connectivity needed for this test.")

		// given
		let urlString = "https://thesimpsonsquoteapi.glitch.me/quotes?count=10"
		let url = URL(string: urlString)!
		let promise = expectation(description: "Completion handler invoked")
		var statusCode: Int?
		var responseError: Error?

		// when
			let dataTask = sut.dataTask(with: url) { _, response, error in
				statusCode = (response as? HTTPURLResponse)?.statusCode
				responseError = error
				promise.fulfill()
			}

		dataTask.resume()
		wait(for: [promise], timeout: 5)

		//then
		XCTAssertNil(responseError)
		XCTAssertEqual(statusCode, 200)
	}
}
