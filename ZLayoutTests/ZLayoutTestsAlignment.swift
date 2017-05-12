//
//  ZLayoutTestsAlignment.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import XCTest
import UIKit
@testable import ZLayout

class ZLayoutTestsAlignment: XCTestCase {
    
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
        rootView.addSubview(childView)
        childView.frame = CGRect(origin: CGPoint.zero, size: childViewSize)
    }
    
    override func tearDown() {
        super.tearDown()
        childView.removeFromSuperview()
    }
    
    //MARK: Placing
    
    func testCenterAlignment() {
        childView.alignToCenter(ofLayout: parentView)
        XCTAssert(childView.centerX == parentView.centerX)
        XCTAssert(childView.centerY == parentView.centerY)
    }
    
    func testLeftPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.minX == parentView.minX)
    }
    
    func testRightPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.maxX == parentView.maxX)
    }
    
    func testBottomPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.maxY == parentView.maxY)
    }
    
    func testTopPlacing() {
        rootView.addSubview(childView)
        XCTAssert(childView.minY == parentView.minY)
    }
}
