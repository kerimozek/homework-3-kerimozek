//
//  InfoViewModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 21.09.2022.
//

import Foundation


class InfoViewModel {
    
    private var model = InfoModel()
    
    // Function to Save Data
    func didSaveClicked(title: String, detail: String) {
        model.saveData(title: title, detail: detail)
    }
}
