//
//  agenda.swift
//  Memorize
//
//  Created by Mac2021 on 10/12/2022.
//

import SwiftUI

struct agenda: View {
    @State var currentData : Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20)
            {
                CustomDatePicker(currentDate: $currentData)
                
            }.padding(.vertical)
        }
        .safeAreaInset(edge: .bottom){
            HStack{
                Button {
                    tasks.append(TaskMetaData(task: [
                        Task(title: "new task")],taskDate: currentData,idUser: "", idAvocat: ""))
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("bg1"),in: Capsule())
                }
                Button {
                    
                } label: {
                    Text("Add Remainder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("bg1"),in: Capsule())
                }

            }.padding(.horizontal)
                .padding(.top,10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
        }
    }
}

struct agenda_Previews: PreviewProvider {
    static var previews: some View {
        agenda()
    }
}
