import Foundation

// MARK: - Welcome
struct Response: Codable {
    let message: String
    let user: User
}
struct User: Codable {
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
}
