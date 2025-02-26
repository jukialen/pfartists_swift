import Security
import Foundation

class KeychainManager {

    static let shared = KeychainManager()
    private init() {}

    func load(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String             : kSecClassGenericPassword,
            kSecAttrService as String       : Bundle.main.bundleIdentifier ?? "com.pfartists_swift",
            kSecAttrAccount as String       : key,
            kSecReturnData as String        : true,
            kSecMatchLimit as String        : kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject? = nil
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess,
           let data = dataTypeRef as? Data,
           let result = String(data: data, encoding: .utf8) {
            return result
        }
        return nil
    }

    func delete(key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String             : kSecClassGenericPassword,
            kSecAttrService as String       : Bundle.main.bundleIdentifier ?? "com.pfartists_swift",
            kSecAttrAccount as String       : key
        ]

        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
