//
//  InifinityScrollVIew.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/08.
//  Copyright © 2020 松本和也. All rights reserved.
//

import SwiftUI
import UIKit

struct InfinityScrollView<G: ItemGeneratable> : View {
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
    
    var generator: G
    
    init(
        generator: G
    ){
        self.generator = generator
    }
    
    
    var body: some View {
        let scroll = self.scrollState.horizontalScroll as! InfinityScroll
        return
            VStack {
                PositionScrollView(scrollState: self.scrollState) {
                    HStack(spacing: 0) {
                        ForEach( scroll.renderPages, id: \.self) {page in
                            self.generator.generateItem(page: page)
                        }
                    }
                }
                VStack {
                    Text("position: \(self.scrollState.horizontalScroll!.position)")
                    Text("page: \(self.scrollState.horizontalScroll!.page)")
                    Text("pageInInfinity: \(scroll.pageInInfinity)")
                    Text("renderPages: \(String(scroll.renderPages.first!))〜\(String(scroll.renderPages.last!))")
                    Text("decrement: \(scroll.positionToDecrementPage)")
                    Text("increment: \(scroll.positionToIncrementPage)")
                    Text("unit: \(self.scrollState.horizontalScroll!.unit)")
                    Text("positionInUnit: \(self.scrollState.horizontalScroll!.positionInUnit)")
                    Text("contentSize: \(self.scrollState.horizontalScroll!.contentSize)")
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
        return InfinityScrollView(generator: TestViewGenerator())
    }
}
