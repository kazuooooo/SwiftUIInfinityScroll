//
//  DimentionalScrollView.swift
//  SwiftUIInfinityScrollExample
//
//  Created by 松本和也 on 2020/04/16.
//  Copyright © 2020 松本和也. All rights reserved.
//

import SwiftUI

// これだとItemGeneratorは縦方向のページしか参照していないので
// ItemGeneratorが2次元のページからItemを生成する必要がある
struct DimentionalInfinityScrollView<G: ItemGeneratable> : View {
    @EnvironmentObject var scrollState: InfinityScrollState
    
    var generator: G
    
    var body: some View {
        let verticalScroll = self.scrollState.verticalScroll as! InfinityScroll
        let horizontalScroll = self.scrollState.horizontalScroll as! InfinityScroll
        return PositionScrollView(scrollState: self.scrollState) {
            HStack(spacing: 0) {
                ForEach(horizontalScroll.renderPages, id: \.self) {
                    page in
                    VStack(spacing: 0) {
                        ForEach( verticalScroll.renderPages, id: \.self) {page in
                            self.generator.generateItem(page: page)
                        }
                    }
                }
            }
        }
    }
}

struct DimentionalInfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let scrollState = InfinityScrollState(
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
        return DimentionalInfinityScrollView(
            generator: RectGenerator()
        ).environmentObject(scrollState)
    }
}
