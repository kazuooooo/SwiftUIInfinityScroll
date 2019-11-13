//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

// TODO add image url
// Currently, ScrollView can not be used for InfinityScrollview,
// because
// * OnAppear event is called even if view is not on the view.
// * Can not detect scroll position. (
// Want Content Offset
// https://developer.apple.com/documentation/uikit/uiscrollview/1619404-contentoffset
// So, used very hacky way by rotate view implement horizontal view.
struct InfinityScrollView<G: ItemGeneratable>: View {
    enum InfinityScrollDirection {
        case vertical
        case horizontal
    }
    @ObservedObject var scrollViewData: InfinityScrollViewData<G>
    var scrollDirection: InfinityScrollDirection
    var viewRotation: Double {
        switch(scrollDirection){
        case(.horizontal):
            return 90
        case(.vertical):
            return 0
        }
    }
    
    func getFrameHeight(_ geometry: GeometryProxy) -> CGFloat {
        switch(scrollDirection){
        case(.horizontal):
            return geometry.size.width
        case(.vertical):
            return geometry.size.height
        }
    }
    
    func getFrameWidth(_ geometry: GeometryProxy) -> CGFloat {
        switch(scrollDirection){
        case(.horizontal):
            return geometry.size.height
        case(.vertical):
            return geometry.size.width
        }
    }
    
    init(generator: G, direction: InfinityScrollDirection) {
        self.scrollViewData = InfinityScrollViewData<G>(generator: generator)
        self.scrollDirection = direction
    }
        
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                List(self.scrollViewData.items) { item in
                    item
                    .onAppear(){
                        self.scrollViewData.onAppear(page: item.page)
                    }
                    .border(Color.black)
                    .frame(
                        width: self.getFrameWidth(geometry),
                        height: self.getFrameHeight(geometry)
                    )
                        .rotationEffect(.degrees(self.viewRotation))
                }
                .border(Color.red)
                .rotationEffect(.degrees(-self.viewRotation))
                .frame(
                    width: self.getFrameWidth(geometry),
                    height: self.getFrameHeight(geometry)
                )
            }
            .border(Color.green)
       }
        
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView<PropGenerator>(generator: PropGenerator(), direction: .vertical)
    }
}
