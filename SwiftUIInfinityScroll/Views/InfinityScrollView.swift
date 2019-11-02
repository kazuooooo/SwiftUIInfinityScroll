//
//  InfinityScrollView.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/02.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

extension Image: Identifiable {
    public var id: UUID {
        UUID()
    }
}

struct InfinityScrollView: View {
    @State var images = [
        Image("prop"),
        Image("prop"),
        Image("prop"),
        Image("prop"),
        Image("prop"),
        Image("prop"),
        Image("prop"),
        Image("prop"),
    ]
    var messages = ["hoge", "baz", "Aaa"]
    var body: some View {
        ScrollView(.horizontal, content: {
            HStack(spacing: 0) {
                ForEach(self.images){ image in
                    image
                }
            }
        })
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
