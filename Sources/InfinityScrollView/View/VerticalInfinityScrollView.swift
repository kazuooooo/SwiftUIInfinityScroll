//
//  VerticalInfinityScrollView.swift
//  SwiftUIInfinityScrollExample
//
//  Created by 松本和也 on 2020/04/15.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import SwiftUI

struct VerticalInfinityScrollView<G: ItemGeneratable> : View {
    @EnvironmentObject var scrollState: InfinityScrollState
    
    var generator: G
    
    
    var body: some View {
        let scroll = self.scrollState.verticalScroll as! InfinityScroll
        return PositionScrollView(scrollState: self.scrollState) {
                    VStack(spacing: 0) {
                        ForEach( scroll.renderPages, id: \.self) {page in
                            self.generator.generateItem(page: page)
                        }
                    }
                }
    }
}


struct VerticalInfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let scrollState = InfinityScrollState(
            pageSize: CGSize(width: 200, height: 200),
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
        return VerticalInfinityScrollView(
            generator: TestViewGenerator()
        ).environmentObject(scrollState)
    }
}
