//
//  Coord.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//

struct Coord: Codable {

  var lon : Double? = nil
  var lat : Double? = nil

  enum CodingKeys: String, CodingKey {

    case lon = "lon"
    case lat = "lat"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    lon = try values.decodeIfPresent(Double.self , forKey: .lon )
    lat = try values.decodeIfPresent(Double.self , forKey: .lat )
 
  }

  init() {

  }

}
