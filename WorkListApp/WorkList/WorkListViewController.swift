//
//  WorkListViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class WorkListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   

    
    @IBAction func addButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toInfoViewController", sender: nil)
    }
}
