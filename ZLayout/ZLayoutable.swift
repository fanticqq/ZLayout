//
//  ZLayoutFrame.swift
//  ZLayout
//
//  Created by Igor Zarubin on 10/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import Foundation

public protocol ZLayoutable {
    
    var frame: CGRect { get set }
    var parentFrame: CGRect { get }
    
    var minX: CGFloat { get }
    var maxX: CGFloat { get }
    var minY: CGFloat { get }
    var maxY: CGFloat { get }
    var center: CGPoint { get }
    var centerX: CGFloat { get }
    var centerY: CGFloat { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
    
    func measure()
}

extension ZLayoutable {
    
    public var minX: CGFloat {
        return frame.origin.x
    }
    
    public var maxX: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    public var minY: CGFloat {
        return frame.origin.y
    }
    
    public var maxY: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var center: CGPoint {
        return CGPoint(x: centerX, y: centerY)
    }
    
    public var centerX: CGFloat {
        return minX + width / 2
    }
    public var centerY: CGFloat {
        return minY + height / 2
    }
    
    public var width: CGFloat {
        return frame.width
    }
    
    public var height: CGFloat {
        return frame.height
    }
    
    internal mutating func setSize(width: ZLayoutSizeParameter?, height: ZLayoutSizeParameter?) {
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
}
