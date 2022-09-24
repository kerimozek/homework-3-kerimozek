//
//  PostViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class PostListViewController: UIViewController {
    
    //  Defining Constants and Vairables
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
}

// MARK: - EXTENSIONS - //


// Functions to run when ViewDidLoad is called
private extension PostListViewController {
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.viewDelegate = self
        registerCell()
        viewModel.didViewLoad()
    }
    func registerCell() {
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
    }
}

// Delegate Protocol
extension PostListViewController: PostListViewModelViewProtocol {
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// Extension for UITableViewDataSource
extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
}

// Extension for UITableViewDelegate
extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
