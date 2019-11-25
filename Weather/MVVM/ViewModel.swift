//
//  ViewModel.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Foundation

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input

    func trigger(_ input: Input)
    var state: State { get }
}
