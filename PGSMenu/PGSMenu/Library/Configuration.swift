//
//  Configuration.swift
//  PGSMenu
//
//  Created by Pablo on 23/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import Foundation

public typealias buttonConfigurationTuple = (ButtonConfiguration<CircleButtonParameters, Any>, ButtonConfiguration<CircleButtonParameters, Any>?)
public typealias buttonConfiguration = ButtonConfiguration<CircleButtonParameters, Any>

public struct ButtonConfiguration<Enum: CaseIterable & Hashable, Value> {
    private let values: [Enum: Value]

    public init(resolver: (Enum) -> Value) {
        var values = [Enum: Value]()

        for key in Enum.allCases {
            values[key] = resolver(key)
        }

        self.values = values
    }

    subscript(key: Enum) -> Value {

        return values[key]!
    }
}
