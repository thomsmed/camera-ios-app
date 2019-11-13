//
//  CustomCameraCaptureController.swift
//  camera
//
//  Created by thomsmed on 11/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct CustomCameraCaptureController: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var isOpen: Bool
    
    @State var capture: Bool = false
    @State var finish: Bool = false
    
    var imagePickerController = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomCameraCaptureController>) -> UIImagePickerController {
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = context.coordinator as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        var customCameraOverlay = CustomCameraOverlay()
        customCameraOverlay.delegate = context.coordinator
        let cameraOverlayView = UIHostingController(rootView: customCameraOverlay).view
        let frame = imagePickerController.cameraOverlayView?.frame
        cameraOverlayView?.frame = frame!
        imagePickerController.cameraOverlayView = cameraOverlayView
//        imagePickerController.showsCameraControls = false
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CustomCameraCaptureController>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CustomCameraCaptureDelegate {
        var parent: CustomCameraCaptureController
        
        init(_ cameraPickerController: CustomCameraCaptureController) {
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
        
        func cameraOverlayDidSelectCapture(_ overlayView: CustomCameraOverlay) {
            parent.imagePickerController.takePicture()
        }
        
        func cameraOverlayDidSelectOk(_ overlayView: CustomCameraOverlay) {
            
        }
        
        func cameraOverlayDidSelectCancel(_ overlayView: CustomCameraOverlay) {
            
        }
    }
}

struct CustomCameraCaptureController_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraCaptureController(image: Binding.constant(nil), isOpen: Binding.constant(true))
    }
}
