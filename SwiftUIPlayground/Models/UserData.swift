//
//  UserData.swift
//  SwiftUIPlayground
//
//  Created by Mackode - Bartlomiej Makowski on 03/09/2019.
//  Copyright © 2019 pl.mackode. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = []
}
