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

//Data Model
//Identifiable 协议自动处理 id  协议类似接口
struct Post: Codable, Identifiable{
    let id: Int
    let avatar: String  //头像，图片名称
    let vip: Bool //是否vip
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    var commentCount: Int           //评论数量
    var likeCount: Int             //点赞数量
    var isLiked: Bool               //是否关注
    
    
}

extension Post {
    //借助只读属性直接渲染头像
    var avatarImage: Image{
        return loadImage(name: self.avatar)
    }
    
    //品论数文字 无法给这个属性赋值 ， 只读属性（计算属性 Calculated propertie）
    var commentCountText: String{
        if commentCount <= 0 {return "评论"}
        if commentCount < 1000 {return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount / 1000))
    }
    
    //点赞数文字
    var likeCountText: String {
        if likeCount <= 0 {return "点赞"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fk", Double(likeCount / 1000))
    }
}


//解析 weibo 的 json 为上放Data Model

/*test*/
let postList = loadPostListData("PostListData_recommend_1.json")

//从文件解析json
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

// 封装获取img
func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
