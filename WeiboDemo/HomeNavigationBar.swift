//
//  HomeNavigationBar.swift
//  WeiboDemo
//
//  Created by 苏粤翔 on 2021/7/25.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24   //按钮和button共同高度，所以直接叫button系列吧
private let ScreenWidth: CGFloat = CGFloat(UIScreen.main.bounds.width)

struct HomeNavigationBar: View {
    
    @State var leftPercent: CGFloat        //0的时候即为左侧  1为右侧
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0){
            Button(action: {
                print("调起相机")
            }, label: {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight, alignment: .center)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            VStack (spacing: 3) {
                HStack(spacing: 0){
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 1
                            }
                            
                        }
                }
                .font(.system(size: 20))
                
                /*              //有问题 估计是苹果又改了api    草，我用常量了
                 // 几何图形，内装view。  geometry可以拿到大小参数。
                 GeometryReader{ geometry in
                 //选中时候的下划线
                 RoundedRectangle(cornerRadius: 2)
                 .foregroundColor(.orange)
                 .frame(width: 30, height: 4)
                 .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent))
                 }
                 .frame(height: 6)
                 */
                
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 4, alignment: .center)
                    .offset(x: ((self.leftPercent - 0.5) * (0.5 * ScreenWidth)) + ((0.5 - self.leftPercent) * kLabelWidth))
            }
            .frame(width: (ScreenWidth * 0.5))
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight, alignment: .center)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            })
        }
        .frame(width: ScreenWidth)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeNavigationBar(leftPercent: 0)
    }
}
