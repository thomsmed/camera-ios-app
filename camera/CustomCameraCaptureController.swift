//
//  CustomCameraCaptureController.swift
//  camera
//
//  Created by thomsmed on 11/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct CustomCameraCaptureController: View {
    
    @Binding var image: UIImage?
    @Binding var isOpen: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomCameraCaptureController_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraCaptureController(image: Binding.constant(nil), isOpen: Binding.constant(true))
    }
}
