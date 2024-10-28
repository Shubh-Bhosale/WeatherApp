//
//  TempView.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 16/10/24.
//

import SwiftUI

struct TempView: View {
    @EnvironmentObject var viewModel : SearchViewModel
    var body: some View {
    
        VStack(alignment: .leading) {
            Text("Temp : \(viewModel.getTempInCelsius(tempInKelvin: viewModel.searchModel.main?.temp ?? 0.0))")
            Text("Pressure : \(viewModel.searchModel.main?.pressure ?? 0) hPa")
            Text("Humidity : \(viewModel.searchModel.main?.humidity ?? 0) %")
        }
        .padding(10)
        .background(Color.cyan)
        Spacer()
        
    }
}

#Preview {
    TempView()
}
