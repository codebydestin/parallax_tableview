//
//  parallaxCell.swift
//  parallaxTableView
//
//  Created by AppStudio24 on 10/03/2015.
//  Copyright (c) 2015 2squared. All rights reserved.
//

import UIKit

class parallaxCell: UITableViewCell {
    @IBOutlet weak var parallaxImage: UIImageView?
    
    func tableView(tableView: UITableView, didScrollOnView view: UIView) {
        
        let rectInSuperView: CGRect = tableView.convertRect(frame, toView: view)
        let cellRadius = CGRectGetHeight(frame) * 0.5 - CGRectGetMinY(rectInSuperView)
        let diff = CGRectGetHeight(parallaxImage!.frame) - CGRectGetHeight(frame)
        let move = (cellRadius / CGRectGetHeight(view.frame)) * diff
        
        let imageRect: CGRect = CGRectMake(parallaxImage!.frame.origin.x, -(diff * 0.5) + move,
                                parallaxImage!.frame.width, parallaxImage!.frame.height)
        parallaxImage?.frame = imageRect
    }
}
