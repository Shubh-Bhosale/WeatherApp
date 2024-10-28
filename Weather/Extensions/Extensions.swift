////
////  NetworkProtocol.swift
////  WeatherApp
////
////  Created by Shubhangi Bhosale on 16/10/24.
////
//
import Foundation

let mf = MeasurementFormatter()

func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
  mf.numberFormatter.maximumFractionDigits = 0
  mf.unitOptions = .providedUnit
  let input = Measurement(value: temp, unit: inputTempType)
  let output = input.converted(to: outputTempType)
  return mf.string(from: output)
}
