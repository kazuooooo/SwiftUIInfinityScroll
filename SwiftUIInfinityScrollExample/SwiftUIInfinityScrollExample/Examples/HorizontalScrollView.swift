//
//  HorizontalScrollView.swift
//  SwiftUIInfinityScrollExample
//
//  Created by 松本和也 on 2020/04/15.
//  Copyright © 2020 松本和也. All rights reserved.
//

import SwiftUI

struct HorizontalScrollView: View {
    @ObservedObject var scrollState = InfinityScrollState(
        pageSize: CGSize(width: 200, height: 200),
        horizontalScroll: InfinityScroll(
            scrollSetting: ScrollSetting(
                pageCount: 5,
                // -2〜2の0ページ目
                initialPage: 2,
                pageSize: 200,
                afterMoveType: .unit
            )
        )
    )
    var body: some View {
        let scroll = scrollState.infinityHorizontalScroll!
        return VStack {
            InfinityScrollView(
                generator: TestViewGenerator()
            ).environmentObject(scrollState)
            VStack {
                Text("page: \(scroll.pageInInfinity)")
            }.padding(.top, 20)
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        return HorizontalScrollView()
    }
}
