//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

struct InfinityScrollView<G: ItemGeneratable>: View {
    @ObservedObject var scrollViewData: InfinityScrollViewData<G>
    init(generator: G) {
        self.scrollViewData = InfinityScrollViewData<G>(generator: generator)
    }
    
    func generateText(geometry: GeometryProxy) -> Text {
        print("geometry", geometry.frame(in: .global))
        return Text("hoge")
    }
    
//  NOTE:
//  ScrollViewでHStackを用いた場合
//  画面上に表示 / 非表示に関わらずonAppearがコールされてしまうため
//  onAppearをトリガーに無限スクロール実装ができない。
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, content: {
                HStack {
                    Group {
                        GeometryReader { textGeometory in
                            self.generateText(geometry: geometry)
                        }
                        ForEach(self.scrollViewData.items){ item in
                            item
                                //                                .onAppear(){
                                //                                self.scrollViewData.onAppear(page: item.page)
                                //                            }
                                .frame(
                                    width: geometry.size.width,
                                    height: geometry.size.height)
                                .onTapGesture {
                                    print("item \(item.page)")
                                self.scrollViewData.onAppear(page: item.page)
                                }
                        }
                    }
                }
            })
        }
        
        //        GeometryReader { geometry in
        //            VStack {
        //                List(self.scrollViewData.items) { item in
        //                    item
        //                    .onAppear(){
        //                        self.scrollViewData.onAppear(page: item.page)
        //                    }.frame(height: geometry.size.height)
        //                }
        //            }
        //        }
        
    }
}
struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView<PropGenerator>(generator: PropGenerator())
    }
}
