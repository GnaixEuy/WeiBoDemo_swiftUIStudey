//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/24.
//

import SwiftUI

struct PostCellToolbarButton: View {
    
    let image: String
    let text: String
    let color: Color
    let action: ()-> Void           // 闭包  类似func 匿名函数
    
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing: 5){
                Image(systemName: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                Text(self.text)
                    .font(.system(size: 15))
                
            }
            .foregroundColor(self.color)
        
        })
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "测试点赞", color: Color.blue) {
            print("click the button")
        }
    }
}
