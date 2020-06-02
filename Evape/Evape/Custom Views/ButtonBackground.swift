//
//  ButtonBackground.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ButtonBackground<S: Shape>: View {
    
    // MARK: - Properties
    var isHighlighted: Bool
    var shape: S
    
    // MARK: - UI Elements
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.highlightBackground)
            } else {
                shape
                    .fill(Color.mainBackground)
            }
        }
    }
}
