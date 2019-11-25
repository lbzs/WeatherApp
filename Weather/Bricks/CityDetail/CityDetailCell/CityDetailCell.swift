//
//  CityDetailCell.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 24..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import SwiftUI

struct CityDetailCell: View {
    @EnvironmentObject var viewModel: AnyViewModel<CityDetailCellState, Never>

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Text(MeasureFormatterUtil.format(value: viewModel.temperature)).font(.system(size: 50))
                Spacer()
                Text(viewModel.description)
                Spacer()
                Text(DateFormatterUtil.getFormattedDate(viewModel.date))
            }

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.forecast) { forecast in
                        VStack {
                            Image(uiImage: forecast.weather.first!.image)
                            Text(MeasureFormatterUtil.format(value: Int(forecast.temperature.overallTemp)))
                            Text("\(DateFormatterUtil.getFormattedHour(forecast.time))")
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 2))
        .navigationBarTitle("Three days forecast")
    }
}

struct CityDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailCell()
    }
}
