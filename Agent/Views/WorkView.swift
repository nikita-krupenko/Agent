import SwiftUI

struct Profession: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct WorkView: View {
    @State private var selectedProfessions: Set<Profession> = []
    @Binding var kindOfWork: String
    @Binding var isFullScreen: Bool
    @Binding  var isDatePickerVisible: Bool
    @State var professions = [
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
    @State  var isAddingProfession = false
    
    
    @State var newWork: String = ""
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
                    }.fullScreenCover(isPresented: $isAddingProfession) {
                        AddNewWork(newWork: $newWork, professions: $professions, isAddingProfession: $isAddingProfession)
                    }
                  
                }
                

            }.navigationBarTitle("Выбор специализации", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    // Handle back button action here
                    isFullScreen = false
                   
                }) {
                    Image(systemName: "arrow.left")
                    
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
        WorkView(kindOfWork: $kindOfWork, isFullScreen:  .constant(false), isDatePickerVisible: .constant(false))
    }
}


