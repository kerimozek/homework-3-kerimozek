//
//  AlbumViewModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation

protocol AlbumViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PhotoCellViewModel])
}

class AlbumViewModel {
    
    weak var viewDelegate: AlbumViewModelViewProtocol?
    private let model = AlbumModel()
    
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int){
        
    }
    
    
}

private extension AlbumViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photo]) -> [PhotoCellViewModel] {
        return photos.map { .init(image: $0.url) }
    }
    
}


// MARK: - PostListModelProtocol

extension AlbumViewModel: AlbumModelProtocol {
    
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let photos = model.photos
            let filtered = photos.filter { Photo in Photo.id < 101 }
            let cellModels = makeViewBasedModel(filtered)
            viewDelegate?.didCellItemFetch(cellModels)
        } else {
        }
    }
}
