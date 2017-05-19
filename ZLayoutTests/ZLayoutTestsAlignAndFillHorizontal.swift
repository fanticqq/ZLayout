//
//  ZLayoutTestsAlignAndFill.swift
//  ZLayout
//
//  Created by Igor Zarubin on 20/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import XCTest

class ZLayoutTestsAlignAndFillHorizontal: XCTestCase {
    
    lazy var rootView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        return view
    }()
    
    lazy var view1: UIView = {
        let root = UIScreen.main.bounds
        let side: CGFloat = root.size.width / 4
        let rect = CGRect(x: 0,
                          y: (root.height / 2) - side / 2,
                          width: side,
                          height: side)
        let view = UIView(frame: rect)
        return view
    }()
    
    lazy var view2: UIView = {
        let root = UIScreen.main.bounds
        let side: CGFloat = root.size.width / 4
        let rect = CGRect(x: root.width - side,
                          y: (root.height / 2) - side / 2,
                          width: side,
                          height: side)
        let view = UIView(frame: rect)
        return view
    }()
    
    lazy var alignmentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let alignmentViewSize: CGSize = CGSize(width: 20, height: 20)
    
    override func setUp() {
        super.setUp()
        rootView.addSubview(view1)
        rootView.addSubview(view2)
        rootView.addSubview(alignmentView)
        alignmentView.frame = CGRect(origin: CGPoint.zero, size: alignmentViewSize)
    }
    
    func testAlignAndFillRight() {
        alignmentView.alignAndFill(to: .zeroRight, ofLayout: view1, gravity: .zeroCenter, toLayout: view2)
        XCTAssert(alignmentView.minX == view1.maxX)
        XCTAssert(alignmentView.maxX == view2.minX)
    }
    
    func testAlignAndFillLeft() {
        alignmentView.alignAndFill(to: .zeroLeft, ofLayout: view2, gravity: .zeroCenter, toLayout: view1)
        XCTAssert(alignmentView.minX == view1.maxX)
        XCTAssert(alignmentView.maxX == view2.minX)
    }
    
    func testAlignAndFillLeftToSuperview() {
        alignmentView.alignAndFill(to: .zeroLeft, ofLayout: view2, gravity: .zeroCenter)
        XCTAssert(alignmentView.minX == 0)
        XCTAssert(alignmentView.maxX == view2.minX)
    }
    
    func testAlignAndFillRightToSuperview() {
        alignmentView.alignAndFill(to: .zeroRight, ofLayout: view1, gravity: .zeroCenter)
        XCTAssert(alignmentView.minX == view1.maxX)
        XCTAssert(alignmentView.maxX == rootView.maxX)
    }
}
