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
        leftView.anchorAndFillParent(edge: .zeroLeft,
                                     size: 100,
                                     insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        rightView.anchorAndFillParent(edge: .zeroRight,
                                      size: 100,
                                      insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        rightAlignView.alignAndFill(to: .right(padding: 10),
                                    ofLayout: leftView,
                                    gravity: .zeroTop,
                                    padding: 10,
                                    toLayout: rightView,
                                    size: 100)
        leftAlignView.alignAndFill(to: .left(padding: 10),
                                   ofLayout: rightView,
                                   gravity: .zeroBottom,
                                   padding: 10,
                                   toLayout: leftView,
                                   size: 100)
        topAlignView.alignAndFill(to: .top(padding: 10),
                                  ofLayout: leftAlignView,
                                  gravity: .zeroRight,
                                  padding: 10,
                                  toLayout: rightAlignView,
                                  size: .value(rightAlignView.width / 2 - 5))
        bottomAlignView.alignAndFill(to: .bottom(padding: 10),
                                     ofLayout: rightAlignView,
                                     gravity: .zeroLeft,
                                     padding: 10,
                                     toLayout: leftAlignView,
                                     size: .value(rightAlignView.width / 2 - 5))
    }
}
