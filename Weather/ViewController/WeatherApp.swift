//
//  WeatherApp.swift
//  Weather
//
//  Created by Shubhangi Bhosale on 16/10/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ViewController().environmentObject(SearchViewModel()).background(Color.cyan)
        }
    }
}
