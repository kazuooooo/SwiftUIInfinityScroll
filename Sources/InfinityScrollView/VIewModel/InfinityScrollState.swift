//
//  InfinityScrollState.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/09.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import SwiftUI

internal class InfinityScrollState: ScrollState {
    /// Dimentional
    var infinityHorizontalScroll: InfinityScroll? {
        self.horizontalScroll as? InfinityScroll
    }
    var infinityVerticalScroll: InfinityScroll? {
        self.verticalScroll as? InfinityScroll
    }
}
