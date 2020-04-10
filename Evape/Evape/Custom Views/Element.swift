//
//  Element.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct Element: View {
    var generation: Generation
    @State var isTapped: Bool
    
    var badgeSymbols: some View {
        ForEach(0..<((self.generation.rotationCount <= 0) ? 1 : self.generation.rotationCount)) { i in
            ElementSymbol(generation: self.generation)
                .rotationEffect(.degrees(Double(i) / Double(self.generation.rotationCount)) * self.generation.degree)
                .cornerRadius(self.generation.cornerRadius)
        }
        .opacity((self.generation.opacity == 0) ? 1 : self.generation.opacity)
        .animation(.linear)
    }
    
    var body: some View {
        ZStack {
            Background(generation: self.generation, isTapped: isTapped)
                .gesture(TapGesture()
                    .onEnded({ () in
                        guard self.generation.isSelectable else { return }
                        
                        if whoTouch == 0 && isSelected == false {
                            whoTouch = self.generation.placement
                            self.isTapped.toggle()
                            isSelected.toggle()
                            selectedShape.removeAll()
                            selectedShape.append(self.generation)
                        } else if whoTouch == self.generation.placement && isSelected == true {
                            whoTouch = 0
                            self.isTapped.toggle()
                            isSelected.toggle()
                            selectedShape.removeAll()
                            selectedShape.append(self.generation)
                        }
                    }
                )
            )
            .animation(.linear)
            
            GeometryReader { geometry in
                self.badgeSymbols.scaleEffect(1 / 2)
            }
        }.scaledToFit()
    }
}
