//
//  Storage.swift
//  Evape
//
//  Created by Can Balkaya on 5/22/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

class Storage {
    
    // MARK: - Functions
    func createElement(generation: Generation, showIndicator: Bool = true) -> Element {
        let element = Element(generation: generation, showIndicator: showIndicator)
        return element
    }
    
    func createGeneration(number: Int = 1, color: UIColor = UIColor(red: 255/255, green: 228/255, blue: 56/255, alpha: 1), cornerRadius: CGFloat = 5, rotationCount: Int = 20, opacity: Double = 0.3, degree: Double = 50, isSelectable: Bool = false, placement: Int = 1, heightConstant: CGFloat = 0.75, spacingConstant: CGFloat = 0.03, middleConstant: CGFloat = 2, topWidthConstant: CGFloat = 0.226, topHeightConstant: CGFloat = 0.488, yAxisConstant: CGFloat = 2) -> Generation {
        let generation = Generation(number: number, color: color, cornerRadius: cornerRadius, rotationCount: rotationCount, opacity: opacity, degree: degree, isSelectable: isSelectable, placement: placement, heightConstant: heightConstant, spacingConstant: spacingConstant, middleConstant: middleConstant, topWidthConstant: topWidthConstant, topHeightConstant: topHeightConstant, yAxisConstant: yAxisConstant)
        
        return generation
    }

    func createGenerationsWithMutation(lastGeneration: Generation) -> [Generation] {
        var newGenerations = [Generation]()
        
        for i in 0...3 {
            newGenerations.append(Generation(number: lastGeneration.number + 1, color: UIColor.addRandomColor(color: lastGeneration.color), cornerRadius: lastGeneration.cornerRadius + .random(in: -3...3), rotationCount: lastGeneration.rotationCount + .random(in: -5...5), opacity: lastGeneration.opacity + .random(in: -0.03...0.03), degree: lastGeneration.degree + .random(in: -12.0...12.0), isSelectable: true, placement: i + 1, heightConstant: lastGeneration.heightConstant + .random(in: -0.1...0.1), spacingConstant: lastGeneration.spacingConstant + .random(in: -0.01...0.01), middleConstant: lastGeneration.middleConstant + .random(in: -0.1...0.1), topWidthConstant: lastGeneration.topWidthConstant + .random(in: -0.02...0.02), topHeightConstant: lastGeneration.topHeightConstant + .random(in: -0.03...0.03), yAxisConstant: lastGeneration.yAxisConstant + .random(in: -0.1...0.1)))
        }
        
        return newGenerations
    }
    
    func createRandomGeneration() -> Generation {
        let generation = createGeneration(color: UIColor(red: .random(in: 0...255)/255, green: .random(in: 0...255)/255, blue: .random(in: 0...255)/255, alpha: 1), opacity: .random(in: 0.2...1), degree: .random(in: 2...200))
        return generation
    }
}
