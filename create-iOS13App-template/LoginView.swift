//
//  LoginView.swift
//  create-iOS13App-template
//
//  Created by admin on 23/12/2564 BE.
//

import SwiftUI

struct LoginView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
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
                .offset(x: viewState.width/15, y: viewState.height/15)
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
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .onAppear { self.show = true }

                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x: -200, y: -250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .blendMode(.overlay)
                        .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                }
                
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Card3"))
                    .offset(x: viewState.width/15, y: viewState.height/15)
                , alignment: .bottom)
            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .scaleEffect(isDragging ? 0.9 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration:  0.8))
            .rotation3DEffect(
                Angle(degrees: 5),
                axis: (x: viewState.width, y: viewState.height, z: 0.0)
            )
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    self.viewState = .zero
                }
            )
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
