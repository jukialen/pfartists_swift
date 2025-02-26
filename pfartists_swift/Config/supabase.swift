import Foundation
import Supabase

struct SupClient {
  
  var supabaseClientId: String?
      var supabaseKey: String?
      var client: SupabaseClient?
  
  enum UserResult {
    case user(UserType)
    case noUser
  }
  
  mutating func initializeSupabaseClient() {
          guard let clientId = KeychainManager.shared.load(key: "supabaseClientId"),
                let key = KeychainManager.shared.load(key: "supabaseKey"),
                let url = URL(string: clientId) else {
              print("Failed to load Supabase credentials or create URL.")
              return
          }
          self.supabaseClientId = clientId
          self.supabaseKey = key
          self.client = SupabaseClient(supabaseURL: url, supabaseKey: key)
      }
  
  mutating func userExist() async -> User? {
    initializeSupabaseClient()
    
      do {
        let user: User? = try await client?.auth.user()
          if let user = user {
              print("User: \(user)")
          } else {
              print("User is nil")
          }
      } catch {
          print("An error occurred: \(error.localizedDescription)")
      }
  return nil
  }
  
  mutating func userData() async -> UserResult {
    let user: User? = await userExist();
    
    if let user = user {
      print("User: \(user)")
      
      do {
        let data: PostgrestResponse<UserType>? = try await client?
          .from("Users")
          .select("*")
          .eq("id", value: user.id)
          .limit(1)
          .single()
          .execute()
        
        
        if let _users = data?.value {
          return .user(_users)
        } else {
          print("The user exists but has no data")
          return .noUser
        }
      } catch {
        print("An error occurred while fetching user data: \(error.localizedDescription)")
        return .noUser
      }
      
    } else {
      print("User is nil")
      return .noUser
    }
  }
}
