import SwiftUI

struct er: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var showDatePicker = false
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            VStack {
                TextField("Enter text 1", text: $text1)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter text 2", text: $text2)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    showDatePicker.toggle()
                }) {
                    Text("Open DatePicker")
                }
                .padding()
            }
        }
    }
}
