//
//  CreateView.swift
//  Evape
//
//  Created by Can Balkaya on 4/9/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

var selectedShape = [Generation]()
var isSelected = false
var whoTouch = 0

struct CreateView: View {
    @State var shapes = [Generation(number: 1, color: [20.0, 20.0, 20.0], cornerRadius: 5, rotationCount: 10, opacity: 0.3, degree: 36.0, isSelectable: false)]
    @State var newShapes = [Generation]()
    @State var showNewGenerations = false
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            selectedShape.removeAll()
                            self.newShapes.removeAll()
                            
                            for i in 0...3 {
                                self.newShapes.append(Generation(number: self.shapes.last!.number + 1, color: [self.shapes.last!.color[0] + .random(in: -10.0...10.0), self.shapes.last!.color[1] + .random(in: -10.0...10.0), self.shapes.last!.color[2] + .random(in: -10.0...10.0)], cornerRadius: self.shapes.last!.cornerRadius + .random(in: -5...5), rotationCount: self.shapes.last!.rotationCount + .random(in: -5...5), opacity: self.shapes.last!.opacity + .random(in: -0.1...0.1), degree: self.shapes.last!.degree + .random(in: -20.0...20.0), isSelectable: true, placement: i + 1))
                            }
                            
                            self.showNewGenerations = true
                        }) {
                            Group {
                                Text("+").font(.system(size: 80))
                                    .foregroundColor(Color.black)
                                    .frame(width: 124, height: 124)
                            }.background(Color.init(red: 230/255, green: 230/255, blue: 230/255))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 124, height: 124)
                                .shadow(color: Color.darkStart, radius: 3, x: 3, y: 3)
                                .shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
                        }
                        .padding(.leading, 16).padding(.trailing, 6).animation(.linear)
                        
                        ForEach(shapes.reversed(), id: \.self) { shape in
                            Element(generation: shape, isTapped: true)
                        }
                        .padding(.trailing, -10).animation(.linear)
                    }
                }
                .frame(height: 155).padding(.bottom, -10)
                .animation(.linear)
                
                if showNewGenerations {
                    ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(newShapes, id: \.self) { newShape in
                                Element(generation: newShape, isTapped: false)
                            }
                            .padding(.leading, -5).padding(.trailing, -5)
                        }
                        .padding(.leading, 6)
                    }
                    .frame(height: 155)
                    .padding(.bottom, -5)
                    .animation(.linear)
                }
                
                HStack {
                    Button(action: {
                        if isSelected {
                            whoTouch = 0
                            selectedShape[0].isSelectable = false
                            self.shapes.append(selectedShape[0])
                            self.newShapes.removeAll()
                            selectedShape.removeAll()
                            isSelected.toggle()
                            self.showNewGenerations = false
                        } else {
                            selectedShape.removeAll()
                        }
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .padding(12)
                    }
                    .buttonStyle(ButtonsStyle(isContinue: true))
                    .padding(.trailing, 15)
                    .animation(.linear)
                    
                    Button(action: {
                        
                    }) {
                        Text("Finish")
                            .foregroundColor(.white)
                            .padding(12)
                    }
                    .disabled(showNewGenerations)
                    .opacity(showNewGenerations ? 0.4 : 1)
                    .buttonStyle(ButtonsStyle(isContinue: false))
                    .animation(.linear)
                }.padding(.top, 6)
            }
        }
    }
}

struct ShowElement_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
