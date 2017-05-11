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
    
    var left: CGFloat { get }
    var right: CGFloat { get }
    var top: CGFloat { get }
    var bottom: CGFloat { get }
    var center: CGPoint { get }
    var centerX: CGFloat { get }
    var centerY: CGFloat { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
}

extension ZLayoutable {
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var center: CGPoint {
        return CGPoint(x: centerX, y: centerY)
    }
    
    public var centerX: CGFloat {
        return left + width / 2
    }
    public var centerY: CGFloat {
        return top + height / 2
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var width: CGFloat {
        return frame.width
    }
    
    public var height: CGFloat {
        return frame.height
    }
}
