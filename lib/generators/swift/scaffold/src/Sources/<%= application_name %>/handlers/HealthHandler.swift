import Foundation

import KituraNet
import SwiftyJSON

import StatsD

public class HealthHandler {

  public static func handle(statsD: StatsDProtocol, complete: (status: HTTPStatusCode, data: JSON?) -> Void) -> Void {
    statsD.timer(bucket: "\(Buckets.Application.rawValue).\(Buckets.HealthHandler.rawValue).\(Buckets.Get.rawValue).\(Buckets.Timing.rawValue)") {
      let result = HealthHandlerResponse(statusMessage: "OK")
      complete(status: HTTPStatusCode.OK, data: JSON(result.serialize()))
    }
  }

}
