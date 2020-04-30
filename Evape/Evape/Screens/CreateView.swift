//
//  CreateView.swift
//  Evape
//
//  Created by Can Balkaya on 4/9/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    @State var generations = [Generation(number: 1, color: [20.0, 20.0, 20.0], cornerRadius: 5, rotationCount: 10, opacity: 0.3, degree: 36.0, isSelectable: false)]
    @State var newGenerations = [Generation]()
    @State var showNewGenerations = false
    @State var isPresented = false
    
    private let heightConstant: CGFloat = 125
    
    var body: some View {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        return NavigationView {
            ZStack {
                LinearGradient(Color.darkStart, Color.darkEnd)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: 60)
                    
                    ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(newGenerations, id: \.self) { generation in
                                Element(generation: generation, isTapped: false, frame: (self.heightConstant, self.heightConstant))
                            }
                            .padding(.leading, -5).padding(.trailing, -5)
                        }
                        .padding(.leading, 6)
                    }
                    .disabled(!showNewGenerations)
                    .animation(.linear)
                    .frame(height: 155)
                    .padding(.bottom, -5)
                    
                    ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                selectedShape.removeAll()
                                self.newGenerations.removeAll()
                                
                                for i in 0...3 {
                                    self.newGenerations.append(Generation(number: self.generations.last!.number + 1, color: [self.generations.last!.color[0] + .random(in: -10.0...10.0), self.generations.last!.color[1] + .random(in: -10.0...10.0), self.generations.last!.color[2] + .random(in: -10.0...10.0)], cornerRadius: self.generations.last!.cornerRadius + .random(in: -5...5), rotationCount: self.generations.last!.rotationCount + .random(in: -5...5), opacity: self.generations.last!.opacity + .random(in: -0.1...0.1), degree: self.generations.last!.degree + .random(in: -20.0...20.0), isSelectable: true, placement: i + 1))
                                }
                                
                                self.showNewGenerations = true
                            }) {
                                Group {
                                    Text("+").font(.system(size: 80))
                                        .foregroundColor(Color.black)
                                        .frame(width: 124, height: 124)
                                }
                                .background(Color.init(red: 230/255, green: 230/255, blue: 230/255))
                                .clipShape(RoundedRectangle(cornerRadius: heightConstant / 10))
                                .frame(width: 124, height: 124)
                                .shadow(color: Color.darkStart, radius: 3, x: 3, y: 3)
                                .shadow(color: Color.darkEnd, radius: 3, x: -3, y: -3)
                            }
                            .padding(.leading, 16).padding(.trailing, 6).animation(.linear)
                            
                            ForEach(generations.reversed(), id: \.self) { generation in
                                Element(generation: generation, isTapped: true, frame: (self.heightConstant, self.heightConstant))
                            }
                            .padding(.trailing, -10).animation(.linear)
                        }
                    }
                    .frame(height: 155).padding(.bottom, -10)
                    .animation(.linear)

                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        Button(action: {
                            if isSelected {
                                whoTouch = 0
                                selectedShape[0].isSelectable = false
                                self.generations.append(selectedShape[0])
                                self.newGenerations.removeAll()
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
                        .disabled(!showNewGenerations)
                        .opacity(showNewGenerations ? 1 : 0.4)
                        .buttonStyle(ButtonsStyle(isContinue: true))
                        .padding(.trailing, 15)
                        .animation(.linear)
                        
                        Button(action: {
                            self.isPresented = true
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
                    
                    Spacer()
                }
            }.sheet(isPresented: $isPresented) {
                ResultView(generations: self.generations)
            }
            .statusBar(hidden: false)
            .navigationBarTitle("Evape", displayMode: .automatic)
        }
    }
}

struct ShowElement_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
