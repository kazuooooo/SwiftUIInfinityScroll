//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI


struct InfinityScrollView: View {
    @State var currentPage = 0;
    @State var items = [
        ScrollViewItem(),
        ScrollViewItem(),
        ScrollViewItem(),
        ScrollViewItem(),
        ScrollViewItem(),
        ScrollViewItem(),
    ]
    var messages = ["hoge", "baz", "Aaa"]
    var body: some View {
        VStack {
            Text("Page \(currentPage)")
            GeometryReader { geometry in
                ScrollView(.horizontal, content: {
                    HStack(spacing: 0) {
                        ForEach(self.items){ item in
                            item.frame(width: geometry.size.width)
                        }
                    }
                })

            }
        }
    }
}



struct ScrollViewItem: View, Identifiable {
    public var id = UUID()
    @State var isCurrentPage = false
    @State var currentX = 0
    
    var body: some View {
        ZStack(alignment: .center){
            Image("prop")
            GeometryReader { geometry in
                VStack {
                    Text("\(geometry.frame(in: CoordinateSpace.global).origin.x)")
                    Circle().fill(Color.blue).frame(width: 10, height: 10)
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
