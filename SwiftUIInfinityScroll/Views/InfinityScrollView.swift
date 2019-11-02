//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

class ScrollViewData: ObservableObject {
    @Published var items = [
        ScrollViewItem(idx: 1),
        ScrollViewItem(idx: 2),
        ScrollViewItem(idx: 3),
        ScrollViewItem(idx: 4),
        ScrollViewItem(idx: 5),
        ScrollViewItem(idx: 6),
    ]
    
    func onAppear(idx: Int){
        print("onAppear \(idx)")
        if(idx == items.count) {
            print("create \(items.count + 1)")
            let newItem = ScrollViewItem(idx: items.count + 1)
            items.append(newItem)
        }
    }
}

struct InfinityScrollView: View {
    @ObservedObject var scrollViewData = ScrollViewData()
    var body: some View {
        VStack {
            List(scrollViewData.items) { item in
                item
                .onAppear(){
                    self.scrollViewData.onAppear(idx: item.idx)
                }
                .onDisappear{
//                    print("disappeard \(item.idx)")
                }
            }
        }
    }
}



struct ScrollViewItem: View, Identifiable {
    public var id = UUID()
    @State var isCurrentPage = false
    @State var currentX = 0
    public var idx: Int;
    var body: some View {
        return Image("prop")
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
