//
//  ViewController.swift
//  Demo
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit
import ZLayout

class ViewController: UIViewController {
    
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
        view.backgroundColor = UIColor.darkGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        self.view.addSubview(centerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftView.anchorTo(edge: .left(padding: 20), corner: .zeroCenter, width: 50, height: 50)
        rightView.anchorTo(edge: .right(padding: 20), corner: .zeroCenter, width: 80, height: 80)
        topView.anchorTo(edge: .top(padding: 50), corner: .zeroCenter, width: 110, height: 110)
        bottomView.anchorTo(edge: .bottom(padding: 20), corner: .zeroCenter, width: 90, height: 90)
        centerView.anchorTo(edge: .zeroCenter, corner: .zeroTop, width: 180, height: 180)
    }
}

