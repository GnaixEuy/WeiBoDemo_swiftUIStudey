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
        VStack (alignment: .leading, spacing: 10) {
            HStack(spacing: 5){
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
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
                Spacer()        //空白部分，起到隔开信息的作用
                if !post.isFollowed {
                    Button(action: {
                        print("关注按钮")
                    }, label: {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange,lineWidth: 1)
                            )
                    }).buttonStyle(BorderlessButtonStyle()) //防止响应效果全屏导致点一下，全部按钮都被点击响应
                }
            }
            //文字信息
            Text(post.text)
                .font(.system(size: 17))
                .padding(.horizontal, 10.0)
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()               //swiftUI 提供的很细的一个分割线
            
            HStack(alignment: .center, spacing: 0){
                
                Spacer()
                
                //评论按钮
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black, action:{
                    print("评论")
                }).buttonStyle(BorderlessButtonStyle())
                
                Spacer()
                
                //点赞按钮
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black, action:{
                    print("点赞")
                }).buttonStyle(BorderlessButtonStyle())
                
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
            
        }
        .padding(.horizontal, 15) //底边距
        .padding(.top, 15)      //头边距
    }
}


struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
