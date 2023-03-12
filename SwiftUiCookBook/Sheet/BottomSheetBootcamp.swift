//
//  BottomSheetBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 12/3/23.
//

import SwiftUI

struct BottomSheetBootcamp: View {
    @State var isShowingBottomSheet = false
    @State var isShowingBottomSheet2 = false
    
    var body: some View {
        VStack{
            Button {
                isShowingBottomSheet = true
            }label: {
               Text("Show Modal Bottom-Sheet")
                    .fontWeight(.bold)
            }
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            
            Button {
                isShowingBottomSheet2 = true
            }label: {
               Text("Show Persistance Bottom-Sheet")
                    .fontWeight(.bold)
            }
            .padding()
            .background(.cyan)
            .cornerRadius(10)
            .foregroundColor(.white)
        }
        .sheet(isPresented: $isShowingBottomSheet) {
            BottomSheetScreen()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $isShowingBottomSheet2) {
            BottomSheetPersistanceScreen()
                .presentationDetents([.height(50),.large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct BottomSheetScreen : View{
    var body: some View{
        VStack{
            Text("Ride Details").padding()
        }
    }
}

struct BottomSheetPersistanceScreen : View{
    var body: some View{
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading,spacing: 0){
                
                Text("Ride Details")
                    .fontWeight(.bold)
                    .padding(.horizontal,16)
                    .padding(.vertical,32)
                    .frame(maxWidth: .infinity, alignment: .center)

                
                Text("Ride Details")
                    .fontWeight(.bold)
                    .padding()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }.interactiveDismissDisabled()
    }
}

struct BottomSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetBootcamp()
    }
}
