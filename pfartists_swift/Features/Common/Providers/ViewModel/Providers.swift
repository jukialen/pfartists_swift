import Foundation
import Supabase

struct Providers {
  var supClient = SupClient()

  func discordLogin() async {
    do {
      let url = try await supClient.auth!.signInWithOAuth(
        provider: .discord,
        scopes: "identify email"
      )
      print(url)
    } catch {
      print("error")
    }
  }
  
  func googleLogin() async {
    do {
      let url = try await supClient.auth!.signInWithOAuth(
        provider: .google,
        scopes: "https://www.googleapis.com/auth/userinfo.email, https://www.googleapis.com/auth/userinfo.profile"
      )
      print(url)
    } catch {
      print("error")
    }
  }
  
  func spotifyLogin() async {
    do {
      let url = try await supClient.auth!.signInWithOAuth(
        provider: .spotify,
        scopes: "user-read-email"
      )
      print(url)
    } catch {
      print("error")
    }
  }
}
