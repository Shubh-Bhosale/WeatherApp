//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var viewModel : SearchViewModel
    
    var body: some View {
            VStack{
                HStack {
                    AsyncImage(url: viewModel.createIconURL(iconId: viewModel.searchModel.weather?[0].icon ?? "")) { result in
                        result.image?.resizable()
                        
                    }
                    .frame(width: 25, height: 25)
                    
                    
                    Text("\(String(describing: viewModel.searchModel.weather?.isEmpty ?? true ? "empty" : viewModel.searchModel.weather?[0].main ?? ""))")
                        .frame(height: 25, alignment: .topLeading)
                        .fontWeight(.regular)
                    
                    Text("\(String(describing: viewModel.searchModel.weather?.isEmpty ?? true ? "empty" : viewModel.searchModel.weather?[0].description ?? ""))")
                        .frame(height: 25, alignment: .topLeading)
                        .fontWeight(.semibold)
                }
            }
            .frame(height: 50)
            .padding(10)
            Spacer()
    }
}

#Preview {
    WeatherView()
}
