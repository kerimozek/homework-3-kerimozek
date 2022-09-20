//
//  InfoViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
       
//        let vc = storyboard?.instantiateViewController(withIdentifier: "WorkListViewController") as! WorkListViewController
        navigationController?.popViewController(animated: true)
    }
    
    

}
