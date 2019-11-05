//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

struct InfinityScrollView: View {
    @ObservedObject var scrollViewData = InfinityScrollViewData()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                List(self.scrollViewData.items) { item in
                    item
                    .onAppear(){
                        self.scrollViewData.onAppear(page: item.page)
                    }.frame(height: geometry.size.height)
                }
            }
        }
        
    }
}
struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
