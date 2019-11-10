//
//  ContentView.swift
//  camera
//
//  Created by thomsmed on 10/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            VStack() {
                Image("apple")
                Spacer()
                VStack {
                    NavigationLink(destination: ImagePickerController()) {
                        Text("Pick image")
                    }
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Default camera")
                    }
                    .padding()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Custom camera")
                    }
                    .padding()
                }
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

