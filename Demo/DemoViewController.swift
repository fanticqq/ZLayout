//
//  DemoViewController.swift
//  ZLayout
//
//  Created by Igor Zarubin on 11/05/2017.
//  Copyright © 2017 Igor Zarubin. All rights reserved.
//

import UIKit

enum ZLayoutExample: String {
    case anchors = "anchors"
    case fill = "fill"
    case anchorsFill = "anchors_fill"
    
    static let allValues: [ZLayoutExample] = [.anchors, .fill, .anchorsFill]
    
    var text: String {
        switch self {
        case .anchors:
            return "Anchors"
        case .fill:
            return "Fill superview"
        case .anchorsFill:
            return "Anchors Fill"
        }
    }
}

class DemoViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = ZLayoutExample.allValues[indexPath.row].text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZLayoutExample.allValues.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ZLayoutExample.allValues[indexPath.row].rawValue, sender: nil)
    }
}
