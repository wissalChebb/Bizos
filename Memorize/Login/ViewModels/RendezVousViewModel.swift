//
//  RendezVousViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 5/12/2022.
//
import Alamofire
import Foundation
import SwiftyJSON

class RendezVousViewModel: ObservableObject{
    let url = path().url
    @Published   var rd : [TaskMetaData] = []
    init() {
       
    }
    
    func getRendezVousByAvocat(idAvocat : String,complited: @escaping(Bool, [TaskMetaData]?) -> Void) {
      
        
        AF.request("http://\(url)/RendezVous/getbyAvocat/\(idAvocat)" , method: .post ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    self.rd = []
                    for singleJsonItem in JSON(response.data!){
                      
                        self.rd.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.rd)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    func makeItem(jsonItem : JSON) -> TaskMetaData {
       
        return TaskMetaData(task: [
            Task(title: "RendezVous !!")],
                 taskDate: DateUtils.formatFromString(string: jsonItem["Date"].stringValue),idUser: jsonItem["idUser"].stringValue,idAvocat: jsonItem["idAvocat"].stringValue)
        
        
        
        
        
        
        /*RendezVous(idUser: jsonItem["idUser"].stringValue,
                          idAvocat: jsonItem["idAvocat"].stringValue,
                          date: DateUtils.formatFromString(string: jsonItem["Date"].stringValue))*/

    }
    func addRendezVous(rendezVous: RendezVous) {
   
        let parametres = [
            "date": DateUtils.formatFromDate(date: rendezVous.date),
            "idUser": rendezVous.idUser,
            "idAvocat":rendezVous.idAvocat
     
        ] as [String : Any]
        AF.request("http://\(url)/RendezVous/add" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
        
    }
}
