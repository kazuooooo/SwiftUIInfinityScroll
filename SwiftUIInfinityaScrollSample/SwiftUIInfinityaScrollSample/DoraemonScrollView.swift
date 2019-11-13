//
//  DoraemonScrollView.swift
//  SwiftUIInfinityaScrollSample
//
//  Created by 松本和也 on 2019/11/14.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI
import SwiftUIInfinityScroll

// 1. Define Item View
struct DoraemonViewItem: InfinityScrollViewItemable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return HStack{
            Image("doraemon")
            Text("\(page)")
        }
    }
}

// 2. Define Generator
class DoraemonGenerator: ItemGeneratable {
    typealias Item = DoraemonViewItem
    func generateItem(page: Int) -> DoraemonViewItem {
        return DoraemonViewItem(page: page)
    }
}

struct DoraemonScrollView: View {
    var body: some View {
        // 3. Pass generator to scroll view
        InfinityScrollView<DoraemonGenerator>(generator: DoraemonGenerator(), direction: .vertical)
    }
}

struct DoraemonScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DoraemonScrollView()
    }
}
