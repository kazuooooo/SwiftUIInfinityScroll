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
    ]
    
    var initializedItems: [Int] = []
    var firstIdx: Int = 0
    // NOTE: 画面外は2画面分しか保持していないのでそれ以上は
    //       再度renderされる
    func onAppear(idx: Int){
        print("onAppear \(idx)")
        //        if(!initializedItems.contains(idx)) {
        //            print("initialized \(idx)")
        //            initializedItems.append(idx)
        //            return
        //        }
        if(idx == items.last?.idx) {
            guard let lastIdx = items.last?.idx else {
                print("no idx something wrong")
                return
            }
            let newItem = ScrollViewItem(idx: lastIdx + 1)
            items.append(newItem)
        }
    }
    
    func onDisappear(idx: Int){
        if(idx == items.first?.idx){
            print("remove \(idx)")
            items.remove(at: 0)
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
                        self.scrollViewData.onAppear(idx: item.idx)
                    }
                    .onDisappear{
                        self.scrollViewData.onDisappear(idx: item.idx)
                    }.frame(height: geometry.size.height)
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
        return HStack{
            Text("\(idx)")
            Image("prop")
        }
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
