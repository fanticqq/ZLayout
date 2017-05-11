//
//  ZLayoutPlaceable.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

public protocol ZLayoutPlaceable: ZLayoutable {
}

extension ZLayoutPlaceable {
    
    public mutating func center(to layout: ZLayoutable, offset: CGFloat = 0) {
        let targetX: CGFloat = layout.centerX - width / 2 + offset
        let targetY: CGFloat = layout.centerY - height / 2 + offset
        self.frame.origin = CGPoint(x: targetX, y: targetY)
    }
    
    public mutating func left(to layout: ZLayoutable, offset: CGFloat = 0) {
        self.frame.origin.x = layout.left + offset
    }
    
    public mutating func right(to layout: ZLayoutable, offset: CGFloat = 0) {
        self.frame.origin.x = layout.right - self.frame.width + offset
    }
    
    public mutating func top(to layout: ZLayoutable, offset: CGFloat = 0) {
        self.frame.origin.y = layout.top + offset
    }
    
    public mutating func bottom(to layout: ZLayoutable, offset: CGFloat = 0) {
        self.frame.origin.y = layout.bottom - self.frame.height + offset
    }
}
