//
//  File.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 23..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation
import UIKit

struct Weather: Identifiable, Decodable {
    var id = UUID()
    var main: String
    var description: String
    var icon: String
    var image: UIImage

    private enum CodingKeys: CodingKey {
        case main, description, icon
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        main = try container.decode(String.self, forKey: .main)
        description = try container.decode(String.self, forKey: .description)
        icon = try container.decode(String.self, forKey: .icon)
        guard let image = UIImage(named: icon) else {
            fatalError()
        }
        self.image = image
    }
}
