//
//  SearchView.swift
//  WeatherApp
//
//  Created by Shubhangi Bhosale on 15/10/24.
//

import SwiftUI
import Combine

struct SearchView: View {
    @EnvironmentObject var viewModel : SearchViewModel
    @State var searchedText : String = ""
    
    var body: some View {
        GeometryReader { reader in
            
      
            VStack {
                TextField("Search", text: $searchedText)
                    .textFieldStyle(.roundedBorder)
                    .border(.black)
                    .padding(10)
                    .onChange(of: searchedText) { oldValue, newValue in
                        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5){
                            searchByCity()
                        }
                    }
            }
            .frame(height: 30)
            Spacer()
        }
        .background(Color.cyan)
    }
    
    func searchByCity() {
        Task{
            await viewModel.searchByCity(cityName: searchedText)
        }
    }
}

#Preview {
    SearchView()
}
