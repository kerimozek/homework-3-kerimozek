//
//  WorkListCell.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 20.09.2022.
//

import UIKit

class WorkListCell: UITableViewCell {
    
    // Defining Constants and Variables
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDone: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        containerView.layer.cornerRadius = 5
    }
    
}
