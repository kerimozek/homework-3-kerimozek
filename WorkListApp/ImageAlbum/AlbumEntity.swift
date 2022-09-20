//
//  AlbumEntity.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation


struct PhotoCellViewModel {
    
    var image: String?
}


struct Photo: Decodable {
    
    var albumId : Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}


