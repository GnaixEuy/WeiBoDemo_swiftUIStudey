//
//  PostDetailView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/25.
//

import SwiftUI

struct PostDetailView: View {
    
    let post: Post
    
    var body: some View {
        List{
            PostCell(post: post)
                .listRowInsets(EdgeInsets())    //调整边框
            
            ForEach(1...10,id: \.self){ i in
                Text("评论\(i)")
            }
        }
        .navigationBarTitle("\(post.name)的微博")
        //swiftUI的导航标题分为两种形式，inline -> 小型居中   large-> 大型居左 标题形式
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
