//
//  ChooseView.swift
//  Evape
//
//  Created by Can Balkaya on 6/2/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ChooseView: View {
    
    // MARK: - Properties
    @State var color: (CGFloat, CGFloat, CGFloat) = (120, 120, 120)
    @State var cornerRadius: CGFloat = 10
    @State var rotationCount: CGFloat = 10
    @State var opacity = 0.3
    @State var degree: Double = 20
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Color:")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                        
                        VStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Red")
                                    Text(String(format: "%g", color.0))
                                        .bold()
                                }
                                
                                Slider(value: $color.0, in: 0...255, step: 1)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Green")
                                    Text(String(format: "%g", color.1))
                                        .bold()
                                }
                                
                                Slider(value: $color.1, in: 0...255, step: 1)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Blue")
                                    Text(String(format: "%g", color.2))
                                        .bold()
                                }
                                
                                Slider(value: $color.2, in: 0...255, step: 1)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    HStack {
                        Text("Corner Radius:")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                        
                        Stepper(String(format: "%g", cornerRadius), value: $cornerRadius, in: 0...100)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    HStack {
                        Text("Rotation Count:")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                        
                        Stepper(String(format: "%g", rotationCount), value: $rotationCount, in: 1...100)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Opacity:")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                            
                            Text(String(format: "%g", opacity))
                        }
                        
                        Slider(value: $opacity, in: 0...1, step: 0.01)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    HStack {
                        Text("Degree:")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                        
                        Stepper(String(format: "%g", degree), value: $degree, in: 0...500)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    Button(action: {
                        self.isPresented = true
                    }) {
                        Text("Create a new shape!")
                            .font(.system(size: 21, weight: .bold, design: .rounded))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.buttonBackground)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
            }
            .navigationBarTitle("Create Your Shape")
            .sheet(isPresented: $isPresented, content: {
                CreatedView(color: (self.color.0 / 255, self.color.1 / 255, self.color.2 / 255), cornerRadius: self.cornerRadius, rotationCount: Int(self.rotationCount), opacity: self.opacity, degree: self.degree)
            })
        }
    }
}
