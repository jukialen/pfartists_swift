import SwiftUI

@MainActor
class UserState: ObservableObject {
  @Published var isLoggedIn: Bool = false

  var supClient = SupClient()

  init() {
    Task {
      await initAsync()
    }
  }

  func initAsync() async {
    self.isLoggedIn = await supClient.userExist() != nil
  }
  
  func logIn() {
    isLoggedIn = true
  }
  
  func logOut() {
    isLoggedIn = false
  }
}
