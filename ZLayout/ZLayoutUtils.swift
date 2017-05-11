//
//  ZLayoutUtils.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

public enum ZLayoutAnchorEdge {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutAnchorEdge = .left(padding: 0)
    public static let zeroRight: ZLayoutAnchorEdge = .right(padding: 0)
    public static let zeroTop: ZLayoutAnchorEdge = .top(padding: 0)
    public static let zeroBottom: ZLayoutAnchorEdge = .bottom(padding: 0)
}

public enum ZLayoutAnchorGravity {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    case center(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutAnchorGravity = .left(padding: 0)
    public static let zeroRight: ZLayoutAnchorGravity = .right(padding: 0)
    public static let zeroTop: ZLayoutAnchorGravity = .top(padding: 0)
    public static let zeroBottom: ZLayoutAnchorGravity = .bottom(padding: 0)
    public static let zeroCenter: ZLayoutAnchorGravity = .center(padding: 0)
}

public enum ZLayoutSizeParameter: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    case value(CGFloat)
    case auto
    
    public init(floatLiteral value: Float) {
        self = .value(CGFloat(value))
    }
    
    public init(integerLiteral value: Int) {
        self = .value(CGFloat(value))
    }
}
