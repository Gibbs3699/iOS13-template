//
//  UserStore.swift
//  create-iOS13App-template
//
//  Created by admin on 31/12/2564 BE.
//

import SwiftUI

class UserStore: ObservableObject {
    @Published var isLogged = false
        @Published var showLogin = false
}

