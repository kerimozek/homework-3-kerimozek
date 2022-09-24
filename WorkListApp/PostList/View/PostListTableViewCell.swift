//
//  PostListTableViewCell.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    //  Defining Constants and Vairables
    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    @IBOutlet private(set) weak var postDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
    }
}
