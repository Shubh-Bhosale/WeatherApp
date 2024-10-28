//
//  Clouds.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//

struct Clouds: Codable {

  var all : Int? = nil

  enum CodingKeys: String, CodingKey {

    case all = "all"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    all = try values.decodeIfPresent(Int.self , forKey: .all )
 
  }

  init() {

  }

}
