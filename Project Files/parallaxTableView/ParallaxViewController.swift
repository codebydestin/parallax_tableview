//
//  ViewController.swift
//  parallaxTableView
//
//  Created by AppStudio24 on 10/03/2015.
//  Copyright (c) 2015 2squared. All rights reserved.
//

import UIKit

class ParallaxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    @IBOutlet weak var tableView: UITableView?
    
    var imageCollection: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView?.separatorColor = UIColor.clearColor()
        
        imageCollection = [UIImage(named: "cover1")!, UIImage(named: "cover2")!,
                           UIImage(named: "cover3")!, UIImage(named: "cover4")!,
                           UIImage(named: "cover5")!, UIImage(named: "cover6")!,
                           UIImage(named: "cover7")!, UIImage(named: "cover8")!,
                           UIImage(named: "cover1")!, UIImage(named: "cover2")!,
                           UIImage(named: "cover3")!, UIImage(named: "cover4")!,
                           UIImage(named: "cover5")!, UIImage(named: "cover6")!,
                           UIImage(named: "cover7")!, UIImage(named: "cover8")!]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //MARK: - UITableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCollection.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: parallaxCell = tableView.dequeueReusableCellWithIdentifier("Cell") as parallaxCell
        cell.parallaxImage?.image = imageCollection[indexPath.row]

        return cell
    }
    
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if let visibleCells = tableView!.visibleCells() as? [parallaxCell] {
            for cell in visibleCells {
                cell.tableView(tableView!, didScrollOnView: view)
            }
        }
    }
}

