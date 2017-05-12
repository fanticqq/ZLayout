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

public enum ZLayoutGravity {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    case center(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutGravity = .left(padding: 0)
    public static let zeroRight: ZLayoutGravity = .right(padding: 0)
    public static let zeroTop: ZLayoutGravity = .top(padding: 0)
    public static let zeroBottom: ZLayoutGravity = .bottom(padding: 0)
    public static let zeroCenter: ZLayoutGravity = .center(padding: 0)
}

public enum ZLayoutAlignment {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    case equalsLeft(padding: CGFloat)
    case equalsRight(padding: CGFloat)
    case equalsBottom(padding: CGFloat)
    case equalsTop(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutAlignment = left(padding: 0)
    public static let zeroRight: ZLayoutAlignment = right(padding: 0)
    public static let zeroTop: ZLayoutAlignment = top(padding: 0)
    public static let zeroBottom: ZLayoutAlignment = bottom(padding: 0)
    public static let zeroEqualsLeft: ZLayoutAlignment = equalsLeft(padding: 0)
    public static let zeroEqualsRight: ZLayoutAlignment = equalsRight(padding: 0)
    public static let zeroEqualsBottom: ZLayoutAlignment = equalsBottom(padding: 0)
    public static let zeroEqualsTop: ZLayoutAlignment = equalsTop(padding: 0)
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
