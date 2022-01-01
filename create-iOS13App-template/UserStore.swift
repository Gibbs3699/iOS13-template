//
//  UserStore.swift
//  create-iOS13App-template
//
//  Created by admin on 31/12/2564 BE.
//

import SwiftUI

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}

