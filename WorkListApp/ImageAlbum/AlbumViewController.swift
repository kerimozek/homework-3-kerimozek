//
//  AlbumViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit
import Kingfisher

class AlbumViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = AlbumViewModel()
    private var items: [PhotoCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        
    }
}

// ------EXTENSIONS------ //

private extension AlbumViewController {
    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
    }
    func registerCell() {
        collectionView.register(.init(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
    }
}

extension AlbumViewController: AlbumViewModelViewProtocol {
    func didCellItemFetch(_ items: [PhotoCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        cell.imageView.kf.setImage(with: URL(string: items[indexPath.row].image!))
        return cell
    }
    
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 4 , height: (collectionView.frame.height) / 7 )
        //      return CGSize(width: ((collectionView.frame.width) - 16) / 4 , height: ((collectionView.frame.height) - 16) / 7 )
    }
    
}

extension AlbumViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("success")
    }
}

