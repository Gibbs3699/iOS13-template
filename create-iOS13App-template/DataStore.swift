//
//  DataStore.swift
//  create-iOS13App-template
//
//  Created by admin on 20/12/2564 BE.
//

import SwiftUI

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init(){
        getPost()
    }
    
    func getPost() {
        Api().getPost { (posts) in
            self.posts = posts
        }
    }
}
