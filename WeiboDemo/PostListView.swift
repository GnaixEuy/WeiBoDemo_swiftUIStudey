//
//  PostListView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/24.
//

import SwiftUI

struct PostListView: View {
    let category: PostListCategory
    
    //利用枚举来设定加载的数据源
    var postList: PostList{
        switch category {
            case .recommend:
                return loadPostListData("PostListData_recommend_1.json")
            case .hot:
                return loadPostListData("PostListData_hot_1.json")
        }
    }
    
    var body: some View {
        
        //遍历添加，一个个加入的方式才好设置距离
        List{
            ForEach(self.postList.list){post in
                ZStack{
                    PostCell(post: post)
                        
                      //跳转详细页面
                    NavigationLink (destination: PostDetailView(post: post)){
                        EmptyView()
                    }
                    .hidden()
                    .listRowInsets(EdgeInsets())        //调整view的四边边距
                    
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
            PostListView(category: .hot)
//                .navigationBarTitle("GnaixEuyStudy Demo")
//                .navigationBarHidden(false)
        }
        
        
        
    }
}
