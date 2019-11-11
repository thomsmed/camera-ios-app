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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerController>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .savedPhotosAlbum
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerController>) {
        
    }
    
    class Coordinator: NSObject {
        var parent: ImagePickerController
        
        init(_ imagePickerController: ImagePickerController) {
            self.parent = imagePickerController
        }
    }
}

struct ImagePickerController_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerController()
    }
}
