//
//  InfinityScrollViewModel.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import Foundation
import SwiftUI

/// Has scroll view state and controll item generation.
/// When a item which is second from last is shown, new item generate by generator.
/// Figure is here.
/// https://cdn-images-1.medium.com/max/800/1*FKwK2gLYMbiP0wwTbs8a2A.png
@available(OSX 10.15, *)
@available(OSX 10.15, *)

open class InfinityScrollViewData<G: ItemGeneratable> : ObservableObject {
    @Published var items: [G.Item]
        
    var lastPage: Int { items.count - 1 }
    var generator: G
    
    init(generator: G){
        self.generator = generator
        self.items = [generator.generateItem(page: 0)]
    }
    
    func onAppear(page: Int){
        // Initialize
        if(isOnInitialize(appearedPage: page)) {
            items.append(generator.generateItem(page: 1))
            items.append(generator.generateItem(page: 2))
        }
        
        if(needToAppendItem(appearedPage: page)) {
            items.append(generator.generateItem(page: lastPage + 1))
        }
    }
    
    private func isOnInitialize(appearedPage page: Int) -> Bool { page == 0 && items.count == 1 }
    private func needToAppendItem(appearedPage page: Int) -> Bool {
        page == lastPage - 1
    }
}
