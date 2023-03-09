//
//  TextFiledBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 9/3/23.
//

import SwiftUI

struct TextFiledBootcamp: View {
    @State var name = ""
    @FocusState var nameTextFiledIsFocused:Bool

    var body: some View {
        VStack{
            TextField("Enter your name", text: $name)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(Color.red)
                .padding(.bottom,10)
            
            TextField("Enter your name", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(nameTextFiledIsFocused ? Color.red : Color.blue,lineWidth: 1)
                )
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(UnderlinedTextFieldStyle(leadingIcon: Image(systemName: "magnifyingglass")))
                .padding(.bottom,16)
            
            // run this in simulator to see chnage effect
            TextField("Enter your name", text: $name)
                .focused($nameTextFiledIsFocused)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10).style(
                        withStroke: Color.blue,
                        lineWidth: nameTextFiledIsFocused ? 2 : 0,
                        fill: Color.gray.opacity(0.2)
                    )
                )
            
            
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .strokeBorder(Color.blue , lineWidth: nameTextFiledIsFocused ? 1 : 0)
//                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
//                )
            
                
        }.padding()
    }
}

struct UnderlinedTextFieldStyle : TextFieldStyle{
    var leadingIcon: Image?
    var leadingIconColor: Color?
    var underLineColor:Color = Color.black
    var underLineHeight:CGFloat = 1
    
    func _body(configuration: TextField<Self._Label>) -> some View {

        HStack{
            if let leadingIcon = leadingIcon{
                leadingIcon.foregroundColor(leadingIconColor)
            }
            configuration
                
        }
        .padding(.vertical, 10)
        .background(
            VStack{
                Spacer()
                underLineColor.frame(height: underLineHeight)
            }
        )
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.red)
            .padding(10)
    }
}

extension Shape {
    func style<S: ShapeStyle, F: ShapeStyle>(
        withStroke strokeContent: S,
        lineWidth: CGFloat = 1,
        fill fillContent: F
        
    ) -> some View {
        self.stroke(strokeContent, lineWidth: lineWidth)
            .background(fill(fillContent))
    }
}

struct TextFiledBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFiledBootcamp()
    }
}
