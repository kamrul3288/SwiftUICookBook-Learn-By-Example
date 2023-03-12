//
//  BottomSheetBG.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 12/3/23.
//

import SwiftUI
struct BottomSheetBG : UIViewRepresentable{
    var style:UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct CustomBottomSheetCorner : Shape{
    var corners:UIRectCorner
    var radius:CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
