//
//  PostListViewModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation

// Protocol for PostListViewModel
protocol PostListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
}

class PostListViewModel {
    
    //  Defining Constants and Vairables
    weak var viewDelegate: PostListViewModelViewProtocol?
    private let model = PostListModel()
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
}

// MARK: - EXTENSIONS - //
private extension PostListViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] {
        return posts.map { .init(title: $0.title, desc: $0.body) }
    }
    
}


// MARK: - PostListModelProtocol

extension PostListViewModel: PostListModelProtocol {
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
        } else {
            print("error")
        }
    }
}
