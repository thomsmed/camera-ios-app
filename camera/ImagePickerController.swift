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
    
    @Binding var image: UIImage?
    @Binding var isOpen: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerController>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = context.coordinator
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerController>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerController
        
        init(_ imagePickerController: ImagePickerController) {
            self.parent = imagePickerController
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            parent.image = selectedImage
            parent.isOpen = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isOpen = false
        }
    }
}

struct ImagePickerController_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerController(image: Binding.constant(nil), isOpen: Binding.constant(true))
    }
}
