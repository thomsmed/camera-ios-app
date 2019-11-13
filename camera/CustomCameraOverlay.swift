//
//  CustomCameraOverlay.swift
//  camera
//
//  Created by thomsmed on 13/11/2019.
//  Copyright © 2019 Thomas A. Smedmann. All rights reserved.
//

import SwiftUI

struct CustomCameraOverlay: View {
    
    @State var didCapture: Bool = false
    
    var delegate: CustomCameraCaptureDelegate?
    
    var body: some View {
        HStack(alignment: .center) {
            if didCapture {
                Spacer()
                Button(action: {
                    self.didCapture = false
                    self.delegate?.cameraOverlayDidSelectCancel(self)
                }) {
                    Text("Avbry")
                }
                .padding()
                Spacer()
                Button(action: {
                    self.delegate?.cameraOverlayDidSelectOk(self)
                }) {
                    Text("Ok")
                }
                .padding()
                Spacer()
            } else {
                Button(action: {
                    self.didCapture = true
                    self.delegate?.cameraOverlayDidSelectCapture(self)
                }) {
                    Text("Knips!")
                }
                .padding()
            }
        }
    }
}

protocol CustomCameraCaptureDelegate {
    func cameraOverlayDidSelectCapture(_ overlayView: CustomCameraOverlay) -> Void
    func cameraOverlayDidSelectOk(_ overlayView: CustomCameraOverlay) -> Void
    func cameraOverlayDidSelectCancel(_ overlayView: CustomCameraOverlay) -> Void
}

struct CustomCameraOverlay_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraOverlay(didCapture: true, delegate: nil)
    }
}
