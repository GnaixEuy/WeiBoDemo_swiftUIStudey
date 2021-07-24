//
//  Post.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/23.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable{
    let id: Int
    let avatar: String  //头像，图片名称
    let vip: Bool //是否vip
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}


//解析 weibo 的 json 为上放Data Model

/*test*/
let postList = loadPostListData("PostListData_recommend_1.json")

func loadPostListData(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can not find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load \(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data")
    }
    return list
}
