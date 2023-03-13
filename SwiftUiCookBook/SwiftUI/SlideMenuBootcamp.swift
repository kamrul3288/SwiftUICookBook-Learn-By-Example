//
//  SlideMenuBootcamp.swift
//  SwiftUiCookBook
//https://blog.logrocket.com/create-custom-collapsible-sidebar-swiftui/
//  Created by Kamrul Hasan on 13/3/23.
//

import SwiftUI

struct SlideMenuBootcamp: View {
    @State private var isSidebarOpened = false

    var body: some View {
        ZStack{
            NavigationStack {
                List {
                    ForEach(0..<8) { _ in
                        AsyncImage(
                            url: URL(string: "https://picsum.photos/600")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 240)
                            } placeholder: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray.opacity(0.6))
                                        .frame(height: 240)
                                    ProgressView()
                                }
                            }
                            .aspectRatio(3 / 2, contentMode: .fill)
                            .cornerRadius(12)
                            .padding(.vertical)
                            .shadow(radius: 4)
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Images")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            isSidebarOpened.toggle()
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                        }
                    }
                }
            }
            
            SlideMainMenuBootcamp(isSidebarOpened: $isSidebarOpened)

        }
    }
}

struct SlideMainMenuBootcamp:View{
    @Binding var isSidebarOpened:Bool
    var body: some View{
        ZStack{
            GeometryReader{proxy in
                var sideBarWidth = proxy.size.width * 0.7
                ZStack(alignment: .top) {
                    Color.white.opacity(0.9)
                    ScrollView{
                        VStack(alignment: .leading){
                            VStack(alignment: .center){
                                Circle()
                                    .frame(width: 100, height: 100)
                                    .padding(.top,proxy.safeAreaInsets.top)
                                
                                Text("Kamrul Hasan")
                                    .fontWeight(.bold)
                                
                                Text("+880xxxxxxxx")
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }.frame(width: sideBarWidth,alignment: .center)
                        }
                        
                        VStack(alignment: .leading){
                            Divider()
                            Label("Home", systemImage: "house")
                                .onTapGesture {
                                   print("Hello")
                                }
                                .padding(16)
                            
                            
                            Divider()
                            Label("Bookmark", systemImage: "heart")
                                .padding(16)
                            
                            Divider()
                            Label("Navigation", systemImage: "paperplane")
                                .padding(16)
                            
                            Divider()
                            Label("Documents", systemImage: "doc")
                                .padding(16)
                        }
                        .frame(width: sideBarWidth,alignment: .center)
                        
                        VStack(alignment: .leading){
                            Divider()
                            Label("Home", systemImage: "house")
                                .padding(16)
                                
                            Divider()
                            Label("Bookmark", systemImage: "heart")
                                .padding(16)
                            
                            Divider()
                            Label("Navigation", systemImage: "paperplane")
                                .padding(16)
                            
                            Divider()
                            Label("Documents", systemImage: "doc")
                                .padding(16)
                        }
                        .frame(width: sideBarWidth,alignment: .center)
                    }
    
                }
                .frame(width: sideBarWidth)
                .offset(x: isSidebarOpened ? 0 : -sideBarWidth)
                .animation(.default, value: isSidebarOpened)
                .ignoresSafeArea(.all)

            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarOpened ? 1 : 0)
            .animation(.easeInOut.delay(0.1), value: isSidebarOpened)
            .onTapGesture {
                isSidebarOpened.toggle()
            }
        }
    }
}

struct SlideMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuBootcamp()
    }
}
