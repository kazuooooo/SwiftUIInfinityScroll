//
//  ItemGenerator.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/05.
//  Copyright © 2019 松本和也. All rights reserved.
//

import Foundation

protocol ItemGenerator {
    associatedtype Item
    static func generateItem(page: Int) -> Item
}
