//
//  UpdateStore.swift
//  create-iOS13App-template
//
//  Created by admin on 12/12/2564 BE.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
