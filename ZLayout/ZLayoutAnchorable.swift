//
//  ZLayoutAnchorable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

public enum ZLayoutEdge {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutEdge = .left(padding: 0)
    public static let zeroRight: ZLayoutEdge = .right(padding: 0)
    public static let zeroTop: ZLayoutEdge = .top(padding: 0)
    public static let zeroBottom: ZLayoutEdge = .bottom(padding: 0)
}

public enum ZLayoutCorner {
    case left(padding: CGFloat)
    case right(padding: CGFloat)
    case top(padding: CGFloat)
    case bottom(padding: CGFloat)
    case center(padding: CGFloat)
    
    public static let zeroLeft: ZLayoutCorner = .left(padding: 0)
    public static let zeroRight: ZLayoutCorner = .right(padding: 0)
    public static let zeroTop: ZLayoutCorner = .top(padding: 0)
    public static let zeroBottom: ZLayoutCorner = .bottom(padding: 0)
    public static let zeroCenter: ZLayoutCorner = .center(padding: 0)
}

public protocol ZLayoutAnchorable: ZLayoutable {
    
}

extension ZLayoutAnchorable {
    
    public mutating func anchorAndFill(edge: ZLayoutEdge, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        
    }
    
    public mutating func fillSuperview(padding: UIEdgeInsets = UIEdgeInsets.zero) {
        frame.size = CGSize(width: parentFrame.width - padding.left - padding.right,
                            height: parentFrame.height - padding.top - padding.bottom)
        frame.origin = CGPoint(x: padding.top, y: padding.left)
    }
    
    public mutating func anchorInCenter(padding: CGPoint = CGPoint.zero,
                                        width: CGFloat? = nil,
                                        height: CGFloat? = nil) {
        if let width = width {
            frame.size.width = width
        }
        if let height = height {
            frame.size.height = height
        }
        let targetX: CGFloat = parentFrame.width / 2 - frame.width / 2 + padding.x
        let targetY: CGFloat = parentFrame.height / 2 - frame.height / 2 + padding.y
        frame.origin = CGPoint(x: targetX, y: targetY)
    }
    
    public mutating func anchorTo(edge: ZLayoutEdge,
                                  corner: ZLayoutCorner,
                                  width: CGFloat? = nil,
                                  height: CGFloat? = nil) {
        if let width = width {
            frame.size.width = width
        }
        if let height = height {
            frame.size.height = height
        }
        switch edge {
        case .left(let padding):
            frame.origin.x = padding
            anchorVerticalCorner(corner)
        case .right(let padding):
            frame.origin.x = parentFrame.width - self.width - padding
            anchorVerticalCorner(corner)
        case .top(let padding):
            frame.origin.y = padding
            anchorHorizontalCorner(corner)
        case .bottom(let padding):
            frame.origin.y = parentFrame.height - self.height - padding
            anchorHorizontalCorner(corner)
        }
    }
    
    private mutating func anchorHorizontalCorner(_ corner: ZLayoutCorner) {
        switch corner {
        case .left(let padding):
            frame.origin.x = padding
        case .right(let padding):
            frame.origin.x = parentFrame.width - width - padding
        case .center(let padding):
            frame.origin.x = parentFrame.width / 2 - width / 2 + padding
        default:
            break
        }
    }
    
    private mutating func anchorVerticalCorner(_ corner: ZLayoutCorner) {
        switch corner {
        case .top(let padding):
            frame.origin.y = padding
        case .bottom(let padding):
            frame.origin.y = parentFrame.height - height - padding
        case .center(let padding):
            frame.origin.y = parentFrame.height / 2 - height / 2 + padding
        default:
            break
        }
    }
}
