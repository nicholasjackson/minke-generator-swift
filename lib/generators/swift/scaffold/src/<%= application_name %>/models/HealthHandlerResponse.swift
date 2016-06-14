import Foundation
import SwiftyJSON

struct HealthHandlerResponse {
  let statusMessage:String

  init(statusMessage:String) {
    self.statusMessage = statusMessage
  }

  func serialize() -> JSONDictionary {
    return ["status_message": statusMessage]
  }
}
