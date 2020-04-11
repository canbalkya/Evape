//
//  ResultView.swift
//  Evape
//
//  Created by Can Balkaya on 4/10/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let generations: [Generation]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let heightConstant: CGFloat = 250
    
    @State var seconds = 0
    @State var index = 0
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                ForEach(generations.reversed(), id: \.self) { generation in
                    Element(generation: generation, isTapped: true, frame: (self.heightConstant, self.heightConstant)).opacity(self.index == generation.number - 1 ? 1.0 : 0.0)
                }
                .padding(.trailing, -10).animation(.linear)
            }
            .frame(height: 350)
            .padding(.bottom, -10)
            .onReceive(timer) { time in
                if self.seconds == self.generations.count {
                    self.index = 0
                    self.seconds = 0
                    
                    self.timer.upstream.connect().cancel()
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.index += 1
                }

                self.seconds += 1
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
