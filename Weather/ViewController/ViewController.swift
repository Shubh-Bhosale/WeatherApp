//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 16/10/24.
//

import SwiftUI

struct ViewController: View {
    @EnvironmentObject var viewModel : SearchViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchView()
                .frame(height: 30)
            
            if viewModel.searchModel.id != nil {
                HStack(spacing: 10){
                    Text("City : ")
                    Text("\(String(describing: viewModel.searchModel.name ?? ""))")
                        .fontWeight(.medium)
                    
                }
                .frame(height: 50)
                .padding(10)
                
                SunRiseSunSetView()
                    .frame(height: 30)
                
                WeatherView()
                    .frame(height: 20)
                
                TempView()
                    .frame(height: 40)
                
                WindView()
                    .frame(height: 10)
            }
            
        }
        Spacer()
    }
}

#Preview {
    ViewController()
}
