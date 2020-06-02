//
//  MainView.swift
//  Evape
//
//  Created by Can Balkaya on 6/2/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ChooseView()
                .tabItem({
                    Image(systemName: "plus")
                        .font(.headline)
                    
                    Text("Create")
                })
                .tag(0)
            
            SelectiveBreedingView()
                .tabItem({
                    Image(systemName: "hand.raised.fill")
                        .font(.headline)
                    
                    Text("Select")
                })
                .tag(1)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
