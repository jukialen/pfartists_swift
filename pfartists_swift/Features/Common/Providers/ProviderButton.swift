import SwiftUI

struct ProviderButton: View {
  let providersLogin = Providers()

  var icon_name = ""
  var color_name = ""
  func login() async {
    switch icon_name {
      case "google_icon":
        await providersLogin.googleLogin()
      case "spotify_icon":
        await providersLogin.spotifyLogin()
      case "discord_icon":
        await providersLogin.discordLogin()
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
