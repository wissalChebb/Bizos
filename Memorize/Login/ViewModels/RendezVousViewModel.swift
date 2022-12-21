//
//  RendezVousViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 5/12/2022.
//
import Alamofire
let url = path().url
func addPack(rendezVous: RendezVous) {

    let parametres = [
        "date": rendezVous.date,
        "idUser": rendezVous.date,
        "date": rendezVous.date
 
    ] as [String : Any]
    AF.request("http://\(url)/pack/add" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
