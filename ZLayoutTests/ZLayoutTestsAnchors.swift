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

class ZLayoutTestsAnchors: XCTestCase {
    
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
    
    //MARK: Anchors
    
    func testAnchorToCenterInSuperview() {
        parentView.addSubview(childView)
        XCTAssert(childView.centerX != parentView.width / 2)
        XCTAssert(childView.centerY != parentView.height / 2)
        childView.anchorToCenterInParent()
        XCTAssert(childView.centerX == parentView.width / 2)
        XCTAssert(childView.centerY == parentView.height / 2)
    }
    
    func testAnchorLeft() {
        parentView.addSubview(childView)
        childView.anchorToParent(edge: .left, gravity: .top)
        XCTAssert(childView.minX == parentView.bounds.minX)
    }
    
    func testAnchorRight() {
        parentView.addSubview(childView)
        childView.anchorToParent(edge: .right, gravity: .top)
        XCTAssert(childView.maxX == parentView.bounds.maxX)
    }
    
    func testAnchorTop() {
        parentView.addSubview(childView)
        childView.anchorToParent(edge: .top, gravity: .center)
        XCTAssert(childView.minY == parentView.bounds.minY)
    }
    
    func testAnchorBottom() {
        parentView.addSubview(childView)
        childView.anchorToParent(edge: .bottom, gravity: .center)
        XCTAssert(childView.maxY == parentView.bounds.maxY)
    }
}
