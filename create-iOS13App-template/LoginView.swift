//
//  LoginView.swift
//  create-iOS13App-template
//
//  Created by admin on 23/12/2564 BE.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Color("background2").edgesIgnoringSafeArea(.bottom)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            VStack {
                GeometryReader { geometry in
                    Text("Learn design & code. \nFrom scratch.")
                        .font(.system(size: geometry.size.width/10 , weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 375, maxHeight:  100)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
                
                Text("80 hours of courses for SwiftUI")
                    .font(.subheadline)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.top, 100)
            .frame(height: 477)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -150, y: -200)
                        .blendMode(.plusDarker)
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .blendMode(.overlay)
                }
                
            )
            .background(Image(uiImage: #imageLiteral(resourceName: "Card3")), alignment: .bottom)
            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
