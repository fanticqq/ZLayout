//
//  ZLayoutAnchorable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
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

public protocol ZLayoutAnchorable: ZLayoutable {
    
}

extension ZLayoutAnchorable {
    
    public mutating func anchorAndFill(edge: ZLayoutAnchorEdge,
                                       size: CGFloat,
                                       insets: UIEdgeInsets = UIEdgeInsets.zero) {
        anchorAndFillSize(edge: edge, size: size, insets: insets)
        frame.origin.x = insets.left
        frame.origin.y = insets.top
        switch edge {
        case .left:
            break
        case .right:
            frame.origin.x = parentFrame.width - self.width - insets.right
        case .top:
            break
        case .bottom:
            frame.origin.y = parentFrame.height - self.height - insets.bottom
        }
    }
    
    public mutating func fillSuperview(padding: UIEdgeInsets = UIEdgeInsets.zero) {
        frame.size = CGSize(width: parentFrame.width - padding.left - padding.right,
                            height: parentFrame.height - padding.top - padding.bottom)
        frame.origin = CGPoint(x: padding.top, y: padding.left)
    }
    
    public mutating func anchorInCenter(padding: CGPoint = CGPoint.zero,
                                        width: CGFloat? = nil,
                                        height: CGFloat? = nil) {
        setSize(width: width, height: height)
        let targetX: CGFloat = parentFrame.width / 2 - frame.width / 2 + padding.x
        let targetY: CGFloat = parentFrame.height / 2 - frame.height / 2 + padding.y
        frame.origin = CGPoint(x: targetX, y: targetY)
    }
    
    public mutating func anchorTo(edge: ZLayoutAnchorEdge,
                                  gravity: ZLayoutAnchorGravity,
                                  width: CGFloat? = nil,
                                  height: CGFloat? = nil) {
        setSize(width: width, height: height)
        switch edge {
        case .left(let padding):
            frame.origin.x = padding
            anchorVertical(gravity)
        case .right(let padding):
            frame.origin.x = parentFrame.width - self.width - padding
            anchorVertical(gravity)
        case .top(let padding):
            frame.origin.y = padding
            anchorHorizontal(gravity)
        case .bottom(let padding):
            frame.origin.y = parentFrame.height - self.height - padding
            anchorHorizontal(gravity)
        }
    }
}

private extension ZLayoutAnchorable {
    
    mutating func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        if let width = width {
            if width == kZLayoutableAutoSize {
                measure()
                setSize(width: self.width, height: height)
            } else {
                frame.size.width = width
            }
        }
        if let height = height {
            if height == kZLayoutableAutoSize {
                measure()
                setSize(width: width, height: self.height)
            } else {
                frame.size.height = height
            }
        }
    }
    
    mutating func anchorAndFillSize(edge: ZLayoutAnchorEdge, size: CGFloat, insets: UIEdgeInsets) {
        switch edge {
        case .left:
            fallthrough
        case .right:
            frame.size = CGSize(width: size - insets.left - insets.right,
                                height: parentFrame.height - insets.top - insets.bottom)
        case .top:
            fallthrough
        case .bottom:
            frame.size = CGSize(width: parentFrame.width - insets.left - insets.right,
                                height: size - insets.top - insets.bottom)
        }
    }
    
    mutating func anchorHorizontal(_ gravity: ZLayoutAnchorGravity) {
        switch gravity {
        case .left(let padding):
            frame.origin.x = padding
        case .right(let padding):
            frame.origin.x = parentFrame.width - width - padding
        case .center(let padding):
            frame.origin.x = parentFrame.width / 2 - width / 2 + padding
        default:
            fatalError("Invalid kind of gravity for horizontal anchor")
        }
    }
    
    mutating func anchorVertical(_ gravity: ZLayoutAnchorGravity) {
        switch gravity {
        case .top(let padding):
            frame.origin.y = padding
        case .bottom(let padding):
            frame.origin.y = parentFrame.height - height - padding
        case .center(let padding):
            frame.origin.y = parentFrame.height / 2 - height / 2 + padding
        default:
            fatalError("Invalid kind of gravity for vertical anchor")
        }
    }
}
