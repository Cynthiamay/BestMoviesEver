//
//  DetailsTableViewCellSpec.swift
//  BestMoviesEverTests
//
//  Created by cynthia watanabe on 30/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import XCTest
@testable import BestMoviesEver

class DetailsTableViewCellSpec: XCTestCase {
    
    let cell = DetailsTableViewCell()

    func testLblTitle() {
        XCTAssertEqual(cell.lblTitle.textColor, UIColor.red)
        XCTAssertTrue(cell.lblTitle.isAccessibilityElement)
    }
    
    func testLblViews() {
        XCTAssertEqual(cell.lblViews.textColor, UIColor.white)
        XCTAssertTrue(cell.lblViews.isAccessibilityElement)
    }
    
    func testLblLikes() {
        XCTAssertEqual(cell.lblLikes.textColor, UIColor.white)
        XCTAssertTrue(cell.lblLikes.isAccessibilityElement)
    }
    
    func testLblHeart() {
        XCTAssertEqual(cell.lblHeart.textColor, UIColor.white)
        XCTAssertNotNil(cell.lblHeart.text)
    }
    
    func testBtnHeart() {
        XCTAssertEqual(cell.btnHeart.titleLabel?.text, "♡")
    }
    
    
}
