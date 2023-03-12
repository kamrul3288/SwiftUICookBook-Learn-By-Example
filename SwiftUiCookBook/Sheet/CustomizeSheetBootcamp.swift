//
//  CustomizeSheetBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 12/3/23.
//
import SwiftUI

struct CustomizeSheetBootcamp : View{
    
    //gesture property
    @State var offset:CGFloat = 0
    @State var lastOffset:CGFloat = 0
    @GestureState var gestureOffset:CGFloat = 0
    
    var body: some View{
        ZStack{
            
            GeometryReader{proxy in
                VStack{
                    Button(action: {}) {
                        Text("Clickable")
                    }
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
            }.blur(radius: getBlurRadius())
            
            //bottom sheet
            //For getting height for drag gesture
            GeometryReader{proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                return AnyView(
                    ZStack{
                        BottomSheetBG(style: .systemMaterialLight)
                            .clipShape(CustomBottomSheetCorner(corners: [.topLeft,.topRight], radius: 30))

                        
                        VStack{
                            Capsule()
                                .fill(Color.gray)
                                .frame(width: 60,height: 5)
                            
                            Text("Ride details")
                                .font(.headline)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Divider()
                            
                            HStack(){
                                Text("Insurance Added")
                                Spacer()
                                Button(action: {}){
                                    Text("Learn More")
                                       
                                }
                                .frame(minWidth: 120,minHeight: 30)
                                .foregroundColor(Color.white)
                                .background(Color.cyan)
                                .cornerRadius(20)
                                
                            }
                        }
                        .padding()
                        .frame(maxHeight: .infinity,alignment: .top)
                        
                    }
                    .offset(y:height-120)
                    .offset(y: -offset > 0 ? -offset <= (height-120) ? offset : -(height-120) : 0)
                    .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.height
                        onChnage()
                    }).onEnded({ value in
                        let maxHeight = height - 100
                        withAnimation {
                            // logic conditions for moving state
                            // up sown or mid
                            if -offset > 100 && -offset < maxHeight/2{
                                //mid position
                                offset = -(maxHeight/3)
                            }else if -offset > maxHeight / 2 {
                                offset = -maxHeight
                            }else{
                                offset = 0
                            }
                        }
                        
                        // sorting last offset
                        // sto that gesture continue form the last gesture position
                        lastOffset = offset
                    }))

                )
            }
            .ignoresSafeArea(.all,edges: .bottom)
        }
    }
    
    func onChnage(){
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    func getBlurRadius() -> CGFloat{
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        return progress * 30
    }
    
    
}

struct CustomizeSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeSheetBootcamp()
    }
}
