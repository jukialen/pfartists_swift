import SwiftUI

struct ProviderButton: View {
//  @EnvironmentObject var userState: UserState
  let providersViewModel = ProvidersViewModel(userState: UserState())
  var icon_name = ""
  var color_name = ""
  func login() async {
    switch icon_name {
      case "google_icon":
        await providersViewModel.googleLogin()
      case "spotify_icon":
        await providersViewModel.spotifyLogin()
      case "discord_icon":
        await providersViewModel.discordLogin()
      default:
        print("Unknown icon")
    }
  }
  
    var body: some View {
      Button(action: {
        Task {
          await login()
        }
      }) {
        Image(icon_name)
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .foregroundColor(Color(color_name))
      }
    }
}

#Preview {
    ProviderButtons()
}
