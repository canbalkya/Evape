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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 124, height: 124)
                .foregroundColor(Color.init(red: 230/255, green: 230/255, blue: 230/255))
                .shadow(color: Color.darkStart, radius: 3, x: 3, y: 3)
                .shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
            
            if isTapped {
                Group {
                    Text("\(self.generation.number)")
                        .padding(5.5)
                        .foregroundColor(Color.white)
                        .animation(.linear)
                }
                .background(Color.gray)
                .clipShape(Circle())
                .fixedSize()
                .offset(x: 45, y: 45)
            }
        }
    }
}
