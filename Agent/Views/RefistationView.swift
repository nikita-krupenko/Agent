//
//  RefistationView.swift
//  Agent
//
//  Created by nikita on 04.10.2023.
//

import SwiftUI

struct RefistationView: View {
    @State private var name: String = ""
    @State private var surName: String = ""
    @State private var email: String = ""
    @State private var instagram: String = ""
    @State private var telegram: String = ""
    //@State var dataPicker: Bool = false
    

    @State  var isDatePickerVisible: Bool = false

    @State private var selectedDate = Date()
    @State private var buttonText = "Дата рождения"
 
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    FFIO(textName: $name, titleName: "Имя")
                        .onTapGesture {
                                            isDatePickerVisible = false
                                        }
                        .onChange(of: name) { _ in
                                            isDatePickerVisible = false
                                        }
                    FFIO(textName: $surName, titleName: "Фамилия")
                        .onChange(of: surName) { _ in
                                            isDatePickerVisible = false
                                        }
                        .onTapGesture {
                                            isDatePickerVisible = false
                                        }
                        
                    SelectDate(isDatePickerVisible: $isDatePickerVisible)
                      
                    SelectWork()
                        .onTapGesture {
                                            isDatePickerVisible = false
                                        }
                    FFIO(textName: $email, titleName: "Электронная почта")
                    Text("Электоронная почта нужна для восстановления аккаунта вашего аккаунта,в случае забытия пароля или логина")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom,20)
                    FFIO(textName: $instagram, titleName: "Инстаграмм")
                    FFIO(textName: $telegram, titleName: "Телеграмм")
                  //  NavigationLink("Специализация", destination: EnterView())
                        // Spacer()
                }.navigationTitle("Ваш профиль")
                    .padding(.leading,15)
                    .onTapGesture {
//                        isDatePickerVisible = false
            }
             }
           
        }
    }
    
}

struct RefistationView_Previews: PreviewProvider {
    static var previews: some View {
        RefistationView()
    }
}

struct FFIO:View{
    @Binding var textName: String
    @State var titleName: String
//    @State private var isDatePickerVisible = false
    var body: some View{
       
        VStack(alignment: .leading, spacing: 0) {
            if textName.isEmpty{
                Text(" ")
            }else{
                Text(titleName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            TextField(titleName, text: $textName)
                .foregroundColor(.black)
                .frame(height: 25)
                .fontWeight(.medium)

                
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.848))
            
            
           
        }.frame(height: 45)
        
    }
    }

struct SelectDate: View {
    @State private var selectedDate = Date()
    @Binding  var isDatePickerVisible: Bool
    @State private var isDateSelected: Bool = false
    @State private var buttonText = "Выбери дату рождения"

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !isDateSelected{
                Text(" ")
                    .padding(.bottom ,-17)
            }else{
                Text("Дата рождения")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, -17)
            }
            Button(action: {
                // Toggle the DatePicker visibilitynm n
                self.isDatePickerVisible.toggle()
            }) {
                Text(buttonText)
                    .foregroundColor(isDateSelected ? Color.black : Color(hue: 1.0, saturation: 0.0, brightness: 0.748))
                    .frame(height: 55)
                    .fontWeight(.medium)
                    
            }
            .padding(.bottom, -12.5)

            Rectangle()
                .frame(height: 0.1)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.848))

            Divider()

            if isDatePickerVisible {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding()
                    .onChange(of: selectedDate) { value in
                        // Update the button text to the selected date
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .medium
                        self.buttonText = dateFormatter.string(from: value)

                        // Update the text color to black when a date is selected
                        self.isDateSelected = true
                    }
            }
        }
        .frame(height: isDatePickerVisible ? 250 : 0)
        .padding(.top, 20)
        .animation(.easeInOut)
    }
   
}


struct SelectWork: View{
    @State var kindOfWork: String = "Специализация"
    @State  var isDatePickerVisible: Bool = false
    var body: some View{
        VStack {
            HStack(spacing: 0) {
                NavigationLink(kindOfWork, destination: WorkView(kindOfWork: $kindOfWork))
                    .onTapGesture {
                                        isDatePickerVisible = false
                                    }
                   
                    .padding(.top,45)
                    .fontWeight(.medium)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.748))
                
                Spacer()
                
            }
        }
        
    }
}
