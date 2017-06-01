//
//  ViewController.swift
//  Demo
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit
import ZLayout

class AnchorsViewController: UIViewController {
    
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
    
    lazy var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.centerView.addSubview(leftView)
        self.centerView.addSubview(rightView)
        self.centerView.addSubview(topView)
        self.centerView.addSubview(bottomView)
        self.view.addSubview(centerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerView.anchor(toParentEdge: .centerParent, gravity: .center, width: 200, height: 200)
        leftView.anchor(toParentEdge: .left, width: 50, height: 50, offset: CGPoint(x: 5, y: 0))
        rightView.anchor(toParentEdge: .right, width: 50, height: 50, offset: CGPoint(x: -5, y: 0))
        topView.anchor(toParentEdge: .top, width: 50, height: 50, offset: CGPoint(x: 0, y: 5))
        bottomView.anchor(toParentEdge: .bottom, width: 50, height: 50, offset: CGPoint(x: 0, y: -5))
    }
}

