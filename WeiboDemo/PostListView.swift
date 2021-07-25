//
//  PostListView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/24.
//

import SwiftUI

struct PostListView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none         //去除tableview自动效果，避免拖动点击变灰
    }
    
    var body: some View {
        
        //遍历添加，一个个加入的方式才好设置距离
        List{
            ForEach(postList.list){post in
                ZStack{
                    PostCell(post: post)
                    NavigationLink (destination: PostDetailView(post: post)){
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())        //调整view的四边边距
            }
        }
        
        /*直接生成的方法    listROwInsets会失效
         List(postList.list, id: \.id){ post in
         PostCell(post: post)
         
         }
         */
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView()
                .navigationBarTitle("GnaixEuyStudy Demo")
                .navigationBarHidden(false)
        }
        
    }
}
