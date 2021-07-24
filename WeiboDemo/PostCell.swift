//
//  PostCell.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/23.
//

import SwiftUI

struct PostCell: View {
    var post : Post
    
    
    var body: some View {
        HStack(spacing: 5){
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    PostVipBadge(isVip: post.vip)
                        .offset(x: 16, y: 16)
                )
            
            VStack(alignment: .leading, spacing: 5){
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(red: 242 / 255, green: 99 / 255, blue: 3 / 255))
                    .lineLimit(1)
                Text(post.date)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.leading,10)
            
            Spacer()
            
            if !post.isFollowed {
                Button(action: {
                    //
                }, label: {
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                        .frame(width: 50, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.orange,lineWidth: 1)
                        )
                })
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
