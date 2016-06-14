import Foundation
import StatsD
import LoggerAPI

class Metrics {

  func setupStatsD() -> StatsD {
    return StatsD(
      host: config!["statsd"]["host"].stringValue,
      port: config!["statsd"]["port"].intValue,
      socket: UDPSocket(),
      interval: 1.0,
       sendCallback: { (success: Bool, error: SocketError?) in
         if success {
           Log.info("Sent data to StatsD")
         } else {
           Log.error("Failed to send data to StatsD \(error)")
         }
       }
    )
  }

}
