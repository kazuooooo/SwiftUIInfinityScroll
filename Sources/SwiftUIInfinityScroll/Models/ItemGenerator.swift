//
//  ItemGenerator.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/05.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

public protocol ItemGeneratable {
    associatedtype Item: InfinityScrollViewItemable
    func generateItem(page: Int) -> Item
}

public protocol InfinityScrollViewItemable: View, Identifiable {
    var page: Int { get }
}
