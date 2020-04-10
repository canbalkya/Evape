//
//  Generation.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct Generation: Hashable {
    let number: Int
    let color: [Double]
    let cornerRadius: CGFloat
    var rotationCount: Int
    let opacity: Double
    let degree: Double
    var isSelectable: Bool
    var placement: Int = 1
}
