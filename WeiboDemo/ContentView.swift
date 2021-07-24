//  ContentView.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/23.
//

import SwiftUI



struct ContentView: View {
    var tmptext:String = "shit"
    var body: some View {
        HStack(alignment: .top, spacing: 0.0){
            Image("0")
                .resizable()
                .frame(width:35, height:35)
                .shadow(radius: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 35.0/2, style: .continuous)
                          .stroke(Color(red: 13, green: 13, blue: 13),lineWidth: 3)
                )
               
        }
            .position()
//        .zIndex(999)
//        ZStack{
//
//
//            HStack{
//                Image("0")
//                    .zIndex(3)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ContentView()
        }
    }
}


