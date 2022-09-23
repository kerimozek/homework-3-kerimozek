//
//  DetailViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    private var viewModel = DetailsViewModel()
    var detailsItem: WorkEntity?
    var index: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        textView.isEditable = false
        textLabel.layer.cornerRadius = 10
        textLabel?.layer.masksToBounds = true
        textView.layer.cornerRadius = 10
        textLabel.text = detailsItem?.title
        textView.text = detailsItem?.detail
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        viewModel.didDataUpdate(index: index!)
        navigationController?.popViewController(animated: true)
    }
    
}
