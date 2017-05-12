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
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var bottomCenterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var bottomRightView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerView.anchorToCenterInParent(width: 100, height: 100)

        leftTopView.align(to: .left(padding: 20),
                          ofLayout: centerView,
                          gravity: .zeroTop,
                          width: 80,
                          height: 30)
        leftCenterView.align(to: .left(padding: 20),
                             ofLayout: centerView,
                             gravity: .zeroCenter,
                             width: 80,
                             height: 30)
        leftBottomView.align(to: .left(padding: 20),
                             ofLayout: centerView,
                             gravity: .zeroBottom,
                             width: 80,
                             height: 30)

        rightTopView.align(to: .right(padding: 20),
                           ofLayout: centerView,
                           gravity: .zeroTop,
                           width: 80,
                           height: 30)
        rightCenterView.align(to: .right(padding: 20),
                              ofLayout: centerView,
                              gravity: .zeroCenter,
                              width: 80,
                              height: 30)
        rightBottomView.align(to: .right(padding: 20),
                              ofLayout: centerView,
                              gravity: .zeroBottom,
                              width: 80,
                              height: 30)
    }
}
