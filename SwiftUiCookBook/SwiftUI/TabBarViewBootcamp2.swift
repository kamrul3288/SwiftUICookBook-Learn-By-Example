//
//  TabBarViewBootcamp2.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 13/3/23.
//

import SwiftUI



struct TabBarViewBootcamp2: View {
    @State private var selectedTab:TabItemModel = tabitems[0]
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ForEach(tabitems) { tabitem in
                    VStack{
                        Text(tabitem.title)
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                    }.tag(tabitem)
                }
            }
            VStack {
                Spacer()
                MyCustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}


struct TabBarViewBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewBootcamp2()
    }
}

struct MyCustomTabBarView: View {
    @Binding var selectedTab:TabItemModel
    var body: some View {
        VStack{
            HStack{
                ForEach(tabitems) { tabitem in
                    Spacer()
                    VStack{
                        Image(systemName: tabitem.title == selectedTab.title ? tabitem.image+".fill" : tabitem.image)
                            .font(.title2)
                            .foregroundColor(tabitem.title == selectedTab.title ? .red : .gray)
                            .scaleEffect(tabitem.title == selectedTab.title ? 1.15 : 1.0)
                        
                        Text(tabitem.title)
                            .font(.caption)
                            .padding(.top,2)
                            .foregroundColor(tabitem.title == selectedTab.title ? .black : .gray)

                    }.onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = tabitem
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: .infinity)
            .padding(.top,18)
            .background(.thinMaterial)
        }
    }
}

private let tabitems = [
    TabItemModel(image:"house",title:"Home"),
    TabItemModel(image:"heart",title:"Bookmarks"),
    TabItemModel(image:"person",title:"Profile")
]

struct TabItemModel:Identifiable, Hashable{
    let id = UUID().uuidString
    let image:String
    let title:String
}
