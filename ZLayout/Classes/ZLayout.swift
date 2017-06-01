//
//  ZLayout.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

public enum ZLayoutGravity {
    case leftOffset(CGFloat)
    case rightOffset(CGFloat)
    case topOffset(CGFloat)
    case bottomOffset(CGFloat)
    case centerOffset(CGFloat)

    public static let left: ZLayoutGravity = .leftOffset(0)
    public static let right: ZLayoutGravity = .rightOffset(0)
    public static let top: ZLayoutGravity = .topOffset(0)
    public static let bottom: ZLayoutGravity = .bottomOffset(0)
    public static let center: ZLayoutGravity = .centerOffset(0)
}

public enum ZLayoutEdge {

    case left
    case right
    case top
    case bottom
    case centerParent
    case all
}

public enum ZLayoutAlignment {
    case leftOffset(CGFloat)
    case rightOffset(CGFloat)
    case topOffset(CGFloat)
    case bottomOffset(CGFloat)
    
    public static let left: ZLayoutAlignment = leftOffset(0)
    public static let right: ZLayoutAlignment = rightOffset(0)
    public static let top: ZLayoutAlignment = topOffset(0)
    public static let bottom: ZLayoutAlignment = bottomOffset(0)
}

public enum ZLayoutSizeParameter: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    case value(CGFloat)
    case auto
    case superView
    
    public init(floatLiteral value: Float) {
        self = .value(CGFloat(value))
    }
    
    public init(integerLiteral value: Int) {
        self = .value(CGFloat(value))
    }
}
