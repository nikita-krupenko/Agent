//
//  TextButton.swift
//  Agent
//
//  Created by nikita on 17.10.2023.
//

import SwiftUI
/// Button
struct TextButton: ViewModifier {
    // MARK: - Properties
    let font: Font
    let colorForgr: Color
    let height: CGFloat
    let width: CGFloat
    let colorBack: Color
    let cornerRadius: CGFloat
    // MARK: - Content
    func body(content: Content) -> some View {
        content
           // .padding()
            .frame(height: height)
            .frame(maxWidth: width)
            .font(font)
            .foregroundColor(colorForgr)
            .background(colorBack)
           
            
            .cornerRadius(cornerRadius)
        
        //            .font(.headline)
        //            .foregroundColor(.purple)
        //            .frame(height: 55)
        //            .frame(maxWidth: .infinity)
        //            .background(Color.white)
        //            .cornerRadius(10)
    }
    
}

public extension View {
    /// Белый TextField
    func textButton(
        width: CGFloat = .infinity,
        height: CGFloat = 55,
        colorBack: Color = .white,
        colorForgr: Color = .purple,
        cornerRadius: CGFloat = 10,
        font: Font = .headline
    ) -> some View {
        modifier(TextButton(font: font, colorForgr: colorForgr, height: height, width: width, colorBack: colorBack, cornerRadius: cornerRadius))
    }
}
