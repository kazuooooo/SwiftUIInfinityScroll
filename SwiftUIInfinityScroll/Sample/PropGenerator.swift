//
//  PropGenerator.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/05.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

// Generator Example
class PropGenerator: ItemGeneratable {
    typealias Item = PropViewItem
    func generateItem(page: Int) -> PropViewItem {
        return PropViewItem(page: page)
    }
}

struct PropViewItem: InfinityScrollViewItemable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return HStack{
            Image("man_55")
            Text("\(page)")
        }
    }
}


