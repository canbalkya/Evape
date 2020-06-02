//
//  YearIndicator.swift
//  Evape
//
//  Created by Can Balkaya on 5/13/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct YearIndicatorView: View {
    
    // MARK: - Properties
    var count: Int
    var text: String
    
    // MARK: - UI Elements
    var body: some View {
        Text("\(setIndicatorText()) \(text)")
            .bold()
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.mainBackground)
            )
    }
    
    // MARK: - Functions
    func setIndicatorText() -> String {
        switch count {
        case 0:
            return "🦠"
        case 0...4:
            return "🌱"
        case 5...9:
            return "🐟"
        case 10...14:
            return "🐠"
        case 15...19:
            return "🐊"
        case 20...24:
            return "🦎"
        case 25...29:
            return "🐀"
        case 30...34:
            return "🐗"
        case 35...39:
            return "🦧"
        case 40...44:
            return "🦍"
        case 45...49:
            return "🐒"
        default:
            return "🙋‍♀️"
        }
    }
}
