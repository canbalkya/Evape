//
//  Element.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct Element: View {
    
    // MARK: - Properties
    let generation: Generation
    let showIndicator: Bool
    
    // MARK: - UI Elements
    var badgeSymbols: some View {
        ForEach(0..<((self.generation.rotationCount <= 0) ? 1 : self.generation.rotationCount)) { i in
            ElementSymbol(generation: self.generation)
                .rotationEffect(.degrees(Double(i) / Double(self.generation.rotationCount)) * self.generation.degree)
                .cornerRadius(self.generation.cornerRadius)
        }
        .rotationEffect(.degrees(self.generation.degree))
        .opacity((self.generation.opacity == 0) ? 0.1 : self.generation.opacity)
        .animation(.default)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Background(generation: self.generation, showIndicator: self.showIndicator)
                
                self.badgeSymbols
                    .padding(30)
            }
        }
        .scaledToFit()
        .animation(.default)
    }
}
