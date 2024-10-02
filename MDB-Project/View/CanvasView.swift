//
//  CanvasView.swift
//  MDB-Project
//
//  Created by Brayton Lordianto on 9/30/24.
//

import SwiftUI
import PencilKit

struct CanvasView: View {
    @Binding var drawing: DrawingModel
    @State var imageToOverlay: UIImage? = nil
    @State var takingPhoto: Bool = false
    
    var body: some View {
        VStack {
            Button(action: { self.takingPhoto.toggle() }, label: {
                cameraView()
            })
            DrawSpace(drawing: $drawing).edgesIgnoringSafeArea(.top)
        }
        .sheet(isPresented: $takingPhoto) {
            ImagePicker(image: $imageToOverlay)
        }
        .onChange(of: imageToOverlay) { oldValue, newValue in
            if let image = newValue {
                drawing.overlayImage(image: image)
            }
        }
    }
    
    func cameraView() -> some View {
        VStack {
            HStack {
                Spacer()
                Text("Take a Photo!")
                Image(systemName: "camera").padding()
            }
        }
    }
}


#Preview {
    CanvasView(drawing: .constant(DrawingModel.init()))
}
