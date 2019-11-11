//
//  CameraCaptureController.swift
//  camera
//
//  Created by thomsmed on 11/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct CameraCaptureController: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraCaptureController>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraCaptureController>) {
        
    }
    
    class Coordinator: NSObject {
        var parent: CameraCaptureController
        
        init(_ cameraPickerController: CameraCaptureController) {
            self.parent = cameraPickerController
        }
    }
}

struct CameraCaptureController_Previews: PreviewProvider {
    static var previews: some View {
        CameraCaptureController()
    }
}
