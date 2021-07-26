//
//  HomeView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/26.
//

import SwiftUI

private let ScreenWidth: CGFloat = UIScreen.main.bounds.width

struct HomeView: View {
    
    //父view设定会继承到子view中去，没有特殊设定的话
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none         //去除tableview自动效果，避免拖动点击变灰
    }
    
    
    var body: some View {
        NavigationView{
            //ScrollView 可以滚动内部view 缺省类型填滚动方向。  showsIndicators：是否显示提示logo
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0){
                    PostListView(category: .recommend)
                        .frame(width: ScreenWidth)
                    PostListView(category: .hot)
                        .frame(width: ScreenWidth)
                }
            }
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("首页")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
