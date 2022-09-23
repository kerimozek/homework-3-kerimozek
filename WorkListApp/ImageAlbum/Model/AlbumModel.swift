//
//  AlbumModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation

protocol AlbumModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}


class AlbumModel {
    
    weak var delegate: AlbumModelProtocol?
    
    var photos: [Photo] = []
    
    func fetchData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            delegate?.didDataFetchProcessFinish(false)
            return }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else {
                return }
            
            
            guard error == nil else {
                self.delegate?.didDataFetchProcessFinish(false)
                
                return
            }
            
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            guard
                statusCode >= 200,
                statusCode < 300
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                
                return
            }
            
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinish(false)
                
                return
                
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                
                self.photos = try jsonDecoder.decode([Photo].self, from: data)
                
                self.delegate?.didDataFetchProcessFinish(true)
                
            } catch {
                print(error.localizedDescription)
                self.delegate?.didDataFetchProcessFinish(false)
            }
        }
        
        task.resume()
    }
}
