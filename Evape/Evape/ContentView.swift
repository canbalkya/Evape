//
//  ContentView.swift
//  Evape
//
//  Created by Can Balkaya on 4/9/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

extension Color {
    static let darkStart = Color(red: 50/255, green: 60/255, blue: 65/255)
    static let darkEnd = Color(red: 25/255, green: 25/255, blue: 30/255)
    
    static let lightStart = Color(red: 60/255, green: 160/255, blue: 240/255)
    static let lightEnd = Color(red: 30/255, green: 80/255, blue: 120/255)
    
    static let redStart = Color(red: 220/255, green: 20/255, blue: 60/255)
    static let redEnd = Color(red: 140/255, green: 0/255, blue: 0/255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

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

var pageNumber = 1
var shapes = [Generation(number: 1, color: [20.0, 20.0, 20.0], cornerRadius: 5, rotationCount: 10, opacity: 0.3, degree: 36.0, isSelectable: false)]
var newShapes = [Generation]()
var selectedShape = [Generation]()
var isSelected = false
var whoTouch = 0

struct ButtonBackground<S: Shape>: View {
    let isContinueButton: Bool
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isContinueButton {
                if isHighlighted {
                    shape.fill(LinearGradient(Color.lightEnd, Color.lightStart)).overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: 5, y: 5).shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                } else {
                    shape.fill(LinearGradient(Color.darkStart, Color.darkEnd)).overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: -10, y: -10).shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                }
            } else {
                if isHighlighted {
                    shape.fill(LinearGradient(Color.redEnd, Color.redStart)).overlay(shape.stroke(LinearGradient(Color.redStart, Color.redEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: 5, y: 5).shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                } else {
                    shape.fill(LinearGradient(Color.darkStart, Color.darkEnd)).overlay(shape.stroke(LinearGradient(Color.redStart, Color.redEnd), lineWidth: 4)).shadow(color: Color.darkStart, radius: 10, x: -10, y: -10).shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                }
            }
        }
    }
}

struct ButtonsStyle: ButtonStyle {
    let isContinue: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.contentShape(Capsule()).background(ButtonBackground(isContinueButton: self.isContinue, isHighlighted: configuration.isPressed, shape: Capsule())).animation(.linear)
    }
}

struct Background: View {
    let shape: Generation
    let isTapped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).frame(width: 124, height: 124).foregroundColor(Color.init(red: 230/255, green: 230/255, blue: 230/255)).shadow(color: Color.darkStart, radius: 3, x: 3, y: 3).shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
            
            if isTapped {
                Group {
                    Text("\(self.shape.number)").padding(5.5).foregroundColor(Color.white).animation(.linear)
                }.background(Color.gray).clipShape(Circle()).fixedSize().offset(x: 45, y: 45)
            }
        }
    }
}

struct ElementSymbol: View {
    let shape: Generation

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Color.init(red: self.shape.color[0]/255, green: self.shape.color[1]/255, blue: self.shape.color[2]/255)).cornerRadius(self.shape.cornerRadius)
        }
    }
}

struct Element: View {
    @State var shape: Generation
    @State var isTapped: Bool
    
    var badgeSymbols: some View {
        ForEach(0..<((self.shape.rotationCount <= 0) ? 1 : self.shape.rotationCount)) { i in
            ElementSymbol(shape: self.shape).rotationEffect(.degrees(Double(i) / Double(self.shape.rotationCount)) * self.shape.degree).cornerRadius(self.shape.cornerRadius)
        }.opacity((self.shape.opacity == 0) ? 1 : self.shape.opacity).animation(.linear)
    }
    
    var body: some View {
        ZStack {
            Background(shape: self.shape, isTapped: isTapped).gesture(TapGesture().onEnded({ () in
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
            })).animation(.linear)
            
            GeometryReader { geometry in
                self.badgeSymbols.scaleEffect(1.0 / 2.0)
            }
        }.scaledToFit()
    }
}

struct ContentView: View {
    @State var showNewGenerations = false
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd).edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            selectedShape.removeAll()
                            newShapes.removeAll()
                            
                            for i in 0...3 {
                                newShapes.append(Generation(number: shapes.last!.number + 1, color: [shapes.last!.color[0] + .random(in: -10.0...10.0), shapes.last!.color[1] + .random(in: -10.0...10.0), shapes.last!.color[2] + .random(in: -10.0...10.0)], cornerRadius: shapes.last!.cornerRadius + .random(in: -5.0...5.0), rotationCount: shapes.last!.rotationCount + .random(in: -5...5), opacity: shapes.last!.opacity + .random(in: -0.1...0.1), degree: shapes.last!.degree + .random(in: -20.0...20.0), isSelectable: true, placement: i + 1))
                            }
                            
                            self.showNewGenerations = true
                        }) {
                            Group {
                                Text("+").font(.system(size: 80)).foregroundColor(Color.black).frame(width: 124, height: 124)
                            }.background(Color.init(red: 230/255, green: 230/255, blue: 230/255)).clipShape(RoundedRectangle(cornerRadius: 10)).frame(width: 124, height: 124).shadow(color: Color.darkStart, radius: 3, x: 3, y: 3).shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
                        }.padding(.leading, 16).padding(.trailing, 6).animation(.linear)
                        
                        ForEach(shapes.reversed(), id: \.self) { shape in
                            Element(shape: shape, isTapped: true)
                        }.padding(.trailing, -10).animation(.linear)
                    }
                }.frame(height: 155).padding(.bottom, -10).animation(.linear)
                
                if showNewGenerations {
                    ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(newShapes, id: \.self) { newShape in
                                Element(shape: newShape, isTapped: false)
                            }.padding(.leading, -5).padding(.trailing, -5)
                        }.padding(.leading, 6)
                    }.frame(height: 155).padding(.bottom, -5).animation(.linear)
                }
                
                HStack {
                    Button(action: {
                        if isSelected {
                            whoTouch = 0
                            selectedShape[0].isSelectable = false
                            shapes.append(selectedShape[0])
                            newShapes.removeAll()
                            selectedShape.removeAll()
                            isSelected.toggle()
                            self.showNewGenerations = false
                        } else {
                            selectedShape.removeAll()
                        }
                    }) {
                        Text("Continue").foregroundColor(.white).padding(12)
                    }.buttonStyle(ButtonsStyle(isContinue: true)).padding(.trailing, 15).animation(.linear)
                    
                    Button(action: {
                        
                    }) {
                        Text("Finish").foregroundColor(.white).padding(12)
                    }.disabled(showNewGenerations).opacity(showNewGenerations ? 0.4 : 1).buttonStyle(ButtonsStyle(isContinue: false)).animation(.linear)
                }.padding(.top, 6)
            }
        }
    }
}

struct ShowElement_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
