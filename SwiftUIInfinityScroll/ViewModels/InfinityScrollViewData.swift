//
//  InfinityScrollViewData.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/05.
//  Copyright © 2019 松本和也. All rights reserved.
//

import Foundation

class InfinityScrollViewData<G: ItemGeneratable> : ObservableObject {
    @Published var items: [G.Item]
        
    var lastPage: Int { items.count - 1 }
    var generator: G
    
    init(generator: G){
        self.generator = generator
        self.items = [generator.generateItem(page: 0)]
    }
    
    // NOTE: 画面外は2画面分しか保持していないのでそれ以上は
    //       再度renderされる
    func onAppear(page: Int){
        // Initialize
//        if(isOnInitialize(appearedPage: page)) {
//            items.append(generator.generateItem(page: 1))
//            items.append(generator.generateItem(page: 2))
//        }
        
        print("onAppear page \(page), lastPage \(lastPage), needToAppend \(needToAppendItem(appearedPage: page))")
        if(needToAppendItem(appearedPage: page)) {
            print("create page \(lastPage + 1)")
            items.append(generator.generateItem(page: lastPage + 1))
        }
    }
    
    private func isOnInitialize(appearedPage page: Int) -> Bool { page == 0 && items.count == 1 }
    private func needToAppendItem(appearedPage page: Int) -> Bool {
        page == 0 || page == 1 || page == 2 || page == lastPage - 1
    }
}
