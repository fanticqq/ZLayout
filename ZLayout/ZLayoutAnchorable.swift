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
    
    public mutating func anchorAndFillParent(edge: ZLayoutAlignment,
                                       size: CGFloat,
                                       insets: UIEdgeInsets = UIEdgeInsets.zero) {
        anchorAndFillSize(edge: edge, size: size, insets: insets)
        frame.origin.x = insets.left
        frame.origin.y = insets.top
        switch edge {
        case .leftOffset:
            break
        case .rightOffset:
            frame.origin.x = parentFrame.width - self.width - insets.right
        case .topOffset:
            break
        case .bottomOffset:
            frame.origin.y = parentFrame.height - self.height - insets.bottom
        }
    }
    
    public mutating func fillSuperview(padding: UIEdgeInsets = UIEdgeInsets.zero) {
        frame.size = CGSize(width: parentFrame.width - padding.left - padding.right,
                            height: parentFrame.height - padding.top - padding.bottom)
        frame.origin = CGPoint(x: padding.top, y: padding.left)
    }
    
    public mutating func anchorToCenterInParent(padding: CGPoint = CGPoint.zero,
                                        width: ZLayoutSizeParameter? = nil,
                                        height: ZLayoutSizeParameter? = nil) {
        setSize(width: width, height: height)
        let targetX: CGFloat = parentFrame.width / 2 - frame.width / 2 + padding.x
        let targetY: CGFloat = parentFrame.height / 2 - frame.height / 2 + padding.y
        frame.origin = CGPoint(x: targetX, y: targetY)
    }
    
    public mutating func anchorToParent(edge: ZLayoutAlignment,
                                  gravity: ZLayoutGravity,
                                  width: ZLayoutSizeParameter? = nil,
                                  height: ZLayoutSizeParameter? = nil) {
        setSize(width: width, height: height)
        switch edge {
        case .leftOffset(let padding):
            frame.origin.x = padding
            anchorVertical(gravity)
        case .rightOffset(let padding):
            frame.origin.x = parentFrame.width - self.width - padding
            anchorVertical(gravity)
        case .topOffset(let padding):
            frame.origin.y = padding
            anchorHorizontal(gravity)
        case .bottomOffset(let padding):
            frame.origin.y = parentFrame.height - self.height - padding
            anchorHorizontal(gravity)
        }
    }
}

private extension ZLayoutAnchorable {
    
    mutating func anchorAndFillSize(edge: ZLayoutAlignment, size: CGFloat, insets: UIEdgeInsets) {
        switch edge {
        case .leftOffset:
            fallthrough
        case .rightOffset:
            frame.size = CGSize(width: size - insets.left - insets.right,
                                height: parentFrame.height - insets.top - insets.bottom)
        case .topOffset:
            fallthrough
        case .bottomOffset:
            frame.size = CGSize(width: parentFrame.width - insets.left - insets.right,
                                height: size - insets.top - insets.bottom)
        }
    }
    
    mutating func anchorHorizontal(_ gravity: ZLayoutGravity) {
        switch gravity {
        case .leftOffset(let padding):
            frame.origin.x = padding
        case .rightOffset(let padding):
            frame.origin.x = parentFrame.width - width - padding
        case .centerOffset(let padding):
            frame.origin.x = parentFrame.width / 2 - width / 2 + padding
        default:
            fatalError("Invalid kind of gravity for horizontal anchor")
        }
    }
    
    mutating func anchorVertical(_ gravity: ZLayoutGravity) {
        switch gravity {
        case .topOffset(let padding):
            frame.origin.y = padding
        case .bottomOffset(let padding):
            frame.origin.y = parentFrame.height - height - padding
        case .centerOffset(let padding):
            frame.origin.y = parentFrame.height / 2 - height / 2 + padding
        default:
            fatalError("Invalid kind of gravity for vertical anchor")
        }
    }
}
