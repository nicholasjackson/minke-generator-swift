#if os(OSX)
  typealias JSONDictionary = [String: AnyObject]
#else
  typealias JSONDictionary = [String: Any]
#endif
