import Supabase
import Foundation

class SupClient {
  var supabaseClientId: String?
  var supabaseKey: String?
  var client: SupabaseClient?
  var authClient: AuthClient?
  let constants = Constants.shared.loadConfig()
  enum UserResult {
    case user(UserType)
    case noUser
  }
  
  init() {
    self.supabaseClientId = constants!["SupabaseURL"]
    self.supabaseKey = constants!["SupabaseKey"]
  }
  
  func initializeSupabaseClient() {
    guard let clientId = supabaseClientId, let key = supabaseKey, let url = URL(string: clientId) else {
      print("Brak wymaganych poświadczeń do inicjalizacji SupabaseClient.")
      return
    }
    
    self.client = SupabaseClient(supabaseURL: url, supabaseKey: key)
    if let authClient = self.client?.auth {
            print("Auth został poprawnie zainicjalizowany: \(authClient)")
        } else {
            print("Auth jest nil.")
        }
    print("SupabaseClient został zainicjalizowany pomyślnie.")
  }

  func getSession() async {
    do {
      let result = try await authClient?.session
      print("Session: \(String(describing: result?.user))")
    } catch {
      print("Session error: \(error.localizedDescription)")
    }
  }
    
  func userExist() async -> User? {
    initializeSupabaseClient()
        
    do {
      let user: User? = try await authClient?.user()
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
