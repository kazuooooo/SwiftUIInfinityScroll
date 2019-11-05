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
    
    var lastPage: Int { items.last?.page ?? 0 }
    var firstPage: Int { items.first?.page ?? 0 }
    
    // NOTE: 画面外は2画面分しか保持していないのでそれ以上は
    //       再度renderされる
    func onAppear(page: Int){
        // Initialize
        if(isOnInitialize(appearedPage: page)) {
            items.insert(PropGenerator.generateItem(page: -1), at: 0)
            items.insert(PropGenerator.generateItem(page: -2), at: 0)
//            items.append(PropGenerator.generateItem(page: 1))
//            items.append(PropGenerator.generateItem(page: 2))
            return
        }
        
        // Forward pages
//        if(page == lastPage - 1) {
//            print("create page \(lastPage + 1)")
//            items.append(PropGenerator.generateItem(page: lastPage + 1))
//        }
//
        // Backword pages
//        print(firstPage)
        let debugFirstPage = firstPage
        print("firstPage: \(debugFirstPage)")
        print("page: \(page)")
        print("firstPage + 1: \(firstPage + 1)")
        print("result: \(page == firstPage + 1)")

        if(page == firstPage + 1) {
            print("unshift page: \(page)")
//            items.insert(PropGenerator.generateItem(page: firstPage - 1), at: 0)
        }
    }
    
    private func isOnInitialize(appearedPage page: Int) -> Bool { page == 0 && items.count == 1 }
}

struct ScrollViewItem: View, Identifiable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return HStack{
            Image("man_55")
                .padding(.top)
            Text("\(page)")
        }
    }
}


struct InfinityScrollView: View {
    @ObservedObject var scrollViewData = ScrollViewData()
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal){
                HStack {
                     ForEach(self.scrollViewData.items) { item in
                         item
                         .onAppear(){
                             print("onAppear \(item.page)")
                             self.scrollViewData.onAppear(page: item.page)
                         }
                         .frame(width: geometry.size.width, height: geometry.size.height)
                     }
                }
            }
            .border(Color.red, width: 2)
        }
        
    }
}
struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
