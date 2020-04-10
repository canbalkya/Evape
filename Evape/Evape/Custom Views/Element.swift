//
//  Element.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct Element: View {
    @State var shape: Generation
    @State var isTapped: Bool
    
    var badgeSymbols: some View {
        ForEach(0..<((self.shape.rotationCount <= 0) ? 1 : self.shape.rotationCount)) { i in
            ElementSymbol(shape: self.shape)
                .rotationEffect(.degrees(Double(i) / Double(self.shape.rotationCount)) * self.shape.degree)
                .cornerRadius(self.shape.cornerRadius)
        }
        .opacity((self.shape.opacity == 0) ? 1 : self.shape.opacity)
        .animation(.linear)
    }
    
    var body: some View {
        ZStack {
            Background(shape: self.shape, isTapped: isTapped)
                .gesture(TapGesture()
                    .onEnded({ () in
                        guard self.shape.isSelectable else { return }
                        
                        if whoTouch == 0 && isSelected == false {
                            whoTouch = self.shape.placement
                            self.isTapped.toggle()
                            isSelected.toggle()
                            selectedShape.removeAll()
                            selectedShape.append(self.shape)
                        } else if whoTouch == self.shape.placement && isSelected == true {
                            whoTouch = 0
                            self.isTapped.toggle()
                            isSelected.toggle()
                            selectedShape.removeAll()
                            selectedShape.append(self.shape)
                        }
                    }
                )
            )
            .animation(.linear)
            
            GeometryReader { geometry in
                self.badgeSymbols.scaleEffect(1.0 / 2.0)
            }
        }.scaledToFit()
    }
}
