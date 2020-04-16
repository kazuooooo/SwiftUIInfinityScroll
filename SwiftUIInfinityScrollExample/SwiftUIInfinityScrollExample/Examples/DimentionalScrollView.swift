//
//  DimentionalScrollView.swift
//  SwiftUIInfinityScrollExample
//
//  Created by 松本和也 on 2020/04/16.
//  Copyright © 2020 松本和也. All rights reserved.
//

import SwiftUI

struct DimentionalScrollView: View {
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
        ),
        verticalScroll: InfinityScroll(
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
        let horizontalScroll = scrollState.infinityHorizontalScroll
        let verticalScroll = scrollState.infinityVerticalScroll
        return VStack {
            DimentionalInfinityScrollView(
                generator: RectGenerator()
            ).environmentObject(scrollState)
            VStack {
                Text("horizontal page: \(horizontalScroll.pageInInfinity)")
            }.padding(.top, 20)
            VStack {
                Text("vertical page: \(verticalScroll.pageInInfinity)")
            }.padding(.top, 20)
        }
    }
}

struct DimentionalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        return DimentionalScrollView()
    }
}
