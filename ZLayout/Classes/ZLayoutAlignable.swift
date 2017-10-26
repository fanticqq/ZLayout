//
//  ZLayoutPlaceable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

public protocol ZLayoutAlignable: ZLayoutable {
}

extension ZLayoutAlignable {
    
    public func align(on alignment: ZLayoutAlignment,
                      relativeTo layout: ZLayoutable,
                      withGravity gravity: ZLayoutGravity,
                      width: ZLayoutSizeParameter? = nil,
                      height: ZLayoutSizeParameter? = nil) {
        setSize(width: width, height: height)
        switch alignment {
        case .leftOffset(let padding):
            frame.origin.x = layout.minX - frame.width - padding
            alignVertical(gravity, layout: layout)
        case .rightOffset(let padding):
            frame.origin.x = layout.maxX + padding
            alignVertical(gravity, layout: layout)
        case .topOffset(let padding):
            frame.origin.y = layout.minY - frame.height - padding
            alignHorizontal(gravity, layout: layout)
        case .bottomOffset(let padding):
            frame.origin.y = layout.maxY + padding
            alignHorizontal(gravity, layout: layout)
        }
    }
    
    public func alignAndFill(on alignment: ZLayoutAlignment,
                             relativeTo layout: ZLayoutable,
                             withGravity gravity: ZLayoutGravity,
                             stretchTo edgeLayout: ZLayoutable? = nil,
                             trailingPadding: CGFloat = 0,
                             size: ZLayoutSizeParameter? = nil) {
        var width: ZLayoutSizeParameter? = nil
        var height: ZLayoutSizeParameter? = nil
        
        switch alignment {
        case .leftOffset(let paddingLeft):
            height = size
            let layoutWidth: CGFloat
            let x: CGFloat
            if let edge = edgeLayout {
                layoutWidth = layout.minX - edge.maxX
                x = edge.maxX + trailingPadding
            } else {
                layoutWidth = layout.minX
                x = trailingPadding
            }
            width = .value(layoutWidth - trailingPadding - paddingLeft)
            setSize(width: width, height: height)
            frame.origin.x = x
            alignVertical(gravity, layout: layout)
        case .rightOffset(let paddingRight):
            frame.origin.x = layout.maxX + paddingRight
            height = size
            let layoutWidth: CGFloat
            if let edge = edgeLayout {
                layoutWidth = edge.minX - frame.origin.x
            } else {
                layoutWidth = parentFrame.width - frame.origin.x
            }
            width = .value(layoutWidth - trailingPadding)
            setSize(width: width, height: height)
            alignVertical(gravity, layout: layout)
        case .bottomOffset(let paddingBottom):
            frame.origin.y = layout.maxY + paddingBottom
            width = size
            let layoutHeight: CGFloat
            if let edge = edgeLayout {
                layoutHeight = edge.minY - frame.origin.y
            } else {
                layoutHeight = parentFrame.height - frame.origin.y
            }
            height = .value(layoutHeight - trailingPadding)
            setSize(width: width, height: height)
            alignHorizontal(gravity, layout: layout)
        case .topOffset(let paddingTop):
            let layoutHeight: CGFloat
            if let edge = edgeLayout {
                layoutHeight = layout.minY - edge.maxY
            } else {
                layoutHeight = layout.minY
            }
            width = size
            height = .value(layoutHeight - trailingPadding - paddingTop)
            setSize(width: width, height: height)
            frame.origin.y = layout.minY - frame.height - trailingPadding
            alignHorizontal(gravity, layout: layout)
        }
    }
    
    public func alignToCenter(of layout: ZLayoutable,
                              width: ZLayoutSizeParameter? = nil,
                              height: ZLayoutSizeParameter? = nil,
                              offset: CGPoint = CGPoint.zero) {
        setSize(width: width, height: height)
        let targetX: CGFloat = layout.centerX - self.width / 2 + offset.x
        let targetY: CGFloat = layout.centerY - self.height / 2 + offset.y
        self.frame.origin = CGPoint(x: targetX, y: targetY)
    }
}

private extension ZLayoutAlignable {
    
    func alignVertical(_ gravity: ZLayoutGravity, layout: ZLayoutable) {
        switch gravity {
        case .topOffset(let padding):
            frame.origin.y = layout.minY + padding
        case .bottomOffset(let padding):
            frame.origin.y = layout.maxY - frame.height - padding
        case .centerOffset(let padding):
            frame.origin.y = layout.centerY - frame.height / 2 + padding
        default:
            fatalError("Unexpected kind of gravity. You should use ZLayoutGravityTop, ZLayoutGravityBottom or ZLayoutGravityCenter")
        }
    }
    
    func alignHorizontal(_ gravity: ZLayoutGravity, layout: ZLayoutable) {
        switch gravity {
        case .leftOffset(let padding):
            frame.origin.x = layout.minX + padding
        case .rightOffset(let padding):
            frame.origin.x = layout.maxX - frame.width - padding
        case .centerOffset(let padding):
            frame.origin.x = layout.centerX - frame.width / 2 + padding
        default:
            fatalError("Unexpected kind of gravity. You should use ZLayoutGravityTop, ZLayoutGravityBottom or ZLayoutGravityCenter")
        }
    }
}
