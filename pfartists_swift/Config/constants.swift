import Foundation

class Constants {
  
  static let shared = Constants()
  
  private init() {}
  
  func loadConfig() -> [String: String]? {
    guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
      let plist = NSDictionary(contentsOfFile: path) as? [String: String] else {
    return nil
    }
  return plist
  }
}
