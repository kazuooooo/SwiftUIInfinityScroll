//
//  InfinityScrollState.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/09.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import SwiftUI

internal class DimentionalInfinityScrollState: ScrollState {
    /// Dimentional
    var infinityHorizontalScroll: InfinityScroll {
        self.horizontalScroll as! InfinityScroll
    }
    var infinityVerticalScroll: InfinityScroll {
        self.verticalScroll as! InfinityScroll
    }
    
    init(
        pageSize: CGSize,
        horizontalScroll: Scroll,
        verticalScroll: Scroll
    ){
        super.init(
            pageSize: pageSize,
            horizontalScroll: horizontalScroll,
            verticalScroll: verticalScroll
        )
    }
}

internal class HorizontalInfinityScrollState: ScrollState {
    var infinityHorizontalScroll: InfinityScroll {
        self.horizontalScroll as! InfinityScroll
    }
    
    init(
        pageSize: CGSize,
        scroll: Scroll
    ){
        super.init(
            pageSize: pageSize,
            horizontalScroll: scroll
        )
    }
}

internal class VerticalInfinityScrollState: ScrollState {
    var infinityVerticalScroll: InfinityScroll {
        self.verticalScroll as! InfinityScroll
    }
    
    init(
        pageSize: CGSize,
        scroll: Scroll
    ){
        super.init(
            pageSize: pageSize,
            verticalScroll: scroll
        )
    }
}
