//
//  ZLayoutExtension.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

extension UIView: ZLayoutable, ZLayoutPlaceable, ZLayoutAnchorable {
    
    public var parentFrame: CGRect {
        return superview!.frame
    }
}
