//
//  ButtonBackground.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ButtonBackground<S: Shape>: View {
    let isContinueButton: Bool
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isContinueButton {
                if isHighlighted {
                    shape.fill(LinearGradient(Color.lightEnd, Color.lightStart)).overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: 5, y: 5).shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                } else {
                    shape.fill(LinearGradient(Color.darkStart, Color.darkEnd)).overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: -10, y: -10).shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                }
            } else {
                if isHighlighted {
                    shape.fill(LinearGradient(Color.redEnd, Color.redStart)).overlay(shape.stroke(LinearGradient(Color.redStart, Color.redEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: 5, y: 5).shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                } else {
                    shape.fill(LinearGradient(Color.darkStart, Color.darkEnd)).overlay(shape.stroke(LinearGradient(Color.redStart, Color.redEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: -10, y: -10).shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                }
            }
        }
    }
}
