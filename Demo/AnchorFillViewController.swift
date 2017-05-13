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
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftView.anchorAndFillParent(edge: .zeroLeft,
                               size: 100,
                               insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        rightView.anchorAndFillParent(edge: .zeroRight,
                                size: 100,
                                insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        topView.alignAndFill(to: .right(padding: 10),
                             ofLayout: leftView,
                             gravity: .zeroTop,
                             padding: 10,
                             toLayout: rightView,
                             size: 100)
        bottomView.alignAndFill(to: .left(padding: 10),
                             ofLayout: rightView,
                             gravity: .zeroBottom,
                             padding: 10,
                             toLayout: leftView,
                             size: 100)
    }
}
