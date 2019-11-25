//
//  CityListView.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import SwiftUI

struct CityListView: View {
    @EnvironmentObject var viewModel: AnyViewModel<CityListState, Never>

    var body: some View {
        NavigationView {
            List(viewModel.cities) { viewModel in
                return NavigationLink(destination: CityDetailView().environmentObject(viewModel)) {
                    CityCell(city: viewModel.city)
                }
            }.navigationBarTitle("Cities")
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
