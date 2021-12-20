//
//  PostList.swift
//  create-iOS13App-template
//
//  Created by admin on 20/12/2564 BE.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.title)
        }
        .onAppear {
            Api().getPost{ (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
