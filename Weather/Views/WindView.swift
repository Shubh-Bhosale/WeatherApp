//
//  WindView.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 16/10/24.
//

import SwiftUI

struct WindView: View {
    @EnvironmentObject var viewModel : SearchViewModel
    var body: some View {
        let speed = String(format: "%.2f", viewModel.searchModel.wind?.speed ?? 0.0)
        VStack(alignment: .leading) {
            Text("Wind: \(speed) KPH")
            
            HStack {
                Text("Visibility: ")
                    .frame(alignment: .trailing)
                Text("\(viewModel.searchModel.visibility ?? 0) meter")
                    .fontWeight(.medium)
            }
        }
        .padding(10)
        Spacer()
    }
}

#Preview {
    WindView()
}
