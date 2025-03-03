import Foundation

class KeychainManager {
  static let shared = KeychainManager()

  func save(key: String, value: String) -> Bool {
    let data = Data(value.utf8)
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: "com.jukialen.pfartists_swift", // Użyj tej samej nazwy usługi, którą masz w Keychain
      kSecAttrAccount as String: key,
      kSecValueData as String: data
    ]

    // Usuń istniejący element, jeśli istnieje
    SecItemDelete(query as CFDictionary)
    let status = SecItemAdd(query as CFDictionary, nil)
    return status == errSecSuccess
  }

  func load(key: String) -> String? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: "com.jukialen.pfartists_swift", // Użyj tej samej nazwy usługi, którą masz w Keychain
      kSecAttrAccount as String: key,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne
    ]

    var dataTypeRef: AnyObject? = nil
    let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

    if status == errSecSuccess,
       let data = dataTypeRef as? Data,
       let result = String(data: data, encoding: .utf8) {
        return result
    } else {
        print("Keychain read failed with error \(status)")
    }
    return nil
  }
 
  func delete(key: String) -> Bool {
    let query: [String: Any] = [
      kSecClass as String             : kSecClassGenericPassword,
      kSecAttrService as String       : Bundle.main.bundleIdentifier ?? "com.jukialen.pfartists_swift",
      kSecAttrAccount as String       : key
    ]

    let status = SecItemDelete(query as CFDictionary)
    return status == errSecSuccess
  }
}
