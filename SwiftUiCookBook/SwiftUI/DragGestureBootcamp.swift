//
//  DragGestureBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 13/3/23.
//

import SwiftUI

struct DragGestureBootcamp: View {
    @State var offset:CGSize = .zero
    
    var body: some View{
        
        ZStack {
            VStack{
                Text("Offset:\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()){
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()){
                                offset = value.translation
                            }
                        })
            )
        }
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}

