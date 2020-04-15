//
//  InfinityScroll.swift
//  InfinityScrollDev
//
//  Created by 松本和也 on 2020/04/09.
//  Copyright © 2020 松本和也. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class InfinityScroll: Scroll {
    // 表示pageの初期値
    // TODO:
    // ページを0スタートにする
    // 現在のページを表示されていないものも含めて正しく表示させる
    var renderPages: CountableClosedRange<Int> = -2...2
    
    var lastPage: Int {
        renderPages.upperBound
    }
    
    var firstPage: Int {
        renderPages.lowerBound
    }
    
    // Pageをdecrement or incremtnするための閾値
    var positionToDecrementPage: CGFloat {
        self.pageSize * 1
    }
    var positionToIncrementPage: CGFloat {
        self.pageSize * 3
    }
    
    var pageInInfinity: Int {
        Array(self.renderPages)[page]
    }
    
    override func moveBy(value: CGFloat) {
        let newPosition = self.lastPosition + value
        if(newPosition > self.positionToIncrementPage) {
            self.incrementPage()
        }
        if(newPosition < self.positionToDecrementPage) {
            self.decrementPage()
        }
        self.position = self.correctPositionInRange(position: newPosition)
    }
    
    func incrementPage() {
        // pageをincremnt
        self.renderPages = (self.firstPage + 1)...(self.lastPage + 1)
        self.lastPosition -= self.pageSize
    }
    
    func decrementPage() {
        // pageをincremnt
        self.renderPages = (self.firstPage - 1)...(self.lastPage - 1)
        self.lastPosition += self.pageSize
    }
}
