//
//  PostListViewModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation


protocol PostListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class PostListViewModel {
    
    weak var viewDelegate: PostListViewModelViewProtocol?
    private let model = PostListModel()
    
    
    init() {
        model.delegate = self
    }
    
  func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int){
      
    }
}

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
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
        

    }
}
