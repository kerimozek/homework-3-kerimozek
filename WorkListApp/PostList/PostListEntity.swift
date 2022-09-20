//
//  PostListEntity.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation


struct PostCellViewModel {
    
    var title: String?
    var desc: String?
}


struct Post: Decodable {
    
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
