//
//  AlignViewController.swift
//  ZLayout
//
//  Created by Igor Zarubin on 12/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit
import ZLayout

class AlignViewController: UIViewController {
    
    lazy var leftTopView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var leftCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var leftBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var rightTopView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var rightBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var rightCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    lazy var topCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var topLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var topRightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    lazy var bottomLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    lazy var bottomCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    lazy var bottomRightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    lazy var centerView: UIView = {
        let view = UILabel()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(leftTopView)
        self.view.addSubview(leftBottomView)
        self.view.addSubview(leftCenterView)
        
        self.view.addSubview(rightTopView)
        self.view.addSubview(rightBottomView)
        self.view.addSubview(rightCenterView)
        self.view.addSubview(centerView)
        
        self.view.addSubview(topLeftView)
        self.view.addSubview(topRightView)
        self.view.addSubview(topCenterView)
        
        self.view.addSubview(bottomLeftView)
        self.view.addSubview(bottomRightView)
        self.view.addSubview(bottomCenterView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerView.anchor(toParentEdge: .centerParent, width: 100, height: 100)

        leftTopView.align(on: .leftOffset(20),
                          relativeTo: centerView,
                          withGravity: .top,
                          width: 80,
                          height: 30)
        leftCenterView.align(on: .leftOffset(20),
                             relativeTo: centerView,
                             withGravity: .center,
                             width: 80,
                             height: 30)
        leftBottomView.align(on: .leftOffset(20),
                             relativeTo: centerView,
                             withGravity: .bottom,
                             width: 80,
                             height: 30)

        rightTopView.align(on: .rightOffset(20),
                           relativeTo: centerView,
                           withGravity: .top,
                           width: 80,
                           height: 30)
        rightCenterView.align(on: .rightOffset(20),
                              relativeTo: centerView,
                              withGravity: .center,
                              width: 80,
                              height: 30)
        rightBottomView.align(on: .rightOffset(20),
                              relativeTo: centerView,
                              withGravity: .bottom,
                              width: 80,
                              height: 30)
        
        topLeftView.align(on: .topOffset(20),
                          relativeTo: centerView,
                          withGravity: .left,
                          width: 30,
                          height: 80)
        topRightView.align(on: .topOffset(20),
                           relativeTo: centerView,
                           withGravity: .right,
                           width: 30,
                           height: 80)
        topCenterView.align(on: .topOffset(20),
                            relativeTo: centerView,
                            withGravity: .center,
                            width: 30,
                            height: 80)
        
        bottomLeftView.align(on: .bottomOffset(20),
                             relativeTo: centerView,
                             withGravity: .left,
                             width: 30,
                             height: 80)
        bottomRightView.align(on: .bottomOffset(20),
                              relativeTo: centerView,
                              withGravity: .right,
                              width: 30,
                              height: 80)
        bottomCenterView.align(on: .bottomOffset(20),
                               relativeTo: centerView,
                               withGravity: .center,
                               width: 30,
                               height: 80)
    }
}
