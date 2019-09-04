//
//  HikeView.swift
//  SwiftUIPlayground
//
//  Created by Mackode - Bartlomiej Makowski on 04/09/2019.
//  Copyright © 2019 pl.mackode. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                //HikeGraph(data: hike.observations, path: \.elevation)
                //    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button(action: {
                    self.showDetail.toggle()
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        .animation(.spring())
                }
            }

            if showDetail {
                //HikeDetail(hike: hike)
            }
        }
    }
}
