//
//  Rectangle.swift
//  Agent
//
//  Created by nikita on 17.10.2023.
//

import SwiftUI

struct RectangleColor: ViewModifier {
    let height: CGFloat
    let color: Color
    func body(content: Content) -> some View {
        content
        // .padding()
            .frame(height: height)
            .foregroundColor(color)
           
    }
}
public extension View {
    /// Белый TextField
    func rectangleColor(
        
        height: CGFloat = 0.5,
        color: Color = Color(hue: 1.0, saturation: 0.0, brightness: 0.848)
    ) -> some View {
        modifier(RectangleColor(height: height, color: color))
    }
    
    
}


//    .frame(height: 0.5)
//    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.848))
