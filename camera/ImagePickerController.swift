//
//  ImagePickerController.swift
//  camera
//
//  Created by thomsmed on 10/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI
import UIKit

struct ImagePickerController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

struct ImagePickerController_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerController()
    }
}
