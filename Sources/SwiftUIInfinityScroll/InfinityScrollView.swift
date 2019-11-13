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

@available(OSX 10.15, *)
public struct InfinityScrollView<G: ItemGeneratable>: View {
    public enum InfinityScrollDirection {
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
    
    public init(generator: G, direction: InfinityScrollDirection) {
        self.scrollViewData = InfinityScrollViewData<G>(generator: generator)
        self.scrollDirection = direction
    }
        
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                List(self.scrollViewData.items) { item in
                    item
                    .onAppear(){
                        self.scrollViewData.onAppear(page: item.page)
                    }
                    .frame(
                        width: self.getFrameWidth(geometry),
                        height: self.getFrameHeight(geometry)
                    )
                        .rotationEffect(.degrees(self.viewRotation))
                }
                .rotationEffect(.degrees(-self.viewRotation))
                .frame(
                    width: self.getFrameWidth(geometry),
                    height: self.getFrameHeight(geometry)
                )
            }
       }
    }
}
