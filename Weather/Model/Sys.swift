//
//  Sys.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//
import Foundation

struct Sys: Codable {

  var type    : Int?    = nil
  var id      : Int?    = nil
  var country : String? = nil
    var sunrise : Date?    = nil
    var sunset  : Date?    = nil

  enum CodingKeys: String, CodingKey {

    case type    = "type"
    case id      = "id"
    case country = "country"
    case sunrise = "sunrise"
    case sunset  = "sunset"
  
  }

    init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    type    = try values.decodeIfPresent(Int.self    , forKey: .type    )
    id      = try values.decodeIfPresent(Int.self    , forKey: .id      )
    country = try values.decodeIfPresent(String.self , forKey: .country )
      sunrise = try values.decodeIfPresent(Date.self    , forKey: .sunrise )
      sunset  = try values.decodeIfPresent(Date.self    , forKey: .sunset  )
 
  }

  init() {

  }

}


extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}

extension JSONDecoder.DateDecodingStrategy {
    static let multiple = custom {
        let container = try $0.singleValueContainer()
        do {
            return try Date(timeIntervalSince1970: container.decode(Double.self))
        } catch DecodingError.typeMismatch {
            let string = try container.decode(String.self)
            if let date = Formatter.iso8601.date(from: string) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
        }
    }
}
