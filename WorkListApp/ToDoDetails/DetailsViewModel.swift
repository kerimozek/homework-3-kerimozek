//
//  DetailViewModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 21.09.2022.
//

import Foundation

class DetailsViewModel {
    

    private var model = DetailsModel()
    

    func didDataUpdate(index: Int) {
        model.updateData(index: index)
    }

}
