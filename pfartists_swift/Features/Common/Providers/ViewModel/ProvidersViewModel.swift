import Foundation
import SwiftUICore
import GoogleSignIn
import UIKit
import Supabase

class ProvidersViewModel {
    var userState: UserState // Jeśli korzystasz w widokach SwiftUI
    var supClient: SupClient
    let googleClientId: String?

    init(userState: UserState, supClient: SupClient = SupClient()) {
        self.userState = userState
        self.supClient = supClient
        
        // Inicjalizacja googleClientId
        let constants = Constants.shared.loadConfig()
        self.googleClientId = constants?["googleClientId"]
        
        print("ProvidersViewModel zainicjalizowany z googleClientId: \(googleClientId ?? "Brak ID")")
    }

  func getVisibleViewController(from viewController: UIViewController) -> UIViewController {
      if let presentedVC = viewController.presentedViewController {
          return getVisibleViewController(from: presentedVC)
      }
      if let navigationController = viewController as? UINavigationController {
          return navigationController.visibleViewController ?? viewController
      }
      if let tabBarController = viewController as? UITabBarController,
         let selectedVC = tabBarController.selectedViewController {
          return getVisibleViewController(from: selectedVC)
      }
      return viewController
  }

  
    func getTopViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }),
              let rootVC = window.rootViewController else {
            return nil
        }
        return getVisibleViewController(from: rootVC)
    }

    func googleLogin() async {
      
      do {
        guard let topVC = getTopViewController() else {
            print("Nie znaleziono aktywnego widoku kontrolera.")
            return
        }
        
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
            guard let idToken = result.user.idToken?.tokenString else {
              print("No idToken found.")
              return
            }
        print("result \(result)")
        let accessToken = result.user.accessToken.tokenString
        print("idToken \(idToken)")
        print("accessToken \(accessToken)")
        let isUser = try await supClient.client?.auth.signInWithIdToken(
              credentials: OpenIDConnectCredentials(
                provider: .google,
                idToken: idToken,
                accessToken: accessToken
              )
            )
        
        print("isUser: \(String(describing: isUser))")
        
        let user = UserType(
          id: result.user.userID,
          username: result.user.profile!.name,
          pseudonym: result.user.profile!.name,
          description: "",
          profilePhoto: result.user.profile!
            .imageURL(
              withDimension: 200
            )?.absoluteString ?? "",
          email: result.user.profile!.email,
          plan: .FREE,
          provider: .google
        )
        
        let userData = try JSONEncoder().encode(user)
        print("Encoded user: \(String(data: userData, encoding: .utf8) ?? "Encoding failed")")
        
        
        print("session: \(await supClient.getSession())")
        print("User: \(userData)")
        
        let newUser = try await supClient.client?
          .from("Users")
          .insert(userData)
          .execute()
        
        print(
          "new user: \(String(describing: newUser?.response.description))."
        )
//                    await self.userState.logIn()
      } catch {
        print(
          "Google login error: \(error.localizedDescription)"
        )
      }
    }

    func discordLogin() async {
        do {
          await supClient.getSession()

          if let authClient = supClient.authClient {
            let result = try await authClient.signInWithOAuth(
              provider: .github,
              scopes: "identify email"
            )
            print(result)
          } else {
              print("authClient is nil")
            }
        } catch {
          print("Błąd logowania Discord")
        }
    }

    func spotifyLogin() async {
        do {
            // Implementacja logowania Spotify
        } catch {
            print("Błąd logowania Spotify")
        }
    }
}
