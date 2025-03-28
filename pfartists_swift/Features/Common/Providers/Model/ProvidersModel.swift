struct ProviderType {
    let iconName: String
    let colorName: String
}

struct UserType: Decodable, Encodable, Time {
  var id: String?
  var username: String?
  var pseudonym: String
  var description: String?
  var profilePhoto: String?
  var email: String
  var plan: Plan
  var provider: Provider?
  var createdAt: String?
  var updatedAt: String?
  }
