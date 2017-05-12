//
//  ZLayoutPlaceable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

public protocol ZLayoutAlignable: ZLayoutable {
}

extension ZLayoutAlignable {

    public mutating func align(to alignment: ZLayoutAlignment,
                               ofLayout layout: ZLayoutable,
                               gravity: ZLayoutGravity,
                               width: ZLayoutSizeParameter? = nil,
                               height: ZLayoutSizeParameter? = nil) {
        setSize(width: width, height: height)
        switch alignment {
        case .left(let padding):
            frame.origin.x = layout.minX - frame.width - padding
            alignVertical(gravity, layout: layout)
        case .right(let padding):
            frame.origin.x = layout.maxX + padding
            alignVertical(gravity, layout: layout)
        case .top:
            break
        case .bottom:
            break
        case .equalsLeft:
            break
        case .equalsRight:
            break
        case .equalsTop:
            break
        case .equalsBottom:
            break
        }
    }

    public mutating func alignToCenter(ofLayout layout: ZLayoutable, offset: CGPoint = CGPoint.zero) {
        let targetX: CGFloat = layout.centerX - width / 2 + offset.x
        let targetY: CGFloat = layout.centerY - height / 2 + offset.y
        self.frame.origin = CGPoint(x: targetX, y: targetY)
    }
}

private extension ZLayoutAlignable {

    mutating func alignVertical(_ gravity: ZLayoutGravity, layout: ZLayoutable) {
        switch gravity {
        case .top(let padding):
            frame.origin.y = layout.minY + padding
        case .bottom(let padding):
            frame.origin.y = layout.maxY - frame.height - padding
        case .center(let padding):
            frame.origin.y = layout.centerY - frame.height / 2 + padding
        default:
            fatalError("Unexpected kind of gravity. You should use ZLayoutGravityTop, ZLayoutGravityBottom or ZLayoutGravityCenter")
        }
    }

    
}
