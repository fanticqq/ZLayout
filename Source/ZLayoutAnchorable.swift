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
    
    public mutating func anchor(toParentEdge edge: ZLayoutEdge,
                                gravity: ZLayoutGravity = .center,
                                width: ZLayoutSizeParameter? = nil,
                                height: ZLayoutSizeParameter? = nil,
                                inset: UIEdgeInsets = UIEdgeInsets.zero,
                                offset: CGPoint = CGPoint.zero) {
        setSize(width: width, height: height)
        switch edge {
        case .left:
            frame.origin.x = inset.left
            anchorVertical(gravity)
        case .right:
            frame.origin.x = parentFrame.width - self.width - inset.right
            anchorVertical(gravity)
        case .top:
            frame.origin.y = inset.top
            anchorHorizontal(gravity)
        case .bottom:
            frame.origin.y = parentFrame.height - self.height - inset.bottom
            anchorHorizontal(gravity)
        case .all:
            setSize(width: .superView, height: .superView)
        case .centerParent:
            let targetX: CGFloat = (parentFrame.width - frame.width) / 2
            let targetY: CGFloat = (parentFrame.height - frame.height) / 2
            frame.origin = CGPoint(x: targetX, y: targetY)
        }
        frame = frame.insets(inset)
        frame = frame.offsetBy(dx: offset.x, dy: offset.y)
    }
}

private extension ZLayoutAnchorable {
    
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
