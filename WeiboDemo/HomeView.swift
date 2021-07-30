//
//  HomeView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/26.
//

import SwiftUI

private let ScreenWidth: CGFloat = UIScreen.main.bounds.width

struct HomeView: View {
    
    @State var leftPercent: CGFloat = 0 //用于和NavigationItem的导航栏里面的判断左右属性和下面显示页的显示种类类型属性绑定。0和1 0 显示推荐 1 显示热门   一个变三者同时变
    
    //父view设定会继承到子view中去，没有特殊设定的话
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none         //去除tableview自动效果，避免拖动点击变灰
    }
    
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                HScrollViewController(pageWidth: geometry.size.width , contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height), leftPercent: self.$leftPercent){
                    HStack(spacing: 0){
                        PostListView(category: .recommend)
                            .frame(width: ScreenWidth)
                        PostListView(category: .hot)
                            .frame(width: ScreenWidth)
                    }
                }
            }
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
            //ScrollView 可以滚动内部view 缺省类型填滚动方向。  showsIndicators：是否显示提示logo 为了实现点击切换以及使用协议实现的将siwftUI包装成UIKit的方式实现
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //后面的default风格已经被改为画片的样式了 和geometreader直接使用会出尺寸bug
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
