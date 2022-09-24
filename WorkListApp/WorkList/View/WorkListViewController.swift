//
//  WorkListViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit
import CoreData

class WorkListViewController: UIViewController {
    
    //  Defining Constants and Vairables
    @IBOutlet weak var addButtonClicked: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = WorkListViewModel()
    private var items: [WorkEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.didViewLoad()
        self.tableView.reloadData()
        
    }
    
    // Button Function to Push Navigation Controller
    @IBAction func addButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}

// MARK: - EXTENSIONS

private extension WorkListViewController {
    
    // Functions to run when ViewDidLoad is called
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        viewModel.viewDelegate = self
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "WorkListCell", bundle: nil), forCellReuseIdentifier: "WorkListCell")
    }
}


// MARK: - EXTENSIONS

// Extension for UITableViewDelegate
extension WorkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcDetails = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vcDetails.detailsItem = items[indexPath.row]
        vcDetails.index = indexPath.row
        navigationController?.pushViewController(vcDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

// Extension for UITableViewDataSource
extension WorkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkListCell") as! WorkListCell
        cell.titleLabel.text = items[indexPath.row].title
        if items[indexPath.row].isDone {
            cell.imageDone.image = UIImage.init(systemName: "checkmark.square.fill")
        } else {
            cell.imageDone.image = UIImage.init(systemName: "square")
        }
        return cell
    }
    
}


extension WorkListViewController: WorkListViewModelProtocol {
    
    // Function for Sync Thread
    func didCellItemFetch(_ items: [WorkEntity]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
