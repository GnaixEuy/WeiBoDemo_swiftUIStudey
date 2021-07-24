//
//  PostVipBadge.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/23.
//

import SwiftUI

struct PostVipBadge: View {
    
    let isVip: Bool
    
    var body: some View {
        Group{
            if isVip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white,lineWidth: 1)
                    )
            }
        }
    }
}

struct PostVipBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVipBadge(isVip: true)
    }
}
