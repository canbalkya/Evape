//
//  Background.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct Background: View {
    let generation: Generation
    let isTapped: Bool
    let frame: (CGFloat, CGFloat)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: frame.0 / 10)
                .frame(width: frame.0, height: frame.1)
                .foregroundColor(Color.init(red: 230/255, green: 230/255, blue: 230/255))
                .shadow(color: Color.darkStart, radius: 3, x: 3, y: 3)
                .shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
            
            if isTapped {
                Group {
                    Text("\(self.generation.number)")
                        .font(.system(size: frame.0 / 8))
                        .padding(frame.0 / 20)
                        .foregroundColor(Color.white)
                        .animation(.linear)
                }
                .background(Color.gray)
                .clipShape(Circle())
                .fixedSize()
                .offset(x: (frame.0 / 2) - (frame.0 / 8), y: (frame.1 / 2) - (frame.0 / 8))
            }
        }
    }
}
