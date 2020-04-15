//
//  InifinityScrollVIew.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/08.
//  Copyright © 2020 松本和也. All rights reserved.
//

import SwiftUI
import UIKit

struct HorizontalInfinityScrollView<G: ItemGeneratable> : View {
    @EnvironmentObject var scrollState: InfinityScrollState
    
    var generator: G
    
    
    var body: some View {
        let scroll = self.scrollState.horizontalScroll as! InfinityScroll
        return PositionScrollView(scrollState: self.scrollState) {
                    HStack(spacing: 0) {
                        ForEach( scroll.renderPages, id: \.self) {page in
                            self.generator.generateItem(page: page)
                        }
                    }
                }
    }
}


class TestViewGenerator: ItemGeneratable {
    typealias Item = TestViewItem
    func generateItem(page: Int) -> TestViewItem {
        return TestViewItem(page: page)
    }
}

struct TestViewItem: InfinityScrollViewItemable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return Text("\(self.page)日")
            .frame(width: 200, height: 200)
            .border(Color.black)
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
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
            )
        )
        return HorizontalInfinityScrollView(
            generator: TestViewGenerator()
        ).environmentObject(scrollState)
    }
}
