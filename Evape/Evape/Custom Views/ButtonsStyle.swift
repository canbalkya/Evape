//
//  ButtonsStyle.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ButtonsStyle: ButtonStyle {
    let isContinue: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .contentShape(Capsule())
            .background(ButtonBackground(isContinueButton: self.isContinue, isHighlighted: configuration.isPressed, shape: Capsule()))
            .animation(.linear)
    }
}
