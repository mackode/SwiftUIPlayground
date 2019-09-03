//
//  CircleImage.swift
//  SwiftUIPlayground
//
//  Created by Mackode - Bartlomiej Makowski on 02/09/2019.
//  Copyright © 2019 pl.mackode. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("fireball")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
            .scaleEffect(0.2)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
