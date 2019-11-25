//
//  CityCell.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import SwiftUI

struct CityCell: View {
    let city: String

    var body: some View {
        Text(city)
    }
}

struct CityCell_Previews: PreviewProvider {
    static var previews: some View {
        CityCell(city: "London")
    }
}
