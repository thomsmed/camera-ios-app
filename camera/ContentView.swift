//
//  ContentView.swift
//  camera
//
//  Created by thomsmed on 10/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: UIImage?
    
    @State var presentImagePicker = false
    @State var presentCamera = false
    @State var presentCustomCamera = false
    
    var body: some View {
        NavigationView() {
            VStack() {
                if image != nil {
                    Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                } else {
                    Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                }
                Spacer()
                VStack {
                    Button(action: { self.presentImagePicker = true }) {
                        Text("Pick image")
                    }
                    .padding()
                    .sheet(isPresented: $presentImagePicker, content: {
                        ImagePickerController(image: self.$image, isOpen: self.$presentImagePicker)
                    })
                    Button(action: { self.presentCamera = true }) {
                        Text("Default camera")
                    }
                    .padding()
                    .sheet(isPresented: $presentCamera, content: {
                        CameraCaptureController(image: self.$image, isOpen: self.$presentCamera)
                    })
                    Button(action: { self.presentCustomCamera = true }) {
                        Text("Custom camera")
                    }
                    .padding()
                    .sheet(isPresented: $presentCustomCamera, content: {
                        CustomCameraCaptureController(image: self.$image, isOpen: self.$presentCustomCamera)
                    })
                }
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(image: nil)
    }
}

