import Foundation

struct RegistrationTwoStageType {
  var username: String?
  var pseudonym: String
  var description: String?
  var profilePhoto: URL?
  var createdAt: String?
  var updatedAt: String?
  var provider: Provider?
}

enum RegistrationTwoStageModel {
  case username, pseudonym, profilePhoto, description
}
