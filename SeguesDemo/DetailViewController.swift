//
//  DetailViewController.swift
//  SeguesDemo
//
//  Created by Felipe Marino on 2/21/17.
//  Copyright © 2017 Felipe Marino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var sourceViewCellTextLabel: UILabel!
    
    var sourceViewCellText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sourceViewCellTextLabel.text = sourceViewCellText
    }

    // MARK: - Segue and unwind segue
    @IBAction func unwindSegueFromDetailDetail(_ sender: UIStoryboardSegue) {}
    
}
