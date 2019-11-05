//
//  hoge.swift
//  SwiftUIInfinityScroll
//
//  Created by 松本和也 on 2019/11/04.
//  Copyright © 2019 松本和也. All rights reserved.
//

import SwiftUI

struct hoge: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            .offset(x: 100, y: 1)
//            .position(x: 10, y: 10)
    }
}

struct hoge_Previews: PreviewProvider {
    static var previews: some View {
        hoge()
    }
}
