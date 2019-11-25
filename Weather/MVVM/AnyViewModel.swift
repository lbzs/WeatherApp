//
//  AnyViewModel.swift
//  Weather
//
//  Created by Balint Zsombor Lakatos on 2019. 11. 22..
//  Copyright © 2019. Balint Zsombor Lakatos. All rights reserved.
//

import Combine

@dynamicMemberLookup
final class AnyViewModel<State, Input>: ObservableObject {

    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void

    var objectWillChange: some Publisher {
        wrappedObjectWillChange()
    }

    var state: State {
        wrappedState()
    }

    func trigger(_ input: Input) {
        wrappedTrigger(input)
    }

    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }

    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        wrappedState = { viewModel.state }
        wrappedTrigger = viewModel.trigger
    }
}

extension AnyViewModel: Identifiable where State: Identifiable {
    var id: State.ID {
        state.id
    }
}
