//
//  AnchorFillViewController.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

class AnchorFillViewController: UIViewController {
    
    lazy var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var centerAlignedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(centerView)
        self.centerView.addSubview(topView)
        self.centerView.addSubview(centerAlignedView)
        self.centerView.addSubview(bottomView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerView.anchor(toParentEdge: .centerParent, width: 200, height: 200)
        topView.anchor(toParentEdge: .top, width: .superView, height: 20)
        bottomView.anchor(toParentEdge: .bottom, width: .superView, height: 20)
        centerAlignedView.alignAndFill(on: .bottomOffset(5),
                                     relativeTo: topView,
                                     withGravity: .center,
                                     stretchTo: bottomView,
                                     trailingPadding: 5,
                                     size: 20)
    }
}
