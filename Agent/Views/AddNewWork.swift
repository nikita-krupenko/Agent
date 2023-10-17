//
//  AddNewWork.swift
//  Agent
//
//  Created by nikita on 17.10.2023.
//

import SwiftUI

struct AddNewWork: View {
    @Binding var newWork: String 
    @Binding var professions: [Profession]
    @Binding  var isAddingProfession: Bool
    
    
    
    var body: some View {
        
        NavigationView {
            VStack{
              TextField("Введите" , text: $newWork)
                Button("Добавить") {
                        professions.append(Profession(name: newWork))
                    }
            }.navigationBarTitle("Выбор специализации", displayMode: .inline)
                .navigationBarItems(leading:
          
                                        Button(action: {
                   
                    isAddingProfession = false
                 
                }) {
                    Image(systemName: "arrow.left")
                    
                })
        }
        }
       
    }
    


struct AddNewWork_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWork(newWork: .constant(""), professions: .constant([]), isAddingProfession: .constant(false))
    }
}
