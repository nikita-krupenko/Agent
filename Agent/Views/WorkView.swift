import SwiftUI

struct Profession: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct WorkView: View {
    @State private var selectedProfessions: Set<Profession> = []
    @Binding var kindOfWork: String 
    @Binding var isFullScreen: Bool
    @State private var professions = [
        Profession(name: "Парикмахерские услуги"),
        Profession(name: "Ногтевой сервис"),
        Profession(name: "Маникюр"),
        Profession(name: "Педикюр"),
        Profession(name: "Косметология"),
        Profession(name: "Визиж"),
        Profession(name: "Массаж"),
        Profession(name: "Мастер по бровям"),
        Profession(name: "Наращивание ресниц"),
        Profession(name: "Ламинирование ресниц"),
        Profession(name: "Стилист"),
        Profession(name: "Фотограф"),
        Profession(name: "Преподователь"),
        Profession(name: "Тренер")
       
    ]
    @State private var newProfession: String = ""
    @State private var isAddingProfession = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                  
                        ForEach(professions, id: \.id) { profession in
                            HStack {
                                Text(profession.name)
                                Spacer()
                                if selectedProfessions.contains(profession) {
                                    Image(systemName: "checkmark")
                                }
                            }
                         
                            .onTapGesture {
                                
                                toggleProfession(profession)
                                kindOfWork = selectedProfessions.map { $0.name }.joined(separator: ", ")
                            }
                        }
                    

                    
                        Button(action: {
                            isAddingProfession.toggle()
                        }) {
                            Text("Добавить новую специализацию")
                        }

                        if isAddingProfession {
                            TextField("Enter a new profession", text: $newProfession)
                                .padding()

                            Button(action: {
                                if !newProfession.isEmpty {
                                    let profession = Profession(name: newProfession)
                                    professions.append(profession)
                                    newProfession = ""
                                    isAddingProfession.toggle()
                                }
                            }) {
                                Text("Add Profession")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                    

    //                Section(header: Text("Selected Professions")) {
    //                    Text(selectedProfessions.map { $0.name }.joined(separator: ", "))
    //                        .padding()
    //                }
                }
               
            }.navigationBarTitle("Выбор специализации", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    // Handle back button action here
                    isFullScreen = false
                }) {
                    Image(systemName: "arrow.left")
                    Text("Назад")
                })
        }
        }
        
    


      func toggleProfession(_ profession: Profession) {
        if selectedProfessions.contains(profession) {
            selectedProfessions.remove(profession)
          
        } else {
            selectedProfessions.insert(profession)
            
        }
          
    }
}

struct WorkView_Previews: PreviewProvider {
    @State static var kindOfWork: String = "Initial Kind of Work"
    @State var isFullScreen: Bool = false

    static var previews: some View {
        WorkView(kindOfWork: $kindOfWork, isFullScreen:  .constant(false))
    }
}
