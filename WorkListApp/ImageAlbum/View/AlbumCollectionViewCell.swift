//
//  AlbumCollectionViewCell.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit


class AlbumCollectionViewCell: UICollectionViewCell {

    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
        imageView.layer.cornerRadius = 15
      
    }
        
}
