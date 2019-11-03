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
    ]
    
    var initializedItems: [Int] = []
    var firstIdx: Int = 0
    // NOTE: 画面外は2画面分しか保持していないのでそれ以上は
    //       再度renderされる
    func onAppear(idx: Int){
        guard let lastIdx = items.last?.idx else {
            print("no idx something wrong")
            return
        }
        // 順方向の生成
        // N - 1番目の要素がappearしたらN + 1番目を生成する
        if(idx == lastIdx - 1) {
            let newItem = ScrollViewItem(idx: lastIdx + 1)
            items.append(newItem)
        }
    }
    
    func onDisappear(idx: Int){
        // 順方向の削除
        // N番目の要素がdisappearしたらN - 1番目の要素を削除する
//        print("onDisappear \(idx)")
//        items = items.filter { $0.idx != idx - 1}
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
                        print("onAppear \(item.idx)")

                        self.scrollViewData.onAppear(idx: item.idx)
                    }
                    .onDisappear{
                        print("onDisappear \(item.idx)")
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
