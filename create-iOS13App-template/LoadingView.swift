//
//  LoadingView.swift
//  create-iOS13App-template
//
//  Created by admin on 30/12/2564 BE.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        LottieView(filename: "loading")
            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
