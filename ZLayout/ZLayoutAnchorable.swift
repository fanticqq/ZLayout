//
//  ZLayoutAnchorable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

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
                                        width: ZLayoutSizeParameter? = nil,
                                        height: ZLayoutSizeParameter? = nil) {
        setSize(width: width, height: height)
        let targetX: CGFloat = parentFrame.width / 2 - frame.width / 2 + padding.x
        let targetY: CGFloat = parentFrame.height / 2 - frame.height / 2 + padding.y
        frame.origin = CGPoint(x: targetX, y: targetY)
    }
    
    public mutating func anchorTo(edge: ZLayoutAnchorEdge,
                                  gravity: ZLayoutAnchorGravity,
                                  width: ZLayoutSizeParameter? = nil,
                                  height: ZLayoutSizeParameter? = nil) {
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
    
    mutating func setSize(width: ZLayoutSizeParameter? = nil, height: ZLayoutSizeParameter? = nil) {
        if let width = width {
            switch width {
            case .value(let value):
                frame.size.width = value
            case .auto:
                measure()
                setSize(width: .value(self.width), height: height)
            }
        }
        if let height = height {
            switch height {
            case .value(let value):
                frame.size.height = value
            case .auto:
                measure()
                setSize(width: width, height: .value(self.height))
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
