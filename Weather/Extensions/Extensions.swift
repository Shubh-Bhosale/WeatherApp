////
////  NetworkProtocol.swift
////  WeatherApp
////
////  Created by Shubhangi Bhosale on 16/10/24.
////
//
import Foundation
//
//public protocol NetworkSession {
//    func data(for request: URLRequest) async throws -> (Data, URLResponse)
//    func data(from url: URL) async throws -> (Data, URLResponse)
//}
//
//extension URLSession: NetworkSession {
//    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
//        return try await self.data(for: request)
//    }
//    public func data(from url: URL) async throws -> (Data, URLResponse) {
//        return try await self.data(from: url)
//    }
//}
let mf = MeasurementFormatter()

func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
  mf.numberFormatter.maximumFractionDigits = 0
  mf.unitOptions = .providedUnit
  let input = Measurement(value: temp, unit: inputTempType)
  let output = input.converted(to: outputTempType)
  return mf.string(from: output)
}
