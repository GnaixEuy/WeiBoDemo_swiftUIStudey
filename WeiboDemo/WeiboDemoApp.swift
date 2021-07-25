//
//  WeiboDemoApp.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/23.
//

import SwiftUI

@main
struct WeiboDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                PostListView()
                    .navigationBarTitle("WeiBo_SwiftUI_StudyDemo")
                    .navigationBarHidden(false)
            }
        }
    }
}
