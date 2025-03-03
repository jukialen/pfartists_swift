import Supabase
import Foundation
import SwiftDotenv

class SupClient {
  var supabaseClientId: String?
  var supabaseKey: String?
  var client: SupabaseClient?
  
  enum UserResult {
    case user(UserType)
    case noUser
  }
  
  init() {
    if let config = loadConfig(),
       let clientId = config["SupabaseURL"] as? String, let key = config["SupabaseKey"] as? String {
      self.supabaseClientId = clientId
      self.supabaseKey = key
      print("Poświadczenia Supabase zostały załadowane pomyślnie.")
    } else {
      print("Nie udało się załadować poświadczeń Supabase z konfiguracji.")
    }
  }
  
  func initializeSupabaseClient() {
    guard let clientId = supabaseClientId, let key = supabaseKey, let url = URL(string: clientId) else {
      print("Brak wymaganych poświadczeń do inicjalizacji SupabaseClient.")
      return
    }
    
    self.client = SupabaseClient(supabaseURL: url, supabaseKey: key)
    print("SupabaseClient został zainicjalizowany pomyślnie.")
  }
  
  private func loadConfig() -> [String: Any]? {
    if let url = Bundle.main.url(forResource: "Config", withExtension: "plist"),
       let data = try? Data(contentsOf: url),
       let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
       let config = plist as? [String: Any] {
      return config
    }
    return nil
  }
    
  func userExist() async -> User? {
    initializeSupabaseClient()
    
    guard let client = client else {
      print("SupabaseClient nie został zainicjalizowany.")
      return nil
    }
    
    do {
      let user: User? = try await client.auth.user()
      if let user = user {
        print("Użytkownik: \(user)")
        return user
      } else {
        print("Brak zalogowanego użytkownika.")
      }
    } catch {
      print("Wystąpił błąd: \(error.localizedDescription)")
    }
    
    return nil
  }
    
  func userData() async -> UserResult {
    guard let user = await userExist() else {
      print("Brak zalogowanego użytkownika.")
      return .noUser
    }
    
    do {
      let data: PostgrestResponse<UserType>? = try await client?
        .from("Users")
        .select("*")
        .eq("id", value: user.id)
        .limit(1)
        .single()
        .execute()
      
      if let userData = data?.value {
        print("Dane użytkownika zostały pobrane pomyślnie.")
        return .user(userData)
      } else {
        print("Użytkownik istnieje, ale brak danych.")
        return .noUser
      }
    } catch {
      print("Wystąpił błąd podczas pobierania danych użytkownika: \(error.localizedDescription)")
      return .noUser
    }
  }
}
