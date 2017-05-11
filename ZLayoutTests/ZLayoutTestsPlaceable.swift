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
        XCTAssert(childView.left != parentView.left)
        childView.left(to: parentView)
        XCTAssert(childView.left == parentView.left)
    }
    
    func testRightPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.right != parentView.right)
        childView.right(to: parentView)
        XCTAssert(childView.right == parentView.right)
    }
    
    func testBottomPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.bottom != parentView.bottom)
        childView.bottom(to: parentView)
        XCTAssert(childView.bottom == parentView.bottom)
    }
    
    func testTopPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.top != parentView.top)
        childView.top(to: parentView)
        XCTAssert(childView.top == parentView.top)
    }
    
    //MARK: Anchors
    
    func testAnchorToCenterInSuperview() {
        parentView.addSubview(childView)
        XCTAssert(childView.centerX != parentView.width / 2)
        XCTAssert(childView.centerY != parentView.height / 2)
        childView.anchorToCenterInParent()
        XCTAssert(childView.centerX == parentView.width / 2)
        XCTAssert(childView.centerY == parentView.height / 2)
    }
}
