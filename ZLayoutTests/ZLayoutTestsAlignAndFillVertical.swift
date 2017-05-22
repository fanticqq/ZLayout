//
//  ZLayoutTestsAlignAndFillVertical.swift
//  ZLayout
//
//  Created by Igor Zarubin on 20/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import XCTest

class ZLayoutTestsAlignAndFillVertical: XCTestCase {
    
    lazy var rootView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        return view
    }()
    
    lazy var view1: UIView = {
        let root = UIScreen.main.bounds
        let side: CGFloat = root.size.width / 4
        let rect = CGRect(x: (root.width / 2) - side / 2,
                          y: 0,
                          width: side,
                          height: side)
        let view = UIView(frame: rect)
        return view
    }()
    
    lazy var view2: UIView = {
        let root = UIScreen.main.bounds
        let side: CGFloat = root.size.width / 4
        let rect = CGRect(x: (root.width / 2) - side / 2,
                          y: root.height - side,
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
    
    func testAlignAndFillTop() {
        alignmentView.alignAndFill(on: .top, relativeTo: view2, withGravity: .center, stretchTo: view1)
        XCTAssert(alignmentView.minY == view1.maxY)
        XCTAssert(alignmentView.maxY == view2.minY)
    }
    
    func testAlignAndFillBottom() {
        alignmentView.alignAndFill(on: .bottom, relativeTo: view1, withGravity: .center, stretchTo: view2)
        XCTAssert(alignmentView.minY == view1.maxY)
        XCTAssert(alignmentView.maxY == view2.minY)
    }
    
    func testAlignAndFillTopToSuperview() {
        alignmentView.alignAndFill(on: .top, relativeTo: view2, withGravity: .center)
        XCTAssert(alignmentView.minY == 0)
        XCTAssert(alignmentView.maxY == view2.minY)
    }
    
    func testAlignAndFillBottomToSuperview() {
        alignmentView.alignAndFill(on: .bottom, relativeTo: view1, withGravity: .center)
        XCTAssert(alignmentView.minY == view1.maxY)
        XCTAssert(alignmentView.maxY == rootView.maxY)
    }
}
