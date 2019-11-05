//
//  InfinityScrollViewModel.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import Foundation

class InfinityScrollViewData: ObservableObject {
    @Published var items = [
        ScrollViewItem(page: 0)
    ]
    
    var lastPage: Int { items.count - 1 }
    
    // NOTE: 画面外は2画面分しか保持していないのでそれ以上は
    //       再度renderされる
    func onAppear(page: Int){
        // Initialize
        if(isOnInitialize(appearedPage: page)) {
            items.append(PropGenerator.generateItem(page: 1))
            items.append(PropGenerator.generateItem(page: 2))
        }
        
        if(needToAppendItem(appearedPage: page)) {
            print("create page \(lastPage + 1)")
            items.append(PropGenerator.generateItem(page: lastPage + 1))
        }
    }
    
    private func isOnInitialize(appearedPage page: Int) -> Bool { page == 0 && items.count == 1 }
    private func needToAppendItem(appearedPage page: Int) -> Bool {
        page == lastPage - 1
    }
}
