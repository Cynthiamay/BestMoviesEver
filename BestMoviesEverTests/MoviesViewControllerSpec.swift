//
//  MoviesViewControllerSpec.swift
//  BestMoviesEverTests
//
//  Created by cynthia watanabe on 30/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import XCTest
@testable import BestMoviesEver

class MoviesViewControllerSpec: XCTestCase {
    
    let controller = MoviesViewController()
    
    override func setUp() {
        controller.viewDidLoad()
    }

    func testViewHierarchy() {
        XCTAssertEqual(controller.view.subviews.count, 2)
    }
}
