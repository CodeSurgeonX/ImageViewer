//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Shashwat Kashyap on 28/01/21.
//  Copyright © 2021 Shashwat Kashyap. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!   
    var tableViewData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //We will scan the app bundle for the files prefixed with `PIC_`
        appendImagesIfAny()
        tableViewData.sort(by: { $0 < $1 })
    }
    
    
    func appendImagesIfAny() {
        //File manager
        let fm = FileManager.default
        //Resource path
        let path = Bundle.main.resourcePath!
        //Searching file manager for the the contents
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("PIC_") {
                //Filtering out the required contents
                tableViewData.append(item)
            }
        }
    }
}

extension SourceViewController: NSTableViewDataSource, NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        vw.textField?.stringValue = tableViewData[row]
        return vw
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1, let parent = self.parent as? NSSplitViewController, let detailsVC = parent.children[1] as? DetailViewController else { return }
        detailsVC.configureWithImage(name: tableViewData[tableView.selectedRow])
    }
}
