import SwiftUI

class LoginViewModel: ObservableObject {
  @Published var siteUrl: String = ""
  
  init() {
    let constants = Constants.shared.loadConfig()
    siteUrl = constants?["siteUrl"] ?? "No Url"
  }
}
