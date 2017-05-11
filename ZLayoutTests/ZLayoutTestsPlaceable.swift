//
//  ZLayoutTests.swift
//  ZLayoutTests
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import XCTest
import UIKit
@testable import ZLayout

class ZLayoutTestsPlaceable: XCTestCase {
    
    lazy var childView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var parentView: UIView = {
        let root = UIScreen.main.bounds
        let side: CGFloat = root.size.width / 2
        let rect = CGRect(x: side - side / 2,
                          y: (root.height / 2) - side / 2,
                          width: side,
                          height: side)
        let view = UIView(frame: rect)
        return view
    }()
    
    lazy var rootView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        return view
    }()
    
    let childViewSize: CGSize = CGSize(width: 20, height: 20)
    
    override func setUp() {
        super.setUp()
        rootView.addSubview(parentView)
        childView.frame = CGRect(origin: CGPoint.zero, size: childViewSize)
    }
    
    override func tearDown() {
        childView.removeFromSuperview()
        super.tearDown()
    }
    
    //MARK: Placing
    
    func testCenterPlacing() {
        XCTAssert(childView.centerX != parentView.centerX)
        XCTAssert(childView.centerY != parentView.centerY)
        childView.center(to: parentView)
        XCTAssert(childView.centerX == parentView.centerX)
        XCTAssert(childView.centerY == parentView.centerY)
    }
    
    func testLeftPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.minX != parentView.minX)
        childView.left(to: parentView)
        XCTAssert(childView.minX == parentView.minX)
    }
    
    func testRightPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.maxX != parentView.maxX)
        childView.right(to: parentView)
        XCTAssert(childView.maxX == parentView.maxX)
    }
    
    func testBottomPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.maxY != parentView.maxY)
        childView.bottom(to: parentView)
        XCTAssert(childView.maxY == parentView.maxY)
    }
    
    func testTopPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.minY != parentView.minY)
        childView.top(to: parentView)
        XCTAssert(childView.minY == parentView.minY)
    }
    
    //MARK: Anchors
    
    func testAnchorToCenterInSuperview() {
        parentView.addSubview(childView)
        XCTAssert(childView.centerX != parentView.width / 2)
        XCTAssert(childView.centerY != parentView.height / 2)
        childView.anchorInCenter()
        XCTAssert(childView.centerX == parentView.width / 2)
        XCTAssert(childView.centerY == parentView.height / 2)
    }
    
    func testAnchorLeft() {
        parentView.addSubview(childView)
        childView.anchorTo(edge: .zeroLeft, corner: .zeroTop)
        XCTAssert(childView.minX == parentView.bounds.minX)
    }
    
    func testAnchorRight() {
        parentView.addSubview(childView)
        childView.anchorTo(edge: .zeroRight, corner: .zeroTop)
        XCTAssert(childView.maxX == parentView.bounds.maxX)
    }
    
    func testAnchorTop() {
        parentView.addSubview(childView)
        childView.anchorTo(edge: .zeroTop, corner: .zeroCenter)
        XCTAssert(childView.minY == parentView.bounds.minY)
    }
    
    func testAnchorBottom() {
        parentView.addSubview(childView)
        childView.anchorTo(edge: .zeroBottom, corner: .zeroCenter)
        XCTAssert(childView.maxY == parentView.bounds.maxY)
    }
}
