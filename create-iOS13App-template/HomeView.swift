//
//  HomeView.swift
//  create-iOS13App-template
//
//  Created by admin on 11/12/2564 BE.
//

import SwiftUI
import Contentful

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        GeometryReader { bounds in
            ScrollView {
                VStack {
                    HStack {
                        Text("Watching")
                            .font(.system(size: 28, weight: .bold))
                        
                        Spacer()
                        
                        AvatarView(showProfile: $showProfile)
                        
                        Button(action: {self.showUpdate.toggle()}) {
                            Image(systemName: "bell")
    //                            .renderingMode(.original)
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 36, height: 36)
                                .background(Color("background3"))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1.0)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                        }
                        .sheet(isPresented: $showUpdate) {
                            UpdateList()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        WatchRingsView()
                            .padding(.horizontal, 30)
                            .padding(.bottom, 30)
                            .onTapGesture {
                                self.showContent = true
                            }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(sectionData) { item in
                                GeometryReader { geometry in
                                    SectionView(section: item)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 275, height: 275)
                            }
                        }
                        .padding(30)
                        .padding(.bottom, 30)
                    }
                    .offset(y: -30)
                    
                    HStack {
                        Text("Courses")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                    .offset(y: -60)
                    
                    SectionView(section: sectionData[2], width: bounds.size.width, height: 275)
                        .offset(y: -60)
                    
                    Spacer()
                }
                .frame(width: bounds.size.width)
            }
        }
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24,  weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
            .environmentObject(UserStore())
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [Section(title: "Prototype Designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image("Card1"), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
   Section(title: "Build SwiftUI", text: "18 Sections", logo: "Logo1", image: Image("Card2"), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
   Section(title: "Prototype Designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image("Card3"), color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
]


struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), color2: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("6 mins").font(.subheadline).fontWeight(.bold)
                    Text("Watch for 6 mins").font(.caption)
                }
                .modifier(FontModifiers())
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), width: 32, height: 32, percent: 54, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), width: 32, height: 32, percent: 54, show: .constant(true))
            }
            .padding(8)
            .background(Color("background3"))
            .cornerRadius(20)
            .modifier(ShadowModifiers())
        }
    }
}
