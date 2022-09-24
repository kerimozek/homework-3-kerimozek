//
//  InfoViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    //  Defining Constants and Vairables
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    private var viewModel = InfoViewModel()
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // Save Button Action
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        guard textField.text != "" && textView.text != "" else {
            
            return
        }
        viewModel.didSaveClicked(title: textField.text!, detail: textView.text!)
        navigationController?.popViewController(animated: true)
        
    }
    
}

