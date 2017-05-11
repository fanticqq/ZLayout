//
//  FillViewController.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

class FillViewController: UIViewController {
    
    
    lazy var childView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(childView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        childView.fillSuperview(padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
}
