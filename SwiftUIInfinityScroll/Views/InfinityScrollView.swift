//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

protocol ItemGenerator {
    associatedtype Item
    static func generateItem(page: Int) -> Item
}


// Generator Example
class PropGenerator: ItemGenerator {
    typealias Item = ScrollViewItem
    static func generateItem(page: Int) -> ScrollViewItem {
        return ScrollViewItem(page: page)
    }
}

// ViewModel
class ScrollViewData: ObservableObject {
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


struct InfinityScrollView: View {
    @ObservedObject var scrollViewData = ScrollViewData()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                List(self.scrollViewData.items) { item in
                    item
                    .onAppear(){
                        print("onAppear \(item.page)")
                        self.scrollViewData.onAppear(page: item.page)
                    }.frame(height: geometry.size.height)
                }
            }
        }
        
    }
}
struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
