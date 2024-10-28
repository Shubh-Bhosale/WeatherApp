//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//
import SwiftUI
@MainActor
class SearchViewModel : ObservableObject {
    @Published var searchModel : SearchModel = SearchModel()
        
        func searchByCity(cityName: String) async {
            let apiKey = "2d9052c1c8adb192f239b4d4360015a4"
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)")!
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                    self.searchModel = try decoder.decode(SearchModel.self, from: data)
                    print(self.searchModel)
            } catch {
                print(error)
            }
        }
    
    func createIconURL(iconId: String) -> URL{
        return URL(string: "https://openweathermap.org/img/wn/\(iconId)@2x.png") ?? URL(string: "https://openweathermap.org/img/wn/04d@2x.png")!
    }
    
    func getTempInCelsius(tempInKelvin: Double) -> String{
        let celsius = convertTemp(temp: tempInKelvin, from: .kelvin, to: .celsius)
        return celsius
    }
    
}
