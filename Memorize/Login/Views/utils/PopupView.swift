//
//  PopupView.swift
//  Memorize
//
//  Created by Apple Esprit on 4/12/2022.
//

import Foundation
import SwiftUI
struct PopupView: View {
    @State var showPopup = false
    @State private var date = Date()
        let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 2021, month: 12, day: 15)
            let endComponents = DateComponents(year: 2021, month: 12, day: 30, hour: 23, minute: 59, second: 59)
            return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
        }()
    var body: some View {
        VStack (spacing: .zero) {
            icon
            title
            DatePicker(
                        "Pick a date",
                        selection: $date,
                        in: dateRange,
                        displayedComponents: [.date, .hourAndMinute])
                        .padding()
                        .datePickerStyle(.graphical)
                        .padding()
                        .accentColor(.orange)
            
        }.padding()
            .multilineTextAlignment(.center)
            .background(.gray).cornerRadius(30)
          
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}

private extension PopupView {
    var icon: some View {
  Image (systemName: "calendar")
    .symbolVariant(.circle.fill)
    .font (.system(size: 50,
    weight: .bold,
                  design: .rounded)
    )
    .foregroundStyle(.primary)
    
           }
           
    var title: some View {
    Text ("Text here")

    .font (
    .system(size: 30,
    weight: .bold,
    design: .rounded)
    )
 
    .padding ()
    }
    
   
          
}
