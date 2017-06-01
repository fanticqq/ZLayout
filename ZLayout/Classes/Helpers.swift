//
// Created by Igor Zarubin on 31/05/2017.
// Copyright (c) 2017 Igor Zarubin. All rights reserved.
//

import UIKit

extension CGRect {

    internal func insets(_ insets: UIEdgeInsets) -> CGRect {
        var rect = self
        rect.size.width -= (insets.left + insets.right)
        rect.size.height -= (insets.top + insets.bottom)
        rect.origin.x += insets.left
        rect.origin.y += insets.top
        return rect
    }
}
