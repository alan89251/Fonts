//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by bee on 6/11/2022.
//

import UIKit

class FontSizesViewController: UITableViewController {
    var font: UIFont!
    private static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    private static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FontSizesViewController.cellIdentifier,
            for: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text =
            "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
}
