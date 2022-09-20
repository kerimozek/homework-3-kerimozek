//
//  DetailViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    private func setupUI() {
        textView.isEditable = false
    }
    
  
    @IBAction func doneButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func notDoneClicked(_ sender: Any) {
        
    }
    
}
