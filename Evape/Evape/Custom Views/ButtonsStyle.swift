//
//  ButtonsStyle.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ButtonsStyle: ButtonStyle {
    
    // MARK: - Functions
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(ButtonBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 10)))
            .animation(.linear)
    }
}
