//
//  MainView.swift
//  Agent
//
//  Created by nikita on 04.10.2023.
//

import SwiftUI

struct MainView: View {
    @State var ondobordingState: Int = 0
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea(.all)
            ZStack{
                switch ondobordingState{
                case 0 :
                 EnterView()
                case 1 :
                 EnterView()
                default:
                    RoundedRectangle(cornerRadius: 4.0)
                }
            }
           
            }
        }
    }



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
