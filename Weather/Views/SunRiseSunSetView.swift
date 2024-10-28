//
//  SunRiseSunSetView.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//

import SwiftUI

struct SunRiseSunSetView: View {
    @EnvironmentObject var viewModel : SearchViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Sun Rise")
                    .frame(alignment: .leading)
                    .fontWeight(.bold)
                Text(viewModel.searchModel.sys?.sunrise ?? Date(), style: .time)
                    .fontWeight(.semibold)
            }
            
            HStack{
                Text("Sun Set")
                    .fontWeight(.bold)
                Text(viewModel.searchModel.sys?.sunset ?? Date(), style: .time)
                    .fontWeight(.semibold)
            }
            
        }
        .frame(height: 50)
        .padding(10)
        .background(Color.cyan)
        Spacer()
    }
}

#Preview {
    SunRiseSunSetView()
}
