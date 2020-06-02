//
//  CreateView.swift
//  Evape
//
//  Created by Can Balkaya on 4/9/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct SelectiveBreedingView: View {
    
    // MARK: - Properties
    @State var generations = [Storage().createRandomGeneration()]
    @State var newGenerations = [Generation]()
    @State var isPresented = false
    let storage = Storage()
    private let sizeConstant: CGFloat = 160
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                YearIndicatorView(count: generations.count - 1, text: "\((generations.count) * 120) years")
                    .animation(.default)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(newGenerations, id: \.self) { generation in
                            self.storage.createElement(generation: generation, showIndicator: false)
                                .frame(width: 160, height: 160)
                                .padding([.leading, .trailing], 5)
                                .onTapGesture {
                                    self.generations.append(generation)
                                    self.newGenerations.removeAll()
                                }
                        }
                        .id(UUID())
                    }
                    .padding(.leading, 6)
                }
                .disabled(newGenerations.isEmpty)
                .frame(height: 160)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        Button(action: {
                            let lastGeneration = self.generations.last!
                            self.newGenerations = self.storage.createGenerationsWithMutation(lastGeneration: lastGeneration)
                        }) {
                            Image(systemName: newGenerations.isEmpty ? "plus" : "arrow.clockwise")
                                .font(.system(size: 70, weight: .heavy, design: .rounded))
                                .frame(width: self.sizeConstant, height: self.sizeConstant)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.mainBackground)
                                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                        .padding(.leading, 11)
                        .padding(.trailing, 5)
                        
                        ForEach(generations.reversed(), id: \.self) { generation in
                            self.storage.createElement(generation: generation, showIndicator: true)
                                .frame(width: self.sizeConstant, height: self.sizeConstant)
                                .padding([.leading, .trailing], 5)
                        }
                        .id(UUID())
                    }
                }
                .frame(height: self.sizeConstant)
                    
                HStack(spacing: 20) {
                    Button(action: {
                        self.isPresented = true
                    }) {
                        Text("Preview")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .padding(12)
                    }
                    .disabled(!newGenerations.isEmpty)
                    .opacity(!newGenerations.isEmpty ? 0.4 : 1)
                    .buttonStyle(ButtonsStyle())
                    
                    Button(action: {
                        self.generations.removeAll()
                        self.newGenerations.removeAll()
                        
                        self.generations = [self.storage.createRandomGeneration()]
                    }) {
                        Text("Reset")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .padding(12)
                    }
                    .disabled(!newGenerations.isEmpty)
                    .opacity(!newGenerations.isEmpty ? 0.4 : 1)
                    .buttonStyle(ButtonsStyle())
                }
                .padding(.bottom)
            }
            .animation(.default)
            .navigationBarTitle("Evape", displayMode: .automatic)
            .sheet(isPresented: $isPresented) { ResultView(generations: self.generations) }
        }
    }
}
