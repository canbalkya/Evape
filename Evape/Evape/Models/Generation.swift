//
//  Generation.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

public struct Generation: Hashable {
    
    // MARK: - Properties
    var number: Int
    let color: UIColor
    let cornerRadius: CGFloat
    var rotationCount: Int
    let opacity: Double
    let degree: Double
    var isSelectable: Bool
    var placement: Int
    var heightConstant: CGFloat
    var spacingConstant: CGFloat
    var middleConstant: CGFloat
    var topWidthConstant: CGFloat
    var topHeightConstant: CGFloat
    var yAxisConstant: CGFloat
}
