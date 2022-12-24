
import Foundation
import SwiftUI
struct PopupView: View {
    @Binding var IDAvocat: String
    @Binding var IDUser: String
    @State var showPopup = false
    @ObservedObject  var ViewModel = RendezVousViewModel()
    @State private var date = Date()
        let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startComponents = DateComponents(year: 2022, month: 12, day: 15)
            let endComponents = DateComponents(year: 2023, month: 12, day: 30, hour: 23, minute: 59, second: 59)
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
            Button("save") {
                ViewModel.addRendezVous(rendezVous: RendezVous(idUser: IDUser, idAvocat: IDAvocat, date: date))
                
            }.accentColor(.black)
                .padding(40)
                        
            
        }.padding()
            .multilineTextAlignment(.center)
            .background(Color(uiColor: UIColor(red: 0.969, green: 0.949, blue: 0.886, alpha: 1))).cornerRadius(30)
            .padding([.leading,.trailing],27.5)
          
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
    Text ("Pick a date")

    .font (
    .system(size: 30,
    weight: .bold,
    design: .rounded)
    )
 
    .padding ()
    }
    
   
          
}
