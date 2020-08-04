//
//  ApiService.swift
//  MyFirstApp
//
//  Created by jorgemht on 04/08/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import Foundation
import Alamofire

class Observer : ObservableObject{
    
    @Published var post = [Post]()
    @Published var comment = [Comment]()
    @Published var commentRead = [Int]()
    private var defaults = UserDefaults.standard

    // Need Improve
    init() {
        getPost()
    }
    
    func getPost()
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        AF.request(url)
            .responseJSON { (response) in
                
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.post = posts
            }
    }
    
    func getComment(idPost: Int)
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(idPost)/comments") else {return}
        
        AF.request(url)
            .responseJSON { (response) in
                let comments = try! JSONDecoder().decode([Comment].self, from: response.data!)
                self.comment = comments
            }
    }
    
    func getPostRead()
    {
        self.commentRead = defaults.object(forKey: "CommentRead") as? [Int] ?? [Int]()
    }
}
