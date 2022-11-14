import Foundation

// MARK: - Welcome



struct SignInRequest:Encodable{
    var mail : String?
    var password : String?
}
struct ResponseSignIn: Decodable {
    var message: String
    var user: User
    var token : String
}
/*
struct User: Decodable {
    let id, firstName, lastName, email: String
    let password: String
    let verified: Bool
    let createdAt, updatedAt: String
    let v: Int
    let code: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password, verified, createdAt, updatedAt
        case v = "__v"
        case code
    }
}*/
struct User: Decodable {
    let id, firstName, lastName, email,image : String
    let password: String
 
   
    
}

