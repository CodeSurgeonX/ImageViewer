//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Shashwat Kashyap on 28/01/21.
//  Copyright © 2021 Shashwat Kashyap. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func configureWithImage(name: String) {
        imageView.image = NSImage(named: name)
    }
}
