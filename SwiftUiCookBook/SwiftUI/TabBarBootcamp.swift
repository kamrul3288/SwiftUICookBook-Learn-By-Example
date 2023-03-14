//
//  TabBarBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 14/3/23.
//

import SwiftUI

struct TabBarBootcamp: View {
    @State private var currentTabBar = _tabbars[0]
    @State private var tabbarList = _tabbars
    
    var body: some View {
        ZStack{
            VStack{
                TabItem()
                TabView(selection: $currentTabBar) {
                    ForEach(tabbarList) { tab in
                        Text(tab.title)
                            .tag(tab)
                    }
                    
                }.tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            
        }
        
    }
    
    //----------top tab item-------------
    @ViewBuilder
    func TabItem()->some View{
        
        HStack{
            ForEach(tabbarList){tab in
                VStack{
                    Text(tab.title)
                        .foregroundColor(currentTabBar == tab ? .black : .gray)
                        .fontWeight(.semibold)
                        .frame(width: .infinity)

                     RoundedRectangle(cornerRadius: 5)
                        .frame(width: .infinity,height: 2)
                        .foregroundColor(currentTabBar == tab ? .red : .white)
                }
                .onTapGesture {
                    currentTabBar = tab
                }
                
//                Text(tab.title)
//                    .font(.system(size: 16))
//                    .foregroundColor(currentTabBar == tab ?.white : .black.opacity(0.2))
//                    .fontWeight(.medium)
//                    .padding(.horizontal,16)
//                    .padding(.vertical,8)
//                    .background(currentTabBar == tab ? .red : .red.opacity(0.4))
//                    .cornerRadius(20)
//                    .onTapGesture {
//                        currentTabBar = tab
//                    }
                    
                
            }
        }.padding(.horizontal,16)
    }
}

struct TabBarBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabBarBootcamp()
    }
}


//-----------create tab bar model--------------
private let _tabbars = [
    TabBarModel(title:"Rental"),
    TabBarModel(title:"ReturnTrip"),
    TabBarModel(title:"Offer"),
    TabBarModel(title:"History")
]
struct TabBarModel:Identifiable,Hashable{
    let id: String = UUID().uuidString
    let title:String
}
