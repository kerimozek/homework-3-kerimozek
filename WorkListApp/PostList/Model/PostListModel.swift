//
//  PostListModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation

// Protocol for PostListModel
protocol PostListModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}


class PostListModel {
    
    // Defining Constants and Variables
    weak var delegate: PostListModelProtocol?
    var posts: [Post] = []
    
    // Function for Fetching Data from API
    func fetchData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
            delegate?.didDataFetchProcessFinish(false)
            return }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
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
            // Decoding Data
            do {
                let jsonDecoder = JSONDecoder()
                self.posts = try jsonDecoder.decode([Post].self, from: data)
                self.delegate?.didDataFetchProcessFinish(true)
            } catch {
                self.delegate?.didDataFetchProcessFinish(false)
            }
        }
        
        task.resume()
    }
}
