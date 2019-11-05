//
//  PropGenerator.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/05.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

// Generator Example
class PropGenerator: ItemGenerator {
    typealias Item = ScrollViewItem
    static func generateItem(page: Int) -> ScrollViewItem {
        return ScrollViewItem(page: page)
    }
}



struct ScrollViewItem: View, Identifiable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return HStack{
            Image("man_55")
            Text("\(page)")
        }
    }
}
