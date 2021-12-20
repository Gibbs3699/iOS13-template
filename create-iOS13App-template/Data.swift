//
//  Data.swift
//  create-iOS13App-template
//
//  Created by admin on 18/12/2564 BE.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    func getPost(completion: @escaping([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try! JSONDecoder().decode([Post].self, from : data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            print(posts)
        }
        // for url sesstion call
        .resume()
    }
}
