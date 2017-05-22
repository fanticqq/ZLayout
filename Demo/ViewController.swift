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
        let view = UILabel()
        view.text = "Example text"
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
        leftView.anchorToParent(edge: .leftOffset(20), gravity: .center, width: 50, height: 50)
        rightView.anchorToParent(edge: .rightOffset(20), gravity: .center, width: 80, height: 80)
        topView.anchorToParent(edge: .topOffset(50), gravity: .center, width: 110, height: 110)
        bottomView.anchorToParent(edge: .bottomOffset(20), gravity: .center, width: 90, height: 90)
        centerView.anchorToCenterInParent(width: .auto, height: .auto)
    }
}

