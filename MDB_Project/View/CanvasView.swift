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
            
            HStack(alignment: .center) {
                Spacer()
                
                Button(action: { self.takingPhoto.toggle() }, label: {
                    Image(systemName: "camera").foregroundColor(.white).bold()
                })
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(1000)
                
                Button(action: {
                    drawing.canvas.drawing = PKDrawing()
                    imageToOverlay = nil
                }, label: {
                    Image(systemName: "eraser").foregroundColor(.white).bold()
                })
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(1000)
                
                    
                Spacer()
            }
            
            
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
}


#Preview {
    CanvasView(drawing: .constant(DrawingModel.init()))
}
