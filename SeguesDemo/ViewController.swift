//
//  ViewController.swift
//  SeguesDemo
//
//  Created by Felipe Marino on 2/21/17.
//  Copyright © 2017 Felipe Marino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //data displayed by the tableView
    var tableViewDataSource1stSection : [String] = ["Segue 1", "Segue 2", "Segue 3"]
    var tableViewDataSource2dSection : [String] = ["Non Segue 1"]
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    
    // MARK: - Manage Transitions/segues to next screen
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let selectedCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: selectedCell)
        
        if indexPath?.section == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tableViewCellTap" {
            let selectedCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedCell)
            let destinationViewController = segue.destination as? DetailViewController
            
            destinationViewController?.sourceViewCellText = tableViewDataSource1stSection[(indexPath?.row)!]
        }
    }
    
}

// MARK: - Table View Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row selected: \(indexPath.row)")
    }
}


// MARK: - Table View DataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Segued Content"
        }
        else {
            return "Non Segued Content"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else if section == 1 {
            return 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = tableViewDataSource1stSection[indexPath.row]
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = tableViewDataSource1stSection[indexPath.row]
        }
        
        return cell
    }
}
