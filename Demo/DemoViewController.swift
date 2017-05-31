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
    case anchorsFill = "anchors_fill"
    case alignment = "alignment"
    case instagram = "instagram"

    static let allValues: [ZLayoutExample] = [.anchors, .alignment, .anchorsFill, .instagram]
    
    var text: String {
        switch self {
        case .anchors:
            return "Anchors"
        case .anchorsFill:
            return "Anchors and alignments filling"
        case .alignment:
            return "Alignment"
        case .instagram:
            return "What about complex example?"
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
