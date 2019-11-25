//
//  CityDetailView.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import SwiftUI

struct CityDetailView: View {
    @EnvironmentObject var viewModel: AnyViewModel<CityDetailState, Never>

    var body: some View {
        List(viewModel.details) { detail in
            CityDetailCell().environmentObject(detail)
        }
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView()
    }
}
