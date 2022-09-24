//
//  File.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation

// Protocol for WorkListViewModel
protocol WorkListViewModelProtocol: AnyObject {
    func didCellItemFetch(_ items: [WorkEntity])
}

class WorkListViewModel {
    
    //  Defining Constants and Vairables
    weak var viewDelegate: WorkListViewModelProtocol?
    private let model = WorkListModel()
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.getData()
    }
    
}

// MARK: - WorkListModelProtocol

extension WorkListViewModel: WorkListModelProtocol {
    func didGetDataFinish(_ isFinish: Bool) {
        if isFinish {
            let posts = model.posts
            viewDelegate?.didCellItemFetch(posts)
        } else {
            print("error")
        }
    }
}
