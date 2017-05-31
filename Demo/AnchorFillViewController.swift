//
//  AnchorFillViewController.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

class AnchorFillViewController: UIViewController {
    
    lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var topAlignView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var bottomAlignView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var leftAlignView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        return view
    }()
    
    lazy var rightAlignView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(topAlignView)
        self.view.addSubview(bottomAlignView)
        self.view.addSubview(rightAlignView)
        self.view.addSubview(leftAlignView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftView.anchor(toParentEdge: .left, width: 100, height: .superView, inset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        rightView.anchor(toParentEdge: .right, width: 100, height: .superView, inset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        rightAlignView.alignAndFill(on: .rightOffset(10),
                                    relativeTo: leftView,
                                    withGravity: .top,
                                    stretchTo: rightView,
                                    trailingPadding: 10,
                                    size: 100)
        leftAlignView.alignAndFill(on: .leftOffset(10),
                                   relativeTo: rightView,
                                   withGravity: .bottom,
                                   stretchTo: leftView,
                                   trailingPadding: 10,
                                   size: 100)
        topAlignView.alignAndFill(on: .topOffset(10),
                                  relativeTo: leftAlignView,
                                  withGravity: .right,
                                  stretchTo: rightAlignView,
                                  trailingPadding: 10,
                                  size: .value(rightAlignView.width / 2 - 5))
        bottomAlignView.alignAndFill(on: .bottomOffset(10),
                                     relativeTo: rightAlignView,
                                     withGravity: .left,
                                     stretchTo: leftAlignView,
                                     trailingPadding: 10,
                                     size: .value(rightAlignView.width / 2 - 5))
    }
}
