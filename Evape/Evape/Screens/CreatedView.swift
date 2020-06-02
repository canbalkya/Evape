//
//  CreatedView.swift
//  Evape
//
//  Created by Can Balkaya on 6/2/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct CreatedView: View {
    
    // MARK: - Properties
    let color: (CGFloat, CGFloat, CGFloat)
    let cornerRadius: CGFloat
    let rotationCount: Int
    let opacity: Double
    let degree: Double
    let storage = Storage()
    
    var body: some View {
        storage.createElement(generation: storage.createGeneration(color: UIColor(red: color.0, green: color.1, blue: color.2, alpha: 1.0), cornerRadius: cornerRadius, rotationCount: rotationCount, opacity: opacity, degree: degree), showIndicator: false)
            .frame(width: 250, height: 250)
    }
}
