//
//  ItemGeneratable.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/08.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import SwiftUI

public protocol ItemGeneratable {
    associatedtype Item: InfinityScrollViewItemable
    func generateItem(page: Int) -> Item
}

public protocol InfinityScrollViewItemable: View, Identifiable {
    var page: Int { get }
}

