//
//  TwitterAPIClientTests.swift
//  TwitterClient
//
//  Created by Garrett Richards on 9/12/14.
//  Copyright (c) 2014 bluewaves. All rights reserved.
//

import UIKit
import XCTest

class TwitterAPIClientTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitClient() {
        let client = TwitterAPIClient(nil)
    }

    //  this test requires you to set the number of twitter accounts you have set up on the simulator
    func testFetchTwitterAccounts()
    {
        let numberOfTwitterAccountsSetupOnSimulator = 1
        let expectation = expectationWithDescription("get twitter accounts")

        TwitterAPIClient.fetchTwitterAccounts({
            accountStoreAccounts, error in
            if let accounts = accountStoreAccounts as [AnyObject]!?
            {
                XCTAssertEqual(accounts.count, numberOfTwitterAccountsSetupOnSimulator, "there should be no accounts")
            }
            expectation.fulfill()
        })

        let timeout = 2.0
        waitForExpectationsWithTimeout(timeout, handler: { (error) -> Void in
            if let e = error
            {
                XCTFail("could not fetch twitter accounts in interval: \(timeout)")
            }
        })
    }


}
