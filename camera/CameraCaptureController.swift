//
//  CameraCaptureController.swift
//  camera
//
//  Created by thomsmed on 11/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct CameraCaptureController: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var isOpen: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraCaptureController>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = context.coordinator as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraCaptureController>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraCaptureController
        
        init(_ cameraPickerController: CameraCaptureController) {
            self.parent = cameraPickerController
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            // Optionally save image to Phoneo Album aswell
            //UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            parent.image = selectedImage
            parent.isOpen = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isOpen = false
        }
        
        
    }
}

struct CameraCaptureController_Previews: PreviewProvider {
    static var previews: some View {
        CameraCaptureController(image: Binding.constant(nil), isOpen: Binding.constant(true))
    }
}
